`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//By: Basant Loay Abdalla
//////////////////////////////////////////////////////////////////////////////////

module division_tb();

   wire [31:0] out2; 
   reg clk;

   reg[31:0] data1;
    reg [31:0] num1;

    initial //display variables;
        $monitor ("outputReciporical = %b ",out2);
 
   always#5
     num1=32'b01000000100000000000000000000000;//4
    always#5
  //   data1=32'b01000000000000000000000000000000;//2
    data1=32'b01000000110000000000000000000000;//6
          always#5 clk = ~clk;
        initial 
        begin   
         
        clk=0;
               
      end
    
  division divisionTB(.dividend(num1),
            .divsor(data1),
            .outDiv(out2));                                   
 
endmodule