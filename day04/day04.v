// Simple ALU 8bit
module day04 (
    input [7:0]    a,
    input [7:0]    b,
    input [3:0]    OP_CODE,
    
    output reg [7:0]   aluOut
);

    localparam OP_ADD = 0;
    localparam OP_SUB = 1;
    localparam OP_SLL = 2;
    localparam OP_LSR = 3;
    localparam OP_AND = 4;
    localparam OP_OR  = 5;
    localparam OP_XOR = 6;
    localparam OP_EQL = 7;

    reg carry;

    always @(*) begin
    case (OP_CODE)
        OP_ADD: {carry, aluOut} = a+b;
        OP_SUB: aluOut = a-b;
        OP_SLL: aluOut = (a << b[2:0]);
        OP_LSR: aluOut = (a >> b[2:0]);
        OP_AND: aluOut = a & b;
        OP_OR:  aluOut = a | b;
        OP_XOR: aluOut = a ^ b;
        OP_EQL: aluOut = (a==b)?1:0;
    endcase
    end
    
endmodule