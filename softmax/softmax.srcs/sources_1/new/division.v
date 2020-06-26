`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//By: Basant Loay Abdalla
//////////////////////////////////////////////////////////////////////////////////
// The division module based on Newton Raphson method to calculate reciporical of divisor
// then multiply reciporical by Dividend
module division(dividend,divsor,outDiv);
localparam [31:0] one=32'b00111111100000000000000000000000;
input  [31:0] dividend ;
input  [31:0] divsor;
output [31:0] outDiv;
wire [31:0] reciporical2;

reciporical r1(.numerator(one),
               .divisor(divsor),
               .reciporical1(reciporical2)); 
                                                    
mul mulReciporical(.flp_a(dividend),
                   .flp_b(reciporical2),
                   .sign(outDiv[31]),
                   .exponent(outDiv[30:23]),
                   .prod(outDiv[22:0]));
endmodule
