//Aya Magdy Essam 1170018
//Aya Mahmoud Abdelfattah 1170049
`timescale 1ns / 1ps
module mul(flp_a,flp_b, sign,exponent,prod);
input [31:0] flp_a ;
input [31:0] flp_b ;
output reg sign ;
//output [7:0] exponent  ;
output [22:0] prod  ;
reg [47:0] x;
output reg [7:0] exponent;

 

 
 assign prod=x[46:24];
 

always@ * begin
if (flp_a==0||flp_b==0) 
begin 
  
  // exp_unbiased= flp_a[1:8]+flp_b[1:8]-254+1;
   sign=0;
   x=0;
   exponent=0;
    end     
   else 
   begin
     sign= flp_a[31]^flp_b[31];
     x={1,flp_a[22:0]}*{1,flp_b[22:0]};
     exponent= flp_a[30:23]+flp_b[30:23]-127+1;
     if( x[47] == 0 ) begin
     x = x <<1;
     exponent=exponent-1;
    //exp_unbiased=exp_unbiased-1;
     end 
    // for(int i=0;i<32;i++)
    end
  end

endmodule




/*
`timescale 1ns / 1ps
module mul(flp_a,flp_b, sign,exponent,prod);
input [0:31] flp_a ;
input [0:31] flp_b ;
output sign ;
output [0:7] exponent  ;
output [0:22] prod  ;
reg [0:47] x;
reg [0:7] exponent;

 assign sign= flp_a[0]^flp_b[0];
 

 
 assign prod=x[1:23];
 

always@ * begin
   x={1,flp_a[9:31]}*{1,flp_b[9:31]};
     exponent= flp_a[1:8]+flp_b[1:8]-127+1;
  
  // exp_unbiased= flp_a[1:8]+flp_b[1:8]-254+1;
   //if (x==0) 
   //begin 
     //     prod =0;
   //else 
   //begin
    if( x[0] == 0 ) begin
     x = x <<1;
     exponent=exponent-1;
    // exp_unbiased=exp_unbiased-1;
     end 
    end
 //end

endmodule
*/