module top_module();
    reg  [1:0] in;
    wire out;
    andgate dut_instance (in,out);

    initial begin
        in[0]=1'b0;in[1]=1'b0;
        #10 in[0]=~in[0];
        #10 in[0]=~in[0]; in[1]=~in[1];
        #10 in[0]=~in[0];
    end
endmodule
