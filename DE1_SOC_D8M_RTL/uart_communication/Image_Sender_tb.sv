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
    task test_with_no_external_modules;
    begin
        tx_empty = 1; // assume that data is sent in one clk cycle
        
        for(i = 0; i < 10; i=i+1) begin

            /* check present_state === READ */
            assert(dut.present_state === 3'h1) $display("[PASS] correct transition to READ");
            else $error("[FAIL] wrong transition of RDY to %d", dut.present_state);

            @(negedge clk);

            /* check present_state === WAIT_READ */
            assert(dut.present_state === 3'h2) $display("[PASS] correct transition of READ to WAIT_READ");
            else $error("[FAIL] wrong transition of READ to %d", dut.present_state);

            sdram_rd2_data = i; // simulate value read from sdram
            
            @(negedge clk);

            /* check present_state === CONVERT */
            assert(dut.present_state === 3'h3) $display("[PASS] correct transition of WAIT_READ to CONVERT");
            else $error("[FAIL] wrong transition of WAIT_READ to %d", dut.present_state);

            @(negedge clk);

            /* check present_state === WAIT_CONVERT */
            assert(dut.present_state === 3'h4) $display("[PASS] correct transition of CONVERT to WAIT_CONVERT");
            else $error("[FAIL] wrong transition of CONVERT to %d", dut.present_state);

            @(negedge clk);

            /* check RGB value (this is only for situation without RAW2RGB_J)*/
            assert(dut.Red == sdram_rd2_data) $display("[PASS] correct red");
            else $error("[FAIL] incorrect %h, red is %h", tx_data, dut.Red);
            assert(dut.Green == dut.Red+1) $display("[PASS] correct green");
            else $error("[FAIL] incorrect %h, green is %h", tx_data, dut.Green);
            assert(dut.Blue == dut.Red+2) $display("[PASS] correct blue");
            else $error("[FAIL] incorrect %h, blue is %h", tx_data, dut.Blue);

            /* check present_state === SEND */
            assert(dut.present_state === 3'h5) $display("[PASS] correct transition of WAIT_CONVERT to SEND");
            else $error("[FAIL] wrong transition of WAIT_CONVERT to %d", dut.present_state);

            @(negedge clk);
            
            /* check present_state === WAIT_SEND */
            assert(dut.present_state === 3'h6) $display("[PASS] correct transition of SEND to WAIT_SEND");
            else $error("[FAIL] wrong transition of SEND to %d", dut.present_state);

            /* check tx_data === Red */
            assert(tx_data === dut.Red) $display("[PASS] correctly send red");
            else $error("[FAIL] send incorrect value %h, red is %h", tx_data, dut.Red);

            repeat(2)@(negedge clk); // drive clock to get back to WAIT_SEND

            /* check tx_data === Green */
            assert(tx_data === dut.Green) $display("[PASS] correctly send green");
            else $error("[FAIL] send incorrect value %h, green is %h", tx_data, dut.Green);

            tx_empty = 0; // simulate when uart send takes more than 1 cycle (which will very likely happen)

            repeat(10)@(negedge clk);

            /* check fsm spins and do not send the next value */
            assert(dut.present_state === 3'h6) $display("[PASS] correctly spin uart is busy");
            else $error("[FAIL] incorrectly continue when uart is busy ");
            
            tx_empty = 1; // uart send complete

            repeat(2)@(negedge clk);

            /* check tx_data === Blue */
            assert(tx_data === dut.Blue) $display("[PASS] correctly send blue");
            else $error("[FAIL] send incorrect value %h, blue is %h", tx_data, dut.Blue);

            repeat(2)@(negedge clk); // WAIT_SEND -> SEND -> READ
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
        $display("-----------------------test with no external modules -------------------------");
        test_with_no_external_modules;
        assert(dut.present_state === 3'h0) $display("[PASS] correct transition of DONE to RDY");
        else $error("[FAIL] wrong transition of DONE to %d", dut.present_state);
        $stop;
    end
endmodule