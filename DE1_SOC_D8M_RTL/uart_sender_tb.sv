module uart_sender_tb ();
    //////////// ADC //////////
	reg		          		ADC_CONVST;
	reg		          		ADC_DIN;
	reg 		          		ADC_DOUT;
	reg		          		ADC_SCLK;

	//////////// Audio //////////
	reg 		          		AUD_ADCDAT;
	wire 		          		AUD_ADCLRCK;
	wire 		          		AUD_BCLK;
	reg		          		AUD_DACDAT;
	wire 		          		AUD_DACLRCK;
	reg		          		AUD_XCK;

	//////////// CLOCK //////////
	reg 		          		CLOCK2_50;
	reg 		          		CLOCK3_50;
	reg 		          		CLOCK4_50;
	reg 		          		CLOCK_50 = 1;

	//////////// SDRAM //////////
	reg		    [12:0]		DRAM_ADDR;
	reg		    [1:0]		DRAM_BA;
	reg		          		DRAM_CAS_N;
	reg		          		DRAM_CKE;
	reg		          		DRAM_CLK;
	reg		          		DRAM_CS_N;
	wire 		    [15:0]		DRAM_DQ;
	reg		          		DRAM_LDQM;
	reg		          		DRAM_RAS_N;
	reg		          		DRAM_UDQM;
	reg		          		DRAM_WE_N;

	//////////// I2C for Audio and Video-In //////////
	reg		          		FPGA_I2C_SCLK;
	wire 		          		FPGA_I2C_SDAT;

	//////////// SEG7 //////////
	reg		     [6:0]		HEX0;
	reg		     [6:0]		HEX1;
	reg		     [6:0]		HEX2;
	reg		     [6:0]		HEX3;
	reg		     [6:0]		HEX4;
	reg		     [6:0]		HEX5;

	//////////// IR //////////
	reg 		          		IRDA_RXD;
	reg		          		IRDA_TXD;

	//////////// KEY //////////
	reg 		     [3:0]		KEY;

	//////////// LED //////////
	reg		     [9:0]		LEDR;

	//////////// PS2 //////////
	wire 		          		PS2_CLK;
	wire 		          		PS2_CLK2;
	wire 		          		PS2_DAT;
	wire 		          		PS2_DAT2;

	//////////// SW //////////
	reg 		     [9:0]		SW;

	//////////// Video-In //////////
	reg 		          		TD_CLK27;
	reg 		     [7:0]		TD_DATA;
	reg 		          		TD_HS;
	reg		          		TD_RESET_N;
	reg 		          		TD_VS;

	//////////// VGA //////////
	reg		          		VGA_BLANK_N;
	reg		     [7:0]		VGA_B;
	reg		          		VGA_CLK;
	reg		     [7:0]		VGA_G;
	reg		          		VGA_HS;
	reg		     [7:0]		VGA_R;
	reg		          		VGA_SYNC_N;
	reg		          		VGA_VS;

	//////////// GPIO_1; GPIO_1 connect to D8M-GPIO //////////
	reg 		          		CAMERA_I2C_SCL;
	wire 		          		CAMERA_I2C_SDA;
	reg		          		CAMERA_PWDN_n;
	reg		          		MIPI_CS_n;
	wire 		          		MIPI_I2C_SCL;
	wire 		          		MIPI_I2C_SDA;
	reg		          		MIPI_MCLK;
	reg 		          		MIPI_PIXEL_CLK;
	reg 		     [9:0]		MIPI_PIXEL_D;
	reg 		          		MIPI_PIXEL_HS;
	reg 		          		MIPI_PIXEL_VS;
	reg		          		MIPI_REFCLK;
	reg		          		MIPI_RESET_n;
	//////////// GPIO_0; GPIO_0 connect to GPIO Default //////////
	wire 		    [35:0]		GPIO;
	reg[9:0] sdram_rddata;
	reg sdram_load, sdram_rd_clk;

    uart_sender dut(.*);

    always #5 CLOCK_50 = ~CLOCK_50;

    initial begin
		$monitor("state: %d", dut.is_state);
		SW = 8;
        #10; KEY[2] = 0; #10;
        wait(dut.is_state == 4'h7);
        #10;
        $stop;
    end
endmodule