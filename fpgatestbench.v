`timescale 1ns / 1ps

module fpgatestbench(io1,io2,io3,io4,io5,io6);

   reg io1reg,io2reg,io4reg,io5reg,io6reg;
   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   inout			io1;			// To/From uut of fpga.v
   inout			io2;			// To/From uut of fpga.v
   inout			io3;			// To/From uut of fpga.v
   inout			io4;			// To/From uut of fpga.v
   inout			io5;			// To/From uut of fpga.v
   inout			io6;			// To/From uut of fpga.v
   // End of automatics
   /*AUTOREGINPUT*/
   // Beginning of automatic reg inputs (for undeclared instantiated-module inputs)
   reg			clk;			// To uut of fpga.v
   // End of automatics
   fpga uut(/*AUTOINST*/
	    // Inouts
	    .io1			(io1),
	    .io2			(io2),
	    .io3			(io3),
	    .io4			(io4),
	    .io5			(io5),
	    .io6			(io6),
	    // Inputs
	    .clk			(clk));
	    
	 assign io1=io1reg;
	 assign io2=io2reg;
	 assign io4=io4reg;
	 assign io5=io5reg;
	 assign io6=io6reg;
	 
    initial
     begin
    clk=1'b0;
	io2reg=1'b0;
	io1reg=1'b0;
	io6reg=1'b1;
	io4reg=1'b0;
	io5reg=1'b0;
	#30
	io2reg=1'b0;
	io1reg=1'b1;
	io6reg=1'b0;
	io4reg=1'b0;
	io5reg=1'b1;
	#30
	io2reg=1'b0;
	io1reg=1'b1;
	io6reg=1'b1;
	io4reg=1'b1;
	io5reg=1'b1;
	#30
	io2reg=1'b1;
	io1reg=1'b1;
	io6reg=1'b1;
	io4reg=1'b0;
	io5reg=1'b0;
	#30
	io2reg=1'b1;
	io1reg=1'b1;
	io6reg=1'b0;
	io4reg=1'b0;
	io5reg=1'b0;
	#30
	io2reg=1'b0;
	io1reg=1'b0;
	io6reg=1'b1;
	io4reg=1'b0;
	io5reg=1'b1;
	#30
	io2reg=1'b0;
	io1reg=1'b1;
	io6reg=1'b1;
	io4reg=1'b0;
	io5reg=1'b0;
	#30
	io2reg=1'b0;
	io1reg=1'b1;
	io6reg=1'b1;
	io4reg=1'b1;
	io5reg=1'b1;
	#30
	io2reg=1'b1;
	io1reg=1'b1;
	io6reg=1'b1;
	io4reg=1'b0;
	io5reg=1'b0;
	#30
	io2reg=1'b1;
	io1reg=1'b1;
	io6reg=1'b1;
	io4reg=1'b0;
	io5reg=1'b0;
	#30
	io2reg=1'b0;
	io1reg=1'b0;
	io6reg=1'b1;
	io4reg=1'b0;
	io5reg=1'b1;
	#30
	io2reg=1'b0;
	io1reg=1'b1;
	io6reg=1'b1;
	io4reg=1'b0;
	io5reg=1'b0;
	#30
	io2reg=1'b0;
	io1reg=1'b0;
	io6reg=1'b1;
	io4reg=1'b0;
	io5reg=1'b0;
	#30
	io2reg=1'b0;
	io1reg=1'b1;
	io6reg=1'b0;
	io4reg=1'b0;
	io5reg=1'b1;
	#30
	io2reg=1'b0;
	io1reg=1'b1;
	io6reg=1'b1;
	io4reg=1'b0;
	io5reg=1'b1;
	#30
	io2reg=1'b1;
	io1reg=1'b0;
	io6reg=1'b1;
	io4reg=1'b0;
	io5reg=1'b0;
	#30
	io2reg=1'b1;
	io1reg=1'b0;
	io6reg=1'b0;
	io4reg=1'b0;
	io5reg=1'b0;
	#30
	io2reg=1'b0;
	io1reg=1'b1;
	io6reg=1'b1;
	io4reg=1'b0;
	io5reg=1'b1;
	#30
	io2reg=1'b1;
	io1reg=1'b1;
	io6reg=1'b1;
	io4reg=1'b0;
	io5reg=1'b0;
	#30
   
	$finish;
     end // initial begin
   
endmodule
