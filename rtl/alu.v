module parameterized_alu #(
    parameter WIDTH = 8
)(
    input  wire [WIDTH-1:0] A,
    input  wire [WIDTH-1:0] B,
    input  wire [2:0] ALU_SEL,

    output reg [WIDTH-1:0] RESULT,
    output reg ZERO,
    output reg CARRY,
    output reg BORROW
);

always @(*) begin

    // Default values
    RESULT = {WIDTH{1'b0}};
    CARRY  = 1'b0;
    BORROW = 1'b0;

    case (ALU_SEL)

        // Addition
        3'b000: begin
            {CARRY, RESULT} = A + B;
        end

        // Subtraction
        3'b001: begin
            RESULT = A - B;

            if (A < B)
                BORROW = 1'b1;
        end

        // AND
        3'b010: begin
            RESULT = A & B;
        end

        // OR
        3'b011: begin
            RESULT = A | B;
        end

        // XOR
        3'b100: begin
            RESULT = A ^ B;
        end

        // Logical left shift
        3'b101: begin
            RESULT = A << 1;
        end

        // Logical right shift
        3'b110: begin
            RESULT = A >> 1;
        end

        // Comparison
        3'b111: begin
            if (A > B)
                RESULT = {{(WIDTH-1){1'b0}}, 1'b1};
            else
                RESULT = {WIDTH{1'b0}};
        end

        default: begin
            RESULT = {WIDTH{1'b0}};
        end

    endcase

    // Zero flag
    if (RESULT == {WIDTH{1'b0}})
        ZERO = 1'b1;
    else
        ZERO = 1'b0;

end

endmodule
