`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//By: Basant Loay Abdalla
//////////////////////////////////////////////////////////////////////////////////
//using algorithm of Newton Raphson method to calculate reciporical of Divisor
//used algorithm TAKEN FROM 
//1-"https://stackoverflow.com/questions/9220498/newtons-method-for-finding-the-reciprocal-of-a-floating-point-number-for-divisi"
//2-"https://en.wikipedia.org/wiki/Division_algorithm#Newton.E2.80.93Raphson_division"
// numerator always 1
// S ==> 3 according to for single precision (S = ceil(log_2((P + 1)/log_2(17))). Where P is the number of binary places)
//
/////////////////////////////////////////////////////////////////////////////////
module reciporical(numerator,divisor,reciporical1);
localparam size=32;
localparam constant1= 32'b01000000001101001011010010011010;//48/17
localparam constant2= 32'b10111111111100001111000011110001;//-32/17
input  [31:0] numerator ;
input  [31:0] divisor;
output [31:0] reciporical1;
wire [31:0] D;
wire [31:0] numerator1;
wire [31:0] divisor1;
wire sign;
wire [31:0] X0;
wire [31:0] xi1;
wire [31:0] xi2;
wire [31:0] xi3;
wire [31:0] xi4;
wire [31:0] xi5;
wire [31:0] xi6;
wire [31:0] X0add;
//always@ (*) begin 

//assign numerator1=numerator;
//assign divisor1= divisor;
assign sign = numerator[31]^ divisor[31];// xor the sign of numerator and Divisor
assign numerator1[31]= 1'b0;
assign divisor1[31]=1'b0;
assign numerator1 [30:23]= numerator[30:23]-1-divisor[30:23]+127;
assign divisor1[30:23]=8'b1111110;//126 biased
assign numerator1[22:0]=numerator[22:0];
assign divisor1[22:0]=divisor[22:0];
assign D=divisor1; 
//end
  
// calculate Xo through 48/17-32/17 *divisor1              
mul mulD(.flp_a(divisor1),
                 .flp_b(constant2),
                 .sign(X0[31]),
                 .exponent(X0[30:23]),
                 .prod(X0[22:0]));
     
 add additionX0(.A_FP(constant1),
                .B_FP(X0),
                .out(X0add)); 
 // calculate Xn from first 4 terms of  X = X * (2-D*X)              
 Xncalculation firstterm(.D(D),
                          .X(X0add),
                          .Xn(xi1));
Xncalculation secondterm(.D(D),
                        .X(xi1),
                         .Xn(xi2));
Xncalculation thirdterm(.D(D),
                        .X(xi2),
                        .Xn(xi3));   
Xncalculation forthterm(.D(D),
                        .X(xi3),
                        .Xn(xi4));  
  //  calculate multiply of Numerator with Xn value                                                        
  mul mulNumeratorDivisor(.flp_a(xi4),
                          .flp_b(numerator1),
                          .sign(reciporical1[31]),
                          .exponent(reciporical1[30:23]),
                          .prod(reciporical1[22:0]));               


endmodule


