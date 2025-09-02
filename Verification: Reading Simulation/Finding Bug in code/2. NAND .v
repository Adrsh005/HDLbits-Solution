module top_module (input a, input b, input c, output out);//
    wire z;
    andgate inst1 ( z,a,b,c,1'b1,1'b1 );
    assign out = ~z;

endmodule
