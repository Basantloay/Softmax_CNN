`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//By: Basant Loay Abdalla
//////////////////////////////////////////////////////////////////////////////////
// module term multiply input number by its powered then multiply by constant 
module term(originalNum,poweredNum,reciporical,outPower,outTerm);
input [31:0] originalNum;
input [31:0] poweredNum;
input [31:0] reciporical;
output [31:0] outTerm;
output [31:0] outPower;
wire [31:0] t;
mul mulPower(.flp_a(originalNum),
               .flp_b(poweredNum),
               .sign(outPower[31]),
               .exponent(outPower[30:23]),
               .prod(outPower[22:0]));
assign t=outPower; 
mul mulTerm(.flp_a(t),
            .flp_b(reciporical),
            .sign(outTerm[31]),
            .exponent(outTerm[30:23]),
            .prod(outTerm[22:0]));               
endmodule
