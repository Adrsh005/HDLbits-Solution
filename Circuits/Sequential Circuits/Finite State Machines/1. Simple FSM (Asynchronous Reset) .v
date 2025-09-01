module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out);//  

    parameter A=0, B=1; 
    reg state, next_state;

    always @(*) begin    // This is a combinational always block
        // State transition logic
        case (state)
            A: next_state = (in==1)?A:B;
            B: next_state = (in==1)?B:A;
        endcase
    end

    always @(posedge clk, posedge areset) begin    // This is a sequential always block
        // State flip-flops with asynchronous reset
        if (areset)
            state=B;
        else
            state=next_state;
    end

    // Output logic
    // assign out = (state == ...);
    assign out = (state == B);

endmodule

//or

module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output reg out
);

    // State encoding
    typedef enum reg [0:0] {A = 1'b0, B = 1'b1} state_t;
    state_t state, next_state;

    always @(posedge clk or posedge areset) begin
        if (areset)
            state <= B;            // Reset to state B
        else
            state <= next_state;   // State transition
    end

    always @(*) begin
        case(state)
            B: next_state = in ? B : A;
            A: next_state = in ? B : A;
        endcase
    end

    always @(*) begin
        case(state)
            B: out = 1;
            A: out = 0;
        endcase
    end

endmodule
