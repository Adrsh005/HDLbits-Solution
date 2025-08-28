module top_module (
	input [2:0] SW,      
	input [1:0] KEY,     
	output [2:0] LEDR
  );
  
  wire l;
  wire clk;
  wire [2:0] R;
  reg [2:0] Q;
  
  assign R = SW;
  assign clk = KEY[0];
  assign l = KEY[1];
        
  always @(posedge clk) begin
    if(l)
          Q <= R;
      else
          Q <= {Q[2]^Q[1], Q[0], Q[2]};
  end
    
  assign LEDR = Q;

endmodule
