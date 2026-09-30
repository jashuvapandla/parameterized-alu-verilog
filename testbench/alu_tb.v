`timescale 1ns/1ps

module alu_tb;

    parameter WIDTH = 8;

    reg [WIDTH-1:0] A;
    reg [WIDTH-1:0] B;
    reg [2:0] ALU_SEL;

    wire [WIDTH-1:0] RESULT;
    wire ZERO;
    wire CARRY;
    wire BORROW;

    // Instantiate ALU
    parameterized_alu #(
        .WIDTH(WIDTH)
    ) DUT (
        .A(A),
        .B(B),
        .ALU_SEL(ALU_SEL),
        .RESULT(RESULT),
        .ZERO(ZERO),
        .CARRY(CARRY),
        .BORROW(BORROW)
    );

    initial begin

        // Display results
        $monitor(
            "Time=%0t | A=%d | B=%d | SEL=%b | RESULT=%d | ZERO=%b | CARRY=%b | BORROW=%b",
            $time, A, B, ALU_SEL, RESULT, ZERO, CARRY, BORROW
        );

        // Addition
        A = 8'd10;
        B = 8'd5;
        ALU_SEL = 3'b000;
        #10;

        // Subtraction
        A = 8'd10;
        B = 8'd5;
        ALU_SEL = 3'b001;
        #10;

        // AND
        A = 8'b10101010;
        B = 8'b11001100;
        ALU_SEL = 3'b010;
        #10;

        // OR
        A = 8'b10101010;
        B = 8'b11001100;
        ALU_SEL = 3'b011;
        #10;

        // XOR
        A = 8'b10101010;
        B = 8'b11001100;
        ALU_SEL = 3'b100;
        #10;

        // Left shift
        A = 8'b00001111;
        B = 8'd0;
        ALU_SEL = 3'b101;
        #10;

        // Right shift
        A = 8'b11110000;
        B = 8'd0;
        ALU_SEL = 3'b110;
        #10;

        // Comparison
        A = 8'd20;
        B = 8'd10;
        ALU_SEL = 3'b111;
        #10;

        // Zero result
        A = 8'd5;
        B = 8'd5;
        ALU_SEL = 3'b001;
        #10;

        $finish;

    end

endmodule
