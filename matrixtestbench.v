`timescale 1ns / 1ps

module matrixtestbench(wtop,wbottom,wright,wleft);
 inout [5-1:0] wtop,wbottom;
 inout [4-1:0] wleft,wright;  
  
   matrix1_1 uut(/*AUTOINST*/
		 // Inouts
		 .wtop			(wtop[5-1:0]),
		 .wbottom		(wbottom[5-1:0]),
		 .wleft			(wleft[4-1:0]),
		 .wright		(wright[4-1:0]));
		 
   reg temp;
   
   assign wright[1]=temp;
   
   initial begin
     temp=1'b0;
    #30
      temp=1'b1;
    #30
      temp=1'b0;
    #30
       temp=1'b0;
    #30
      temp=1'b1;
    #30
      temp=1'b0;
    #30
      temp=1'b0;
    #30
      temp=1'b1;
    #30
      temp=1'b0;
   #30
      temp=1'b0;
    #30
      temp=1'b0;
    #30
      temp=1'b1;
    #30
      temp=1'b0;
   #30
      temp=1'b0;
    #30
      temp=1'b0;
    #30
      temp=1'b1;
    #30
      temp=1'b0;
   #30
      temp=1'b0;
    #30
      temp=1'b0;
    #30
      temp=1'b1;
    #30
      temp=1'b0;
   #30
      temp=1'b0;
    #30
      temp=1'b0;
    #30
      temp=1'b1;
    #30
      temp=1'b0;
   #30
     $finish;
   end
   

endmodule
