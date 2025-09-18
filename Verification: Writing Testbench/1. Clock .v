module top_module ( );
    logic clk;
    dut d1 (clk);
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

endmodule
