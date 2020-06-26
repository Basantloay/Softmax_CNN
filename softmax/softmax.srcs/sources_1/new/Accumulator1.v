
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2020 12:04:44 AM
// Design Name: 
// Module Name: CSA
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


module Accumulator1(Input_Arr,Output);
    parameter size_Of_Array=4;
    parameter DATA_WIDTH=32;

    input [DATA_WIDTH*size_Of_Array-1:0] Input_Arr;
    wire [DATA_WIDTH*(size_Of_Array+1)-1:0] Output_Arr;
    output  [DATA_WIDTH-1:0] Output;
   assign Output_Arr[0+:DATA_WIDTH]=32'b0;
    
 genvar i;
    generate 
        for (i=0; i < size_Of_Array; i=i+1) 
        begin :add

    add add1(
        .A_FP(Output_Arr[DATA_WIDTH*i+:DATA_WIDTH]), 
        .B_FP(Input_Arr[DATA_WIDTH*i+:DATA_WIDTH]), 
        .out(Output_Arr[DATA_WIDTH*(i+1)+:DATA_WIDTH]));
        end
    endgenerate 
    assign Output=Output_Arr[DATA_WIDTH*size_Of_Array+:DATA_WIDTH];
  /*  always @(*)
    begin
         Output_Arr[0+:DATA_WIDTH]=32'b0;

    end*/
  
endmodule
