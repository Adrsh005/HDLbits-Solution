module top_module (
    input [7:0] code,
    output reg [3:0] out,
    output reg valid
);

    always @(*) begin
        valid = 1'b1;
        out = 4'b0; // Assign a default for out as well

        case (code)
            8'h45: out = 4'd0;
            8'h16: out = 4'd1;
            8'h1e: out = 4'd2;
            8'h26: out = 4'd3; // FIX: Was 8'd26 (decimal)
            8'h25: out = 4'd4;
            8'h2e: out = 4'd5;
            8'h36: out = 4'd6;
            8'h3d: out = 4'd7;
            8'h3e: out = 4'd8;
            8'h46: out = 4'd9; // FIX: Was 6'h46 (wrong width)
            default: begin
                valid = 1'b0;
                // 'out' will keep its default value of 0
            end
        endcase
    end
endmodule
