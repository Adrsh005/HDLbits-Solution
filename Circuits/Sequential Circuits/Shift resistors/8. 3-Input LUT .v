module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z); 
    reg [2:0] y;
    reg [7:0] x;
    assign y = {A,B,C};
    always @ (posedge clk) begin
        if (enable)
            x={x[6:0],S};
        else 
            x<=x;
    end
    always @ (*) begin
        case (y)
            3'b000: Z=x[0];
            3'b001: Z=x[1];
            3'b010: Z=x[2];
            3'b011: Z=x[3];
            3'b100: Z=x[4];
            3'b101: Z=x[5];
            3'b110: Z=x[6];
            3'b111: Z=x[7];
        endcase
    end     
endmodule
 //Or the more optimised method
module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z); 
    reg [7:0] x;
    always @ (posedge clk) begin
        if (enable)
            x={x[6:0],S};
        else 
            x<=x;
    end
    assign z = x [{A,B,C}];
endmodule
