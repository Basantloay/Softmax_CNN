`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//By: Basant Loay Abdalla
//////////////////////////////////////////////////////////////////////////////////
//all values of input array are positive as it is output of expoenetial module
// so  compare between 2 consequetive numbers'expoenent in array 
//if two exponents equal ==> compare  mantissa

module maxValue(in1,in2,outmax);
input[31:0] in1;
input[31:0] in2;
output[31:0] outmax;
reg [31:0] max=32'b00000000000000000000000000000000;

always @ (*) begin
  if(in1[30:23] > in2[30:23])
    max <= in1;
  else if (in1[30:23] < in2[30:23])
    max <= in2;
  else if (in1[30:23] == in2[30:23])
  begin
  if(in1[22:0] > in2[22:0])
      max <= in1;
    else if (in1[22:0] < in2[22:0])
      max <= in2;
      else
      max <= in1;
  end
end

assign outmax = max;
endmodule
