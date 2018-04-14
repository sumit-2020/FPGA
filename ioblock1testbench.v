module ioblocktestbench();
   
   reg 	  TS;
   reg 	  OUT;
   reg 	  IOCLK;
   wire   IN;
   wire   PIN;
   reg 	  input_output;
   reg    comingfromoutside;
 ioblock1 uut(/*AUTOINST*/
	     // Outputs
	     .IN			(IN),
	     // Inouts
	     .PIN			(PIN),
	     // Inputs
	     .TS			(TS),
	     .OUT			(OUT),
	     .IOCLK			(IOCLK));

 
   assign PIN=(input_output==1'b0)?1'bz:comingfromoutside;
   
   initial
     begin
            comingfromoutside=1'b1;
	TS           = 1'b1;
	OUT          = 1'b0;
	IOCLK      = 1'b0;
	input_output = 1'b1;
	        #30
	        comingfromoutside=1'b1;
	TS           = 1'b0;
	OUT          = 1'b1;
	IOCLK      = 1'b1;
	input_output = 1'b1;
	        #30
	        comingfromoutside=1'b0;
	TS           = 1'b1;
	OUT          = 1'b1;
	IOCLK      = 1'b0;
	input_output = 1'b0;
	        #30
	        comingfromoutside=1'b1;
	TS           = 1'b1;
	OUT          = 1'b0;
	IOCLK      = 1'b1;
	input_output = 1'b0;
	        #30
	        comingfromoutside=1'b0;
	TS           = 1'b0;
	OUT          = 1'b0;
	IOCLK      = 1'b1;
	input_output = 1'b0;
		#30
		comingfromoutside=1'b0;
	TS           = 1'b0;
	OUT          = 1'b1;
	IOCLK      = 1'b0;
	input_output = 1'b0;
		#30
		comingfromoutside=1'b1;
	TS           = 1'b1;
	OUT          = 1'b1;
	IOCLK      = 1'b1;
	input_output = 1'b0;
		#30
		comingfromoutside=1'b0;
	TS           = 1'b0;
	OUT          = 1'b1;
	IOCLK      = 1'b0;
	input_output = 1'b0;
		#30
		comingfromoutside=1'b1;
	TS           = 1'b0;
	OUT          = 1'b0;
	IOCLK      = 1'b0;
	input_output = 1'b0;
		#30
		comingfromoutside=1'b1;
	TS           = 1'b1;
	OUT          = 1'b1;
	IOCLK      = 1'b1;
	input_output = 1'b0;
	        #30
	        comingfromoutside=1'b0;
	TS           = 1'b1;
	OUT          = 1'b0;
	IOCLK      = 1'b0;
	input_output = 1'b0;
	        #30
	        comingfromoutside=1'b1;
	TS           = 1'b0;
	OUT          = 1'b1;
	IOCLK      = 1'b1;
	input_output = 1'b0;
	        #30
	        comingfromoutside=1'b0;
	TS           = 1'b1;
	OUT          = 1'b1;
	IOCLK      = 1'b0;
	input_output = 1'b0;
	        #30
	        comingfromoutside=1'b1;
	TS           = 1'b0;
	OUT          = 1'b0;
	IOCLK      = 1'b1;
	input_output = 1'b0;
	        #30
	        comingfromoutside=1'b1;
	TS           = 1'b0;
	OUT          = 1'b0;
	IOCLK      = 1'b1;
	input_output = 1'b1;
		#30
		comingfromoutside=1'b1;
	TS           = 1'b0;
	OUT          = 1'b1;
	IOCLK      = 1'b0;
	input_output = 1'b1;
		#30
		comingfromoutside=1'b0;
	TS           = 1'b0;
	OUT          = 1'b1;
	IOCLK      = 1'b1;
	input_output = 1'b1;
		#30
		comingfromoutside=1'b1;
	TS           = 1'b0;
	OUT          = 1'b1;
	IOCLK      = 1'b0;
	input_output = 1'b1;
		#30
		comingfromoutside=1'b1;
	TS           = 1'b0;
	OUT          = 1'b0;
	IOCLK      = 1'b0;
	input_output = 1'b0;
		#30
		comingfromoutside=1'b1;
	TS           = 1'b0;
	OUT          = 1'b1;
	IOCLK      = 1'b1;
	input_output = 1'b0;
	$finish;
	end
   
endmodule // ioblocktestbench
