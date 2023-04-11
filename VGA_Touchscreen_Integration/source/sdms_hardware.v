module sdms_hardware(
    input  CLOCK_50, input  [3:0] KEY, // KEY[3] is async active-low reset
             input  [9:0] SW, output  [9:0] LEDR,
             output  [7:0] VGA_R, output  [7:0] VGA_G, output  [7:0] VGA_B,
             output  VGA_HS, output  VGA_VS, output  VGA_CLK,
             output  DRAM_CLK, output  DRAM_CKE,
             output  DRAM_CAS_N, output  DRAM_RAS_N, output  DRAM_WE_N,
             output  [12:0] DRAM_ADDR, output  [1:0] DRAM_BA, output  DRAM_CS_N,
             inout  [15:0] DRAM_DQ, output  DRAM_UDQM, output  DRAM_LDQM,
             output  [6:0] HEX0, output  [6:0] HEX1, output  [6:0] HEX2,
             output  [6:0] HEX3, output  [6:0] HEX4, output  [6:0] HEX5,
    inout [35:0] GPIO_0,
    inout [35:0] GPIO_1
);

	dnn_accel_system sys(	
							.clk_clk(CLOCK_50), 
							.reset_reset_n(KEY[3]),
							.pll_locked_export(LEDR[9]),
							.vga_vga_red(VGA_R),
							.vga_vga_grn(VGA_G),
							.vga_vga_blu(VGA_B),
							.vga_vga_hsync(VGA_HS),
							.vga_vga_vsync(VGA_VS),
							.vga_vga_clk(VGA_CLK),
							.sdram_clk_clk(DRAM_CLK),
							.sdram_addr(DRAM_ADDR),
							.sdram_ba(DRAM_BA),
							.sdram_cas_n(DRAM_CAS_N),
							.sdram_cke(DRAM_CKE),
							.sdram_cs_n(DRAM_CS_N),
							.sdram_dq(DRAM_DQ),
							.sdram_dqm({DRAM_UDQM, DRAM_LDQM}),
							.sdram_ras_n(DRAM_RAS_N),
							.sdram_we_n(DRAM_WE_N),
							.hex_export(HEX0),
							.touchscreen_rxd(GPIO_0[11]),
							.touchscreen_txd(GPIO_0[10]),
        					.wifi_rxd(GPIO_1[33]),
        					.wifi_txd(GPIO_1[35])
						 );

endmodule