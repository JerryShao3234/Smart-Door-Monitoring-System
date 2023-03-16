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
    VGA_VS,

    // debugging
    state,
    rxBusy,
    rxEn,
    
    // RGB
    oRed,
    oGreen,
    oBlue
);
    input clk, rst_n;
    
    // SDRAM Read Side FIFO 2
    input[9:0] sdram_rd2_data;
    output reg sdram_rd2_load;
    output sdram_rd2_clk;
    input READ_Request;

    // rdy-enable 
    input en;
    
    // uart 
    output reg[7:0] tx_data;
    output reg txEn, txStart;
    input txDone, txBusy;
    input rxBusy;
    output reg rxEn;

    // mipi to RGB
    input VGA_HS, VGA_VS;

    // debugging
    output[3:0] state;
    output[7:0] oRed, oGreen, oBlue;

    // internal signals
    reg[7:0] H_cont, V_cont; // set to a byte for uart   
    reg [7:0] Red, Green, Blue;
    reg[18:0] num_pixels_left;
    reg[2:0] send_count;
    reg[3:0] next_state;
    wire[3:0] present_state;
    wire not_rx_busy;
    reg clk_high;
    reg[7:0] end_val;

    // state declarations
    localparam  RDY = 4'h0,
                READ = 4'h1,
                WAIT_READ =  4'h2,
                CONVERT = 4'h3,
                WAIT_CONVERT = 4'h4,
                SEND = 4'h5,
                WAIT_SEND = 4'h6,
                DONE = 4'h7,
                END_SEND = 4'h8,
                END_WAIT_SEND = 4'h9;

                
    assign state = present_state;
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
                        next_state <= END_SEND;
                    else
                        next_state <= WAIT_READ;
                end
                WAIT_READ: next_state <= CONVERT;
                CONVERT: next_state <= WAIT_CONVERT;
                WAIT_CONVERT: next_state <= SEND;
                SEND: begin
                    if(send_count >= 3'h3)
                        next_state <= READ;
                    else if(~rxBusy & ~txBusy)
                        next_state <= WAIT_SEND;
                    else
                        next_state <= SEND;
                end
                WAIT_SEND: begin
                    if(txDone)
                        next_state <= SEND;
                    else 
                        next_state <= WAIT_SEND;
                end
                END_SEND: begin
                    if(end_val < 10 & ~txBusy)
                        next_state <= END_WAIT_SEND;
                    else if(~txBusy)
                        next_state <= DONE;
                    else
                        next_state <= END_SEND;
                end
                END_WAIT_SEND: begin
                    if(txDone)
                        next_state <= END_SEND;
                    else 
                        next_state <= END_WAIT_SEND;
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
                rxEn <= 0;
                end_val <= 0;
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
                txStart <= 0;
                txEn <= 0;
                case(send_count)
                    3'h0: tx_data <= Red;
                    3'h1: tx_data <= Green;
                    3'h2: tx_data <= Blue;
                endcase
                //tx_data <= sdram_rd2_data;
                if(~rxBusy & ~txBusy) begin
                    send_count <= send_count + 1;
                    rxEn <= 1;
                end
                else if(rxBusy)begin
                    rxEn <= 1;
                end
                else begin
                    rxEn <= 0;
                end
            end
            WAIT_SEND: begin
                txStart <= 1;
                txEn <= 1;
            end
            END_SEND: begin
                txStart <= 0;
                txEn <= 0;
                tx_data <= end_val;
                if(~txBusy) begin
                    end_val <= end_val + 1;
                end
            end
            END_WAIT_SEND: begin
                txStart <= 1;
                txEn <= 1;
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
                clk_high = 0;
                sdram_rd2_load = 0;
            end
            READ: begin
                clk_high = 1;
                sdram_rd2_load = 1;
            end
            WAIT_READ: begin
                clk_high = 0;
                sdram_rd2_load = 1;
            end
            CONVERT: begin
                clk_high = 0;
                sdram_rd2_load = 0;
            end
            WAIT_CONVERT: begin
                clk_high = 0;
                sdram_rd2_load = 0;
            end
            SEND: begin
                clk_high = 0;
                sdram_rd2_load = 0;      
            end
            WAIT_SEND: begin
                clk_high = 0;
                sdram_rd2_load = 0;
            end
            END_SEND: begin
                clk_high = 0;
                sdram_rd2_load = 0;      
            end
            END_WAIT_SEND: begin
                clk_high = 0;
                sdram_rd2_load = 0;
            end
            DONE: begin
                clk_high = 0;
                sdram_rd2_load = 0; 
            end
            default: begin
                clk_high = 0;
                sdram_rd2_load = 0;
            end
        endcase
    end

    assign sdram_rd2_clk = clk_high ? clk : 0;
    assign oRed = Red;
    assign oGreen = Green;
    assign oBlue = Blue;
    
    // RAW2RGB_J s0(
    //     .iDATA(sdram_rd2_data),
    //     .RST(VGA_VS),
    //     .VGA_CLK(sdram_rd2_clk),
    //     .READ_Request(READ_Request),
    //     .VGA_VS(VGA_VS),
    //     .VGA_HS(VGA_HS),
    //     .oRed(Red),
    //     .oGreen(Green),
    //     .oBlue(Blue)
    // );
endmodule