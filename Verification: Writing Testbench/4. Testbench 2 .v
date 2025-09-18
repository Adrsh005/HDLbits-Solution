module top_module();
    logic clk;
    logic in;
    logic [2:0] s;
    logic out;
    q7 dut_instance (clk,in,s,out);
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end
    initial begin
        in = 1'b0;
        #20; in = 1'b1;
        #10; in = 1'b0;
        #10; in = 1'b1;
        #30; in = 1'b0;
    end
    initial begin
        s = 3'd2;       
        @(negedge clk); 
        s = 3'd6;
        @(negedge clk); 
        s = 3'd2;
        @(negedge clk);
        s = 3'd7;
        @(negedge clk);
        s = 3'd0;
    end

endmodule
