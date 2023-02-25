`timescale 1ps/1ps

module Image_Sender_tb();
    reg clk=1;
    reg rst_n;
    // SDRAM Read Side FIFO 2
    reg[9:0] sdram_rd2_data;
    wire sdram_rd2_clk;
    wire sdram_rd2_load;

    // rdy-enable protocol
    wire rdy; 
    reg en;

    // uart 
    wire[7:0] tx_data;
    wire tx_enable;
    wire tx_clk;
    wire ld_tx_data;
    reg tx_empty;

    // mipi to RGB
    reg READ_Request;
    reg VGA_HS; 
    reg VGA_VS;

    // loop variable
    integer i;

    Image_Sender #(.WIDTH(10), .HEIGHT(1)) dut(
        .clk(clk),
        .rst_n(rst_n),
        // SDRAM Read Side FIFO 2
        .sdram_rd2_data(sdram_rd2_data),
        .sdram_rd2_clk(sdram_rd2_clk),
        .sdram_rd2_load(sdram_rd2_load),

        // rdy-enable protocol
        .rdy(rdy),
        .en(en),

        // uart 
        .tx_data(tx_data),
        .tx_enable(tx_enable), 
        .tx_clk(tx_clk),
        .ld_tx_data(ld_tx_data),
        .tx_empty(tx_empty),

        // mipi to RGB
        .READ_Request(READ_Request),
        .VGA_HS(VGA_HS),
        .VGA_VS(VGA_VS)
    );

    always #5 clk = ~clk;
    task reset;
    begin
        rst_n = 0; 
        @(negedge clk);
        rst_n = 1;
        @(negedge clk);
    end
    endtask
    task test_with_entered_sdram_rddata;
    begin
        tx_empty = 1; // assume that data is sent in one clk cycle
        
        for(i = 0; i < 10; i=i+1) begin
            assert(dut.present_state === 3'h1) $display("[PASS] correct transition to READ");
            else $error("[FAIL] wrong transition of RDY to %d", dut.present_state);
            @(negedge clk);
            assert(dut.present_state === 3'h2) $display("[PASS] correct transition of READ to WAIT_READ");
            else $error("[FAIL] wrong transition of READ to %d", dut.present_state);
            sdram_rd2_data = i;
            @(negedge clk);
            assert(dut.present_state === 3'h3) $display("[PASS] correct transition of WAIT_READ to CONVERT");
            else $error("[FAIL] wrong transition of WAIT_READ to %d", dut.present_state);
            @(negedge clk);
            assert(dut.present_state === 3'h4) $display("[PASS] correct transition of CONVERT to WAIT_CONVERT");
            else $error("[FAIL] wrong transition of CONVERT to %d", dut.present_state);
            @(negedge clk);
            assert(dut.present_state === 3'h5) $display("[PASS] correct transition of WAIT_CONVERT to SEND");
            else $error("[FAIL] wrong transition of WAIT_CONVERT to %d", dut.present_state);
            @(negedge clk);
            assert(tx_data === dut.Red) $display("[PASS] correctly send red");
            else $error("[FAIL] send incorrect value %h, red is %h", tx_data, dut.Red);
            repeat(2)@(negedge clk);
            assert(tx_data === dut.Green) $display("[PASS] correctly send green");
            else $error("[FAIL] send incorrect value %h, green is %h", tx_data, dut.Green);
            repeat(2)@(negedge clk);
            assert(tx_data === dut.Blue) $display("[PASS] correctly send blue");
            else $error("[FAIL] send incorrect value %h, blue is %h", tx_data, dut.Blue);
            repeat(2)@(negedge clk);
            assert(tx_data === dut.H_cont) $display("[PASS] correctly send H_cont");
            else $error("[FAIL] send incorrect value %h, H_cont is %h", tx_data, dut.H_cont);
            repeat(2)@(negedge clk);
            assert(tx_data === dut.V_cont) $display("[PASS] correctly send V_cont");
            else $error("[FAIL] send incorrect value %h, V_cont is %h", tx_data, dut.V_cont);
            repeat(2)@(negedge clk);
        end
        i=0;
        en = 0; 
        @(negedge clk);
        assert(dut.present_state === 3'h7) $display("[PASS] correct transition of READ to DONE");
        else $error("[FAIL] wrong transition of READ to %d", dut.present_state);
        @(negedge clk);
    end
    endtask
    initial begin
        /* test system with simple input, test with 10 pixels*/
        reset;
        en = 1; repeat(2)@(negedge clk);
        test_with_entered_sdram_rddata;
        assert(dut.present_state === 3'h0) $display("[PASS] correct transition of DONE to RDY");
        else $error("[FAIL] wrong transition of DONE to %d", dut.present_state);
        $stop;
    end
endmodule