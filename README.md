8-Bit ALU Verilog-Vivado 2024.2-Project 
Project Description: This project implements and verifies an 8-bit Arithmetic Logic Unit(ALU)using Verilog for Xilinx Vivado 2024.2.The ALU supports arithmetic (add,subtract)and logical (AND ,OR , XOR, NOT, Shift)operations.
It includes a synthesize RTL module and a comprehensive test bench .It takes two inputs and a 3-bit operation select signal producing an 8-bit result along with Carryout and Zeroflags .
First 8-bit input operand A[7:0], Second  8-bit input operand B[7:0], ALU_Sel[2:0] selects which operation to perform 
8-bit output ALU_Out[7:0], CarruOut - Vaild for Add/Sub only , Zero- High when ALU_Out ==0
Zero flag : VERILOG assign CZero = (ALU_Out == 8'd0); The flag automatically turns 1 whenever the result becomes zero.
CarryOut is generated only during ADD and SUB :
{CarryOut , ALU_Out} = A + B; 
{CarryOut , ALU_Out} = A - B; For Logical and shift Operations ,Carryout is forced to 0.
Simuulation Notes: Carruout is set out when the result overflow in addition or subtraction .Zero is set if the result equals Zero . Iterates ALU_sel from 0 TO 7 . Applies different values of A,B. ALU OUT updates according to the selected Operations .
 ALU_Sel                    Operation                  Descripton 
 000                        ADD                         A+B 
 001                        SUB                         A-B 
 010                        AND                         A&B
 011                        OR                          A|B
 100                        XOR                         A^B
 101                        NOT                         ~A
 110                        SHL                         A<<1
 111                        SHR                         A>>1
The implemented 8-bit ALU successfully performs arithmetic and logical operations based on a 3-bit control signal, producing correct results for all eight defined functions. 
The design correctly generates the CarryOut flag for addition and subtraction and accurately asserts the Zero flag when the output becomes zero. Simulation results verify that the ALU behaves as expected for all input combinations and opcodes.
This module provides a reliable building block for larger digital systems such as processors and can be extended with additional operations or integrated into multi-bit ALUs.
