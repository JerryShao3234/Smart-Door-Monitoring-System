module RGB_VGA_FILE_logic();
    //////////// ADC //////////
	logic		          		ADC_CONVST;
	logic		          		ADC_DIN;
	logic 		          		ADC_DOUT;
	logic		          		ADC_SCLK;

	//////////// Audio //////////
	logic 		          		AUD_ADCDAT;
	logic 		          		AUD_ADCLRCK;
	logic 		          		AUD_BCLK;
	logic		          		AUD_DACDAT;
	logic 		          		AUD_DACLRCK;
	logic		          		AUD_XCK;

	//////////// CLOCK //////////
	logic 		          		CLOCK2_50;
	logic 		          		CLOCK3_50;
	logic 		          		CLOCK4_50;
	logic 		          		CLOCK_50;

	//////////// SDRAM //////////
	logic		    [12:0]		DRAM_ADDR;
	logic		    [1:0]		DRAM_BA;
	logic		          		DRAM_CAS_N;
	logic		          		DRAM_CKE;
	logic		          		DRAM_CLK;
	logic		          		DRAM_CS_N;
	logic 		    [15:0]		DRAM_DQ;
	logic		          		DRAM_LDQM;
	logic		          		DRAM_RAS_N;
	logic		          		DRAM_UDQM;
	logic		          		DRAM_WE_N;

	//////////// I2C for Audio and Video-In //////////
	logic		          		FPGA_I2C_SCLK;
	logic 		          		FPGA_I2C_SDAT;

	//////////// SEG7 //////////
	logic		     [6:0]		HEX0;
	logic		     [6:0]		HEX1;
	logic		     [6:0]		HEX2;
	logic		     [6:0]		HEX3;
	logic		     [6:0]		HEX4;
	logic		     [6:0]		HEX5;

	//////////// IR //////////
	logic 		          		IRDA_RXD;
	logic		          		IRDA_TXD;

	//////////// KEY //////////
	logic 		     [3:0]		KEY;

	//////////// LED //////////
	logic		     [9:0]		LEDR;

	//////////// PS2 //////////
	logic 		          		PS2_CLK;
	logic 		          		PS2_CLK2;
	logic 		          		PS2_DAT;
	logic 		          		PS2_DAT2;

	//////////// SW //////////
	logic 		     [9:0]		SW;

	//////////// Video-In //////////
	logic 		          		TD_CLK27;
	logic 		     [7:0]		TD_DATA;
	logic 		          		TD_HS;
	logic		          		TD_RESET_N;
	logic 		          		TD_VS;

	//////////// VGA //////////
	logic		          		VGA_BLANK_N;
	logic		     [7:0]		VGA_B;
	logic		          		VGA_CLK;
	logic		     [7:0]		VGA_G;
	logic		          		VGA_HS;
	logic		     [7:0]		VGA_R;
	logic		          		VGA_SYNC_N;
	logic		          		VGA_VS;

	//////////// GPIO_1; GPIO_1 connect to D8M-GPIO //////////
	logic 		          		CAMERA_I2C_SCL;
	logic 		          		CAMERA_I2C_SDA;
	logic		          		CAMERA_PWDN_n;
	logic		          		MIPI_CS_n;
	logic 		          		MIPI_I2C_SCL;
	logic 		          		MIPI_I2C_SDA;
	logic		          		MIPI_MCLK;
	logic 		          		MIPI_PIXEL_CLK;
	logic 		     [9:0]		MIPI_PIXEL_D;
	logic 		          		MIPI_PIXEL_HS;
	logic 		          		MIPI_PIXEL_VS;
	logic		          		MIPI_REFCLK;
	logic		          		MIPI_RESET_n;
	//////////// GPIO_0; GPIO_0 connect to GPIO Default //////////
	logic 		    [35:0]		GPIO

    DE1_SOC_D8M_RTL System(.*);
    `include "VGA_Param.h"

    initial begin
        int fd = $fopen("test.txt", "w");
        if(!fd) $error("open file failed");
        while (System.VGA_H_CNT < H_SYNC_TOTAL && System.VGA_V_CNT < V_SYNC_TOTAL) begin
            $fdisplay(fd, "%d %d %d %d %d\n", System.RED, System.GREEN, System.BLUE, System.VGA_H_CNT, System.VGA_V_CNT);
        end
    end
endmodule