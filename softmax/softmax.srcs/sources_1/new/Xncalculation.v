`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//By: Basant Loay Abdalla
//////////////////////////////////////////////////////////////////////////////////
// THIS MODULE FOR CALCULATING Xn value 
// as X = X * (2-D*X)
/////////////////////////////////////////////////////////////////////////////////
module Xncalculation(D,X,Xn);
localparam [31:0] two= 32'b01000000000000000000000000000000; // value of 2
input[31:0]D;
input[31:0]X;
output[31:0]Xn;
wire [31:0] term1;
wire [31:0] term2;
wire [31:0] term3;
wire [31:0] x1;
assign x1=X;
mul mul1(.flp_a(D),
         .flp_b(X),
         .sign(term1[31]),
         .exponent(term1[30:23]),
         .prod(term1[22:0]));
         
assign term2[31]= !term1[31];
assign term2[30:0]= term1[30:0];

add addition3(.A_FP(two),
                .B_FP(term2),
                .out(term3));
mul mul2(.flp_a(x1),
                         .flp_b(term3),
                         .sign(Xn[31]),
                         .exponent(Xn[30:23]),
                         .prod(Xn[22:0]));                
endmodule
