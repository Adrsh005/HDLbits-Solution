module top_module(clk, reset, in, out);

  input clk;
  input reset;    // Synchronous reset to state B
  input in;
  output out;
  reg out;
  reg present_state, next_state;
  parameter A=0, B=1;
  always @(posedge clk) begin
    if (reset)
      present_state <= B;
    else
      present_state <= next_state;
  end
  always @(*) begin
    case (present_state)
      A : next_state = (in==1) ? A : B;
      B : next_state = (in==1) ? B : A;
      default: next_state = A; 
    case (present_state)
      A : out = 0; // In state A, output is 0
      B : out = 1; // In state B, output is 1
      default: out = 0;
    endcase
  end

endmodule
