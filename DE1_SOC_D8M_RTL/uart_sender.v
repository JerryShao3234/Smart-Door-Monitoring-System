module uart_sender(
	input 						CLOCK_50,
	output		     [6:0]		HEX0,
	output		     [6:0]		HEX1,
	output		     [6:0]		HEX2,
	output		     [6:0]		HEX3,
	output		     [6:0]		HEX4,
	output		     [6:0]		HEX5,
	input 		     [3:0]		KEY,
	output	     [9:0]		LEDR,
	input 		     [9:0]		SW,
	inout 		    [35:0]		GPIO,
    input [9:0] sdram_rddata,
    output sdram_rd_clk,
    output sdram_load
);

    //------- added signals -------

    /* uart tx */
    wire txDone, txBusy, txEn, txStart, tx;
    wire [7:0] tx_data;

    // uart rx interface
    wire [7:0] out;
    wire rxDone;
	wire rxEn;
    wire rxBusy;
    wire rxErr, rx;
    wire[2:0] is_state, uart_state;

    wire[3:0] hundred_digit, ten_digit, digit;
	wire clk;

	reg[7:0] val;


    //------ Image Sender Module ------//
    Image_Sender #(.WIDTH(10), .HEIGHT(1)) is0(
        .clk(CLOCK_50),
        .rst_n(KEY[0]),
        .sdram_rd2_clk(sdram_rd_clk),
        .sdram_rd2_data(SW), // should be from rd2
        .sdram_rd2_load(sdram_load),
        .en(~KEY[2]), // send button
        .tx_data(tx_data),
        .txEn(txEn), 
        .txStart(txStart),
        .txDone(txDone),
        .txBusy(txBusy),
        .READ_Request(1'b1),
        .VGA_HS(VGA_HS),
        .VGA_VS(VGA_VS),
        .state(is_state),
		.rxBusy(rxBusy),
		.rxEn(rxEn)
    );

    //------ UART module ------//
    Uart8  #(
        .CLOCK_RATE(50000000), // 50 MHz
        .BAUD_RATE(9600)
    ) uart
    (
        .clk(CLOCK_50),
        // tx interface
        .tx(tx),
        .txEn(txEn),
        .txStart(txStart),
        .in(tx_data),
        .txDone(txDone),
        .txBusy(txBusy),
		.state(uart_state),
        // rx interface not used
        .rx(rx),
        .rxEn(rxEn),
        .out(out),
        .rxDone(rxDone),
        .rxBusy(rxBusy),
        .rxErr(rxErr)
    );

	// always @(negedge rxBusy) begin
	// 	val <= out;
	// end

    assign GPIO[34] = tx; 
	assign GPIO[0] = GPIO[34];
	assign rx = GPIO[0];

    assign LEDR = sdram_rddata;
	
    seven_seg_hex h0(tx_data[3:0], HEX0);
    seven_seg_hex h1(tx_data[7:4], HEX1);
    seven_seg_hex h2(out[3:0], HEX2);
    seven_seg_hex h3(out[7:4], HEX3);
	seven_seg_hex h4({1'b0, is_state}, HEX4);
    seven_seg_hex h5({1'b0, uart_state}, HEX5);
endmodule

module seven_seg_hex (input [3:0] hex_digit, output reg[6:0] hex_display);
    always @(*) begin
        case(hex_digit)
            4'b0000: hex_display = 7'b1000000;
            4'b0001: hex_display = 7'b1111001;
            4'b0010: hex_display = 7'b0100100;
            4'b0011: hex_display = 7'b0110000;
            4'b0100: hex_display = 7'b0011001;
            4'b0101: hex_display = 7'b0010010;
            4'b0110: hex_display = 7'b0000010;
            4'b0111: hex_display = 7'b1111000;
            4'b1000: hex_display = {7{1'b0}};
            4'b1001: hex_display = 7'b0010000;
            4'b1010: hex_display = 7'b0001000;
            4'b1011: hex_display = 7'b0000011;
            4'b1100: hex_display = 7'b1000110;
            4'b1101: hex_display = 7'b0100001;
            4'b1110: hex_display = 7'b0000110;
            4'b1111: hex_display = 7'b0001110;
        endcase
    end
endmodule