module Image_Sender #(parameter WIDTH=640, parameter HEIGHT=480)(
    clk,
    rst_n,
    // SDRAM Read Side FIFO 2
    sdram_rd2_data,
    sdram_rd2_clk,
    sdram_rd2_load,

    // rdy-enable protocol
    rdy, 
    en,

    // uart 
    tx_data,
    tx_enable,
    tx_clk,
    ld_tx_data,
    tx_empty,

    // mipi to RGB
    READ_Request,
    VGA_HS,
    VGA_VS
);
    input clk, rst_n;
    
    // SDRAM Read Side FIFO 2
    input[9:0] sdram_rd2_data;
    output reg sdram_rd2_clk, sdram_rd2_load;
    input READ_Request;

    // rdy-enable 
    output reg rdy;
    input en;
    
    // uart 
    output reg[7:0] tx_data;
    output reg tx_enable, tx_clk, ld_tx_data;
    input tx_empty;

    // mipi to RGB
    input READ_Request, VGA_HS, VGA_VS;

    // internal signals
    reg[7:0] H_cont, V_cont; // set to a byte for uart   
    reg [7:0] Red, Green, Blue;
    reg[18:0] num_pixels_left = WIDTH * HEIGHT;
    reg[2:0] send_count;
    reg[2:0] next_state;
    wire[2:0] present_state;

    // state declarations
    localparam  RDY = 3'h0,
                READ = 3'h1,
                WAIT_READ =  3'h2,
                CONVERT = 3'h3,
                WAIT_CONVERT = 3'h4,
                SEND = 3'h5,
                WAIT_SEND = 3'h6,
                DONE = 3'h7;

    assign present_state = next_state;

    always @(posedge clk) begin
        if(~rst_n)
            next_state <= RDY;
        else begin
            case (present_state)
                RDY:  next_state <= en ? READ : RDY;
                READ: next_state <= num_pixels_left == 0 ? DONE: WAIT_READ;
                WAIT_READ: next_state <= CONVERT;
                CONVERT: next_state <= WAIT_CONVERT;
                WAIT_CONVERT: next_state <= SEND;
                SEND: next_state <= send_count === 3'h5 ? READ : WAIT_SEND;
                WAIT_SEND: next_state <= tx_empty ? SEND : WAIT_SEND;
                DONE: next_state <= en ? DONE : RDY;
                default: next_state <= RDY;
            endcase
        end
    end
    
    always @(posedge clk) begin
        case (present_state)
            RDY:  begin
                H_cont <= 0;
                V_cont <= 0;
                send_count <= 0;
                num_pixels_left <= WIDTH * HEIGHT;
            end
            READ: begin
                num_pixels_left <= num_pixels_left - 1;
                send_count <= 0;
                if(H_cont + 1 == WIDTH)
                    V_cont <= V_cont + 1;
                else 
                    H_cont <= H_cont + 1;
            end
            /* this state is temporary for testing only*/
            WAIT_CONVERT: begin
                Red <= sdram_rd2_data + 1;
                Green <= sdram_rd2_data + 2;
                Blue <= sdram_rd2_data + 3;
            end
            /* color will be assigned by RAW2RGB_J */
            WAIT_SEND: begin
                send_count <= send_count + tx_empty;
            end
            default: begin
                H_cont <= H_cont;
                V_cont <= V_cont;
                send_count <= send_count;
                num_pixels_left <= num_pixels_left;
            end
        endcase
    end
    
    always @(*) begin
        case (present_state)
            RDY: begin
                rdy = 1;

                sdram_rd2_clk = 0;
                sdram_rd2_load = 0;

                tx_clk = 0;
                tx_enable = 0;
                ld_tx_data = 0;
                tx_data = 0;
            end
            READ: begin
                rdy = 0;

                sdram_rd2_clk = 1;
                sdram_rd2_load = 1;

                tx_clk = 0;
                tx_enable = 0;
                ld_tx_data = 0;
                tx_data = 0;
            end
            WAIT_READ: begin
                rdy = 0;

                sdram_rd2_clk = 0;
                sdram_rd2_load = 0;

                tx_clk = 0;
                tx_enable = 0;
                ld_tx_data = 0;
                tx_data = 0;
            end
            CONVERT: begin
                rdy = 0;

                sdram_rd2_clk = 0;
                sdram_rd2_load = 0;

                tx_clk = 0;
                tx_enable = 0;
                ld_tx_data = 0;
                tx_data = 0;
            end
            WAIT_CONVERT: begin
                rdy = 0;

                sdram_rd2_clk = 0;
                sdram_rd2_load = 0;

                tx_clk = 0;
                tx_enable = 0;
                ld_tx_data = 0;
                tx_data = 0;
            end
            SEND: begin
                rdy = 0;

                sdram_rd2_clk = 0;
                sdram_rd2_load = 0;

                tx_clk = 1;
                tx_enable = 1;
                ld_tx_data = 1;
                tx_data = 0;
            end
            WAIT_SEND: begin
                rdy = 0;

                sdram_rd2_clk = 0;
                sdram_rd2_load = 0;

                tx_clk = 0;
                tx_enable = 0;
                ld_tx_data = 0;
                case(send_count)
                    3'h0: tx_data = Red;
                    3'h1: tx_data = Green;
                    3'h2: tx_data = Blue;
                    3'h3: tx_data = H_cont;
                    3'h4: tx_data = V_cont;
                    default: tx_data = 0;
                endcase
            end
            DONE: begin
                rdy = 0;

                sdram_rd2_clk = 0;
                sdram_rd2_load = 0;

                tx_clk = 0;
                tx_enable = 0;
                ld_tx_data = 0;
                tx_data = 0;
            end
            default: begin
                rdy = 0;

                sdram_rd2_clk = 0;
                sdram_rd2_load = 0;

                tx_clk = 0;
                tx_enable = 0;
                ld_tx_data = 0;
                tx_data = 0;
            end
        endcase
    end
    // RAW2RGB_J				u5	(	
	// 						.RST          ( VGA_VS ),
	// 						.iDATA        ( sdram_rd2_data ),
	// 						//-----------------------------------
	// 						.VGA_CLK      ( clk ),
	// 						.READ_Request ( READ_Request ),
	// 						.VGA_VS       ( VGA_VS ),	
	// 						.VGA_HS       ( VGA_HS ) , 
	                  			
	// 						.oRed         ( Red ),
	// 						.oGreen       ( Green ),
	// 						.oBlue        ( Blue )

	// 						);		 
endmodule