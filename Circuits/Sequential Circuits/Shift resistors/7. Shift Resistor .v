module top_module (
	input clk,
	input resetn,
	input in,
	output out
);

  reg [3:0] Q;
	always @(posedge clk) begin
		if (~resetn)
      Q <= 0;
		else 
      Q <= {Q[2:0], in};
	end
	
	assign out = Q[3];		

endmodule

//OR

module top_module (
    input clk,
    input resetn,   
    input in,
    output out
  );
    
    reg [2:0] Q;
    
    always @(posedge clk) begin
      if(~resetn) begin
        Q <= 3'b0;
        out <= 1'b0;
      end
      else begin
         Q[0] <= in;
            Q[1] <= Q[0];
            Q[2] <= Q[1];
            out <= Q[2];
      end 
    end
endmodule
