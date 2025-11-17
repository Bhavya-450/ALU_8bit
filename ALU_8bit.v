`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.11.2025 18:32:50
// Design Name: 
// Module Name: ALU_8bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU_8bit (
    input  [7:0] A,
    input  [7:0] B,
    input  [2:0] ALU_Sel,
    output reg [7:0] ALU_Out,
    output reg CarryOut,
    output Zero
);

assign Zero = (ALU_Out == 8'd0);

always @(*) begin
    case (ALU_Sel)
        3'b000: {CarryOut, ALU_Out} = A + B; // Addition
        3'b001: {CarryOut, ALU_Out} = A - B; // Subtraction
        3'b010: ALU_Out = A & B;             // AND
        3'b011: ALU_Out = A | B;             // OR
        3'b100: ALU_Out = A ^ B;             // XOR
        3'b101: ALU_Out = ~A;                // NOT
        3'b110: ALU_Out = A << 1;            // Shift left
        3'b111: ALU_Out = A >> 1;            // Shift right
        default: ALU_Out = 8'd0;
    endcase
    // Handle carry for AND, OR, XOR, NOT, shifts
    if (ALU_Sel > 3'b001)
        CarryOut = 1'b0;
end

endmodule

