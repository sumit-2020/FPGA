module ioblock37(
	       inout  PIN,
	       input  TS,
	       input  OUT,
	       output IN,
	       input IOCLK
	       );
   
   reg 		     D;
   reg [2-1:0] 	     TSMUX;
   reg 		     DORREG;

   assign PIN = ( TSMUX == 2'b00 ) ? 1'bz : (( TSMUX == 2'b01 && TS == 1'b1 ) ? OUT : (( TSMUX == 2'b01 && TS == 1'b0 ) ? 1'bz : OUT));
   assign IN  = ( DORREG == 1'b0 ) ? PIN  : D;
   
   initial
     begin
	D=1'b0;
	TSMUX=2'b00;
	DORREG=1'b0;
     end
   
   always @(posedge IOCLK) D=PIN;
   
endmodule       
