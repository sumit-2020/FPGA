`timescale 1ns / 1ps

module matrixtestbench(wires);
inout [18:1] wires;
   matrix1_1 uut(/*AUTOINST*/
		 // Inouts
		 .wires			(wires[18:1]));
   reg temp;
   
   assign wires[7]=temp;
   
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
