module top_module(
    input clk,
    input a,
    input b,
    output wire out_assign,
    output reg out_always_comb,
    output reg out_always_ff   );

  //Continuous assignments (assign x = y;). Only used when not inside a procedure ("always block").
  //Procedural blocking assignment: (x = y;). Only used inside a procedure.
  //Procedural non-blocking assignment: (x <= y;). Only used inside a procedure.

    //In a combinational always block, use blocking assignments. In a clocked always block, use non-blocking assignments.

    assign out_assign = a^b;
    
    always @ (*) begin 
        out_always_comb = a^b;
    end
    
    always @ (posedge clk) begin
        out_always_ff <= a^b;
    end
    
endmodule
