`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//By: Basant Loay Abdalla
//////////////////////////////////////////////////////////////////////////////////

//calculating exponential using Taylor Expansion
module exponential(inputX,temp);
localparam size=32;
localparam noOfTerms=6;
localparam [31:0] constants[5:0]={  32'b00111010101101100000101101100001, // IEEE representation of 1/720
                                    32'b00111100000010001000100010001001, // IEEE representation of 1/120
                                    32'b00111101001010101010101010101011, // IEEE representation of 1/24
                                    32'b00111110001010101010101010101011, // IEEE representation of 1/6
                                    32'b00111111000000000000000000000000, // IEEE representation of 1/2
                                    32'b00111111100000000000000000000000}; // IEEE representation of 1  
                                                   
input [31:0] inputX;
wire  [223:0] outY;
output wire [31:0] temp;
reg[31:0] exception=32'b00111111100000000000000000000000;
wire [223:0] powerX ;
wire [223:0] holder;
reg [31:0] sum=32'b00000000000000000000000000000000;//initialized by 0

assign outY[31:0] =32'b00111111100000000000000000000000;//initialzed by 1
assign powerX[31:0] =32'b00111111100000000000000000000000;//initialzed by 1

//calculating first six terms as first of value 1 initialized in outY
// module term multiply input number consequetively and multiply by constant 
genvar z;
for ( z=0;z<noOfTerms; z=z+1)
begin
term firstTerm(.originalNum(inputX),
               .poweredNum(powerX[z*size+:size]),
               .reciporical(constants[z]),
               .outPower(powerX[(z+1)*size+:size]),
               .outTerm(holder[z*size+:size]));
               
add addition1(.A_FP( holder[z*size+:size]),
              .B_FP(outY[z*size+:size]),
              .out(outY[(z+1)*size+:size]));
end            
/*always @(*)
begin
if(inputX==0)
assign temp=exception;
else
assign temp=outY[223:192];
end */ 
assign temp=outY[223:192];
 
                                                
endmodule
 
