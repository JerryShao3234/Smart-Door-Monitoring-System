module sdms(
    input CLOCK_50,
    input [3:0] KEY,
    inout [35:0] GPIO_0,
    inout [35:0] GPIO_1
);

    sdms_sys sys(
        .clk_clk(CLOCK_50),
        .reset_reset_n(KEY[0]),
        .touchscreen_rxd(GPIO_0[11]),
        .touchscreen_txd(GPIO_0[10]),
        .wifi_rxd(GPIO_1[33]),
        .wifi_txd(GPIO_1[35])
    );

endmodule