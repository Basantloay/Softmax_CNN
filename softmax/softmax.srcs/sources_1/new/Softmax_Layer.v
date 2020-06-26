`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//By: Basant Loay Abdalla
//////////////////////////////////////////////////////////////////////////////////

module Softmax_Layer(inputData,outData,chosenProbability);
localparam sizeArr=10;
localparam width=32;
input [319:0] inputData;
output [319:0] outData;
output [31:0] chosenProbability;
wire [319:0] exponentialArr1;
wire [319:0] expoenetialArr2;
wire [319:0] expoenetialArr3;
wire [319:0] total;
//reg [31:0] total1;
wire [319:0] max1;
genvar i;
//calculate exponential for input array
for (i=0;i<sizeArr;i=i+1)
begin
exponential E(.inputX(inputData[i*width+:width]),
              .temp(exponentialArr1[i*width+:width]));
assign expoenetialArr2[i*width+:width] = exponentialArr1[i*width+:width];             
end

//calculate sum of 10 values 
Accumulator1 
#(
.size_Of_Array(sizeArr),
.DATA_WIDTH(width)
)
exponentialAddition(
.Input_Arr(exponentialArr1),
.Output(total[31:0])
);
// total1=total;
for (i=0;i<sizeArr-1;i=i+1)
begin
assign total[(i+1)*width+:width]= total[i*width+:width];
end 

//apply division module to calculate probability in array
for (i=0;i<sizeArr;i=i+1)
begin
division div(.dividend(expoenetialArr2[i*width+:width]),
             .divsor(total[i*width+:width]),
             .outDiv(outData[i*width+:width])); 
assign expoenetialArr3[i*width+:width] = outData[i*width+:width];                        
end

//calculate maximum value in array
assign max1[31:0]= expoenetialArr3[31:0];
for (i=1;i<sizeArr;i=i+1)
begin
maxValue max1V(.in1(max1[(i-1)*width+:width]),
              .in2(expoenetialArr3[i*width+:width]),
              .outmax(max1[i*width+:width]));
end
assign chosenProbability = max1[319:288];

endmodule
