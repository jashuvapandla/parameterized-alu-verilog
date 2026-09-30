# parameterized-alu-verilog
Designed a parameterized N-bit ALU in Verilog supporting addition, subtraction, AND, OR, XOR, left/right shifts, and comparison. Implemented zero, carry, and borrow flags, and developed a testbench to verify functional correctness across multiple input combinations and arithmetic edge cases.

## Overview

Designed and verified a parameterized Arithmetic Logic Unit (ALU)
using Verilog HDL.

The ALU supports arithmetic, logical, shift and comparison operations.

## Features

- Parameterized data width
- Addition
- Subtraction
- AND
- OR
- XOR
- Logical left shift
- Logical right shift
- Greater-than comparison
- Zero flag
- Carry flag
- Borrow flag

## ALU Operation Table

| ALU_SEL | Operation |
|---------|-----------|
| 000 | Addition |
| 001 | Subtraction |
| 010 | AND |
| 011 | OR |
| 100 | XOR |
| 101 | Left Shift |
| 110 | Right Shift |
| 111 | Comparison |

## Design Concepts

- Combinational logic
- Multiplexing
- Arithmetic circuits
- Verilog parameterization
- RTL design
- Functional verification

## Verification

A Verilog testbench was developed to verify all ALU operations
with different input combinations.

The design was also tested for zero results and arithmetic carry/borrow conditions.

## Tools

- Verilog HDL
- Vivado
