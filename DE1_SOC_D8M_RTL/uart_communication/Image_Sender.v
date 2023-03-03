module Image_Sender #(parameter WIDTH=640, parameter HEIGHT=480)(
    clk,
    rst_n,
    // SDRAM Read Side FIFO 2
    sdram_rd2_data,
    sdram_rd2_clk,
    sdram_rd2_load,

    // rdy-enable protocol
    en,

    // uart 
    tx_data,
    txEn,
    txStart,
    txDone,
    txBusy,

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
    input en;
    
    // uart 
    output reg[7:0] tx_data;
    output reg txEn, txStart;
    input txDone, txBusy;

    // mipi to RGB
    input VGA_HS, VGA_VS;

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
                RDY: begin
                    if(en & 1)
                        next_state <= READ;
                    else
                        next_state <= RDY;
                end
                READ: begin
                    if(num_pixels_left == 0)
                        next_state <= DONE;
                    else
                        next_state <= WAIT_READ;
                end
                WAIT_READ: next_state <= CONVERT;
                CONVERT: next_state <= WAIT_CONVERT;
                WAIT_CONVERT: next_state <= SEND;
                SEND: begin
                    if(send_count === 3'h3)
                        next_state <= READ;
                    else if(txBusy & 1)
                        next_state <= WAIT_SEND;
                    else
                        next_state <= SEND;
                end
                WAIT_SEND: begin
                    if(txBusy & 1)
                        next_state <= WAIT_SEND;
                    else 
                        next_state <= SEND;
                end
                DONE: begin
                    if(en & 1)
                        next_state <= DONE;
                    else 
                        next_state <= RDY;
                end
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
                Red <= sdram_rd2_data;
                Green <= sdram_rd2_data + 1;
                Blue <= sdram_rd2_data + 2;
            end
            /* color will be assigned by RAW2RGB_J */
            SEND: begin
                if(send_count != 3'h3 && txBusy & 1)
                    send_count <= send_count + 1;
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
                sdram_rd2_clk = 0;
                sdram_rd2_load = 0;

                txStart = 0;
                txEn = 0;
                
                tx_data = 0;
            end
            READ: begin
                sdram_rd2_clk = 1;
                sdram_rd2_load = 1;

                txStart = 0;
                txEn = 0;
                
                tx_data = 0;
            end
            WAIT_READ: begin
                sdram_rd2_clk = 0;
                sdram_rd2_load = 0;

                txStart = 0;
                txEn = 0;
                
                tx_data = 0;
            end
            CONVERT: begin
                sdram_rd2_clk = 0;
                sdram_rd2_load = 0;

                txStart = 0;
                txEn = 0;
                
                tx_data = 0;
            end
            WAIT_CONVERT: begin
                sdram_rd2_clk = 0;
                sdram_rd2_load = 0;

                txStart = 0;
                txEn = 0;
                
                tx_data = 0;
            end
            SEND: begin
                sdram_rd2_clk = 0;
                sdram_rd2_load = 0;

                txStart= 1;
                txEn = 1;
                
                case(send_count)
                    3'h0: tx_data = Red;
                    3'h1: tx_data = Green;
                    3'h2: tx_data = Blue;
                    default: tx_data = 0;
                endcase
            end
            WAIT_SEND: begin
                sdram_rd2_clk = 0;
                sdram_rd2_load = 0;

                txStart = 0;
                txEn = 0;
                
                tx_data = 0;
            end
            DONE: begin
                sdram_rd2_clk = 0;
                sdram_rd2_load = 0;

                txStart = 0;
                txEn = 0;
                
                tx_data = 0;
            end
            default: begin
                sdram_rd2_clk = 0;
                sdram_rd2_load = 0;

                txStart = 0;
                txEn = 0;
                
                tx_data = 0;
            end
        endcase
    end	 
endmodule