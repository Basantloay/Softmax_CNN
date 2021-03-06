`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//By: Basant Loay Abdalla
//////////////////////////////////////////////////////////////////////////////////

module exponential_tb();
  // reg [159:0] expArr=160'b0011111110000000000000000000000001000000001011011111100001010100010000001110110001110011001001010011111010111100010110101011000100111110000010101001010101010101;
 //  reg [159:0] datain=160'b0000000000000000000000000000000000111111100000000000000000000000010000000000000000000000000000001011111110000000000000000000000011000000000000000000000000000000;
   wire [31:0] outS; 
   reg clk;
   reg[31:0] data;
    initial 
    $monitor ("outputExponential = %b ",outS);
    
    
   // always#5 data=32'b00111111100000000000000000000000;//1
   always#15  data=32'b10111111100000000000000000000000;//-1
   //always#25 data=32'b00000000000000000000000000000000;//0
  // always#35 data=32'b10111111000000000000000000000000;//-0.5
  // always#45 data=32'b00111111001100110011001100110011;//0.7
  // always#55 data=32'b00111111000001111010111000010100; //0.53
  // always#65 data=32'b10111110011010111000010100011111;//-0.23
  //    always#75  data=32'10111111010111010111000010100100;//-0.865
   //   always#85 data=32'b00111110101101001101011010100001;//0.3532
   //   always#95 data=32'b00111111000111101111100111011011;//0.621
   //   always#105 data=32'b00111101111111001110110110010001;//0.1235
    
          always#10 clk = ~clk;
          
          
        initial 
        begin   
         
        clk=1;
               
      end
    exponential Exponential2(.inputX(data),
                                .temp(outS));
                              
 /*  generate  
                   
      for (i=0; i < 5 ; i=i+1)  
      begin
        exponential Exponential1(.inputX(datain[bitsize*i+:bitsize]),
                                  .outY(out));
                                
      //  outS = expArr[i:i+31];                  
      end   
        .powerX(power),
                                      .holder(holder1),                 
    endgenerate    */
   
 


endmodule
