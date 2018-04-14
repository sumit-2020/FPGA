`timescale 1ns / 1ps

module matrix1(wires);
   
   inout [18:1] wires;

   reg [5-1:0] driverforwire1;
   reg [5-1:0] driverforwire2;
   reg [5-1:0] driverforwire3;
   reg [5-1:0] driverforwire4;
   reg [5-1:0] driverforwire5;
   reg [5-1:0] driverforwire6;
   reg [5-1:0] driverforwire7;
   reg [5-1:0] driverforwire8;
   reg [5-1:0] driverforwire9;
   reg [5-1:0] driverforwire10;
   reg [5-1:0] driverforwire11;
   reg [5-1:0] driverforwire12;
   reg [5-1:0] driverforwire13;
   reg [5-1:0] driverforwire14;
   reg [5-1:0] driverforwire15;
   reg [5-1:0] driverforwire16;
   reg [5-1:0] driverforwire17;
   reg [5-1:0] driverforwire18;
   
   initial
     begin
	driverforwire1 	 = 5'b00000;
	driverforwire2 	 = 5'b00000;
	driverforwire3 	 = 5'b00000;
	driverforwire4 	 = 5'b00000;
	driverforwire5 	 = 5'b00000;
	driverforwire6 	 = 5'b00000;
	driverforwire7 	 = 5'b00000;
	driverforwire8 	 = 5'b00000;
	driverforwire9 	 = 5'b00000;
	driverforwire10  = 5'b00000;
	driverforwire11  = 5'b00000;
	driverforwire12  = 5'b00000;
	driverforwire13  = 5'b00000;
	driverforwire14  = 5'b00000;
	driverforwire15  = 5'b00000;
	driverforwire16  = 5'b00000;
	driverforwire17  = 5'b00000;
	driverforwire18  = 5'b00000;
     end
   assign wires[1]  = ( driverforwire1 == 5'b00000 ) ? 1'bz : wires[driverforwire1];
   assign wires[2]  = ( driverforwire2 == 5'b00000 ) ? 1'bz : wires[driverforwire2];
   assign wires[3]  = ( driverforwire3 == 5'b00000 ) ? 1'bz : wires[driverforwire3];
   assign wires[4]  = ( driverforwire4 == 5'b00000 ) ? 1'bz : wires[driverforwire4];
   assign wires[5]  = ( driverforwire5 == 5'b00000 ) ? 1'bz : wires[driverforwire5];
   assign wires[6]  = ( driverforwire6 == 5'b00000 ) ? 1'bz : wires[driverforwire6];
   assign wires[7]  = ( driverforwire7 == 5'b00000 ) ? 1'bz : wires[driverforwire7];
   assign wires[8]  = ( driverforwire8 == 5'b00000 ) ? 1'bz : wires[driverforwire8];
   assign wires[9]  = ( driverforwire9 == 5'b00000 ) ? 1'bz : wires[driverforwire9];
   assign wires[10]  = ( driverforwire10 == 5'b00000 ) ? 1'bz : wires[driverforwire10];
   assign wires[11]  = ( driverforwire11 == 5'b00000 ) ? 1'bz : wires[driverforwire11];
   assign wires[12]  = ( driverforwire12 == 5'b00000 ) ? 1'bz : wires[driverforwire12];
   assign wires[13]  = ( driverforwire13 == 5'b00000 ) ? 1'bz : wires[driverforwire13];
   assign wires[14]  = ( driverforwire14 == 5'b00000 ) ? 1'bz : wires[driverforwire14];
   assign wires[15]  = ( driverforwire15 == 5'b00000 ) ? 1'bz : wires[driverforwire15];
   assign wires[16]  = ( driverforwire16 == 5'b00000 ) ? 1'bz : wires[driverforwire16];
   assign wires[17]  = ( driverforwire17 == 5'b00000 ) ? 1'bz : wires[driverforwire17];
   assign wires[18]  = ( driverforwire18 == 5'b00000 ) ? 1'bz : wires[driverforwire18];
   
endmodule
