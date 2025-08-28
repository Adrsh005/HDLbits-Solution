module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q
    wire L,clk;
    assign {L,clk}=KEY;
    reg [2:0] q,;    
    always @ (posedge clk) begin
        if (L)
            q<=SW;
        else
            q<={q[2]^q[1],q[0],q[2]};
    end
    assign LEDR=q;
endmodule
