module fpga(
	    inout io1,
	    inout io2,
	    inout io3,
	    inout io4,
	    inout io5,
	    inout io6,
	    input clk);

   reg [3-1:0]  	  out1select,in1select,ts1select;
   reg [3-1:0] 		  out2select,in2select,ts2select; 
   reg [3-1:0] 		  out3select,in3select,ts3select; 
   reg [3-1:0] 		  out4select,in4select,ts4select; 
   reg [3-1:0] 		  out5select,in5select,ts5select; 
   reg [3-1:0] 		  out6select,in6select,ts6select;

   reg [3-1:0] 		  Aselect,Bselect,Cselect,Dselect,Kselect,Xselect,Yselect;

   wire 		  IN1, OUT1, TS1;
   wire 		  IN2, OUT2, TS2;
   wire 		  IN3, OUT3, TS3;
   wire 		  IN4, OUT4, TS4;
   wire 		  IN5, OUT5, TS5;
   wire 		  IN6, OUT6, TS6;

   wire 		  A,B,C,D,K,X,Y;
   
   wire [1:4] 		  row1_1,row2_1;
   wire [1:5] 		  col1_1,col2_1;

   initial
     begin

	ts1select = 3'd0; out1select = 3'd0; in1select = 3'd2;
	ts2select = 3'd0; out2select = 3'd0; in2select = 3'd1;
	ts3select = 3'd0; out3select = 3'd3; in3select = 3'd0;
	ts4select = 3'd0; out4select = 3'd0; in4select = 3'd2;
	ts5select = 3'd0; out5select = 3'd0; in5select = 3'd4;
	ts6select = 3'd0; out6select = 3'd0; in6select = 3'd4;

	Aselect = 3'd1; Bselect = 3'd5; Cselect = 3'd4; Dselect = 3'd2; Kselect = 3'd3; Xselect = 3'd3; Yselect = 3'd0;	
	
     end

   assign A    = ( Aselect == 3'd0    ) ? 1'bz : row1_1[Aselect];
   assign B    = ( Bselect == 3'd0    ) ? 1'bz : col1_1[Bselect];
   assign C    = ( Cselect == 3'd0    ) ? 1'bz : col1_1[Cselect];
   assign D    = ( Dselect == 3'd0    ) ? 1'bz : row2_1[Dselect];
   assign K    = ( Kselect == 3'd0    ) ? 1'bz : col1_1[Kselect];
   
   
   assign OUT1 = ( out1select == 3'd0 ) ? 1'bz : row1_1[out1select];
   assign OUT2 = ( out2select == 3'd0 ) ? 1'bz : row1_1[out2select];
   assign OUT3 = ( out3select == 3'd0 ) ? 1'bz : col2_1[out3select];
   assign OUT4 = ( out4select == 3'd0 ) ? 1'bz : row2_1[out4select];
   assign OUT5 = ( out5select == 3'd0 ) ? 1'bz : row2_1[out5select];
   assign OUT6 = ( out6select == 3'd0 ) ? 1'bz : col1_1[out6select];

   assign TS1 = ( ts1select == 3'd0 ) ? 1'bz : row1_1[ts1select];
   assign TS2 = ( ts2select == 3'd0 ) ? 1'bz : row1_1[ts2select];
   assign TS3 = ( ts3select == 3'd0 ) ? 1'bz : col2_1[ts3select];
   assign TS4 = ( ts4select == 3'd0 ) ? 1'bz : row2_1[ts4select];
   assign TS5 = ( ts5select == 3'd0 ) ? 1'bz : row2_1[ts5select];
   assign TS6 = ( ts6select == 3'd0 ) ? 1'bz : col1_1[ts6select];
   

   assign row1_1[1] = ( in1select == 3'd1 ) ? IN1 : (( in2select == 3'd1) ? IN2 : 1'bz);
   assign row1_1[2] = ( in1select == 3'd2 ) ? IN1 : (( in2select == 3'd2) ? IN2 : 1'bz);
   assign row1_1[3] = ( in1select == 3'd3 ) ? IN1 : (( in2select == 3'd3) ? IN2 : 1'bz);
   assign row1_1[4] = ( in1select == 3'd4 ) ? IN1 : (( in2select == 3'd4) ? IN2 : 1'bz);

   assign col2_1[1] = ( in3select == 3'd1 ) ? IN3 : (( Xselect == 3'd1 ) ? X :( ( Yselect == 3'd1) ? Y : 1'bz));
   assign col2_1[2] = ( in3select == 3'd2 ) ? IN3 : (( Xselect == 3'd2 ) ? X :( ( Yselect == 3'd2) ? Y : 1'bz));
   assign col2_1[3] = ( in3select == 3'd3 ) ? IN3 : (( Xselect == 3'd3 ) ? X :( ( Yselect == 3'd3) ? Y : 1'bz));
   assign col2_1[4] = ( in3select == 3'd4 ) ? IN3 : (( Xselect == 3'd4 ) ? X :( ( Yselect == 3'd4) ? Y : 1'bz));
   assign col2_1[5] = ( in3select == 3'd5 ) ? IN3 : (( Xselect == 3'd5 ) ? X :( ( Yselect == 3'd5) ? Y : 1'bz));

   assign row2_1[1] = ( in4select == 3'd1 ) ? IN4 : (( in5select == 3'd1) ? IN5 : 1'bz);
   assign row2_1[2] = ( in4select == 3'd2 ) ? IN4 : (( in5select == 3'd2) ? IN5 : 1'bz);
   assign row2_1[3] = ( in4select == 3'd3 ) ? IN4 : (( in5select == 3'd3) ? IN5 : 1'bz);
   assign row2_1[4] = ( in4select == 3'd4 ) ? IN4 : (( in5select == 3'd4) ? IN5 : 1'bz);

   assign col1_1[1] = ( in6select == 3'd1 ) ? IN6 : 1'bz;
   assign col1_1[2] = ( in6select == 3'd2 ) ? IN6 : 1'bz;
   assign col1_1[3] = ( in6select == 3'd3 ) ? IN6 : 1'bz;
   assign col1_1[4] = ( in6select == 3'd4 ) ? IN6 : 1'bz;
   assign col1_1[5] = ( in6select == 3'd5 ) ? IN6 : 1'bz;
   

   ioblock1 iob1(.PIN(io1),.TS(TS1),.OUT(OUT1),.IN(IN1),.IOCLK(clk));
   ioblock2 iob2(.PIN(io2),.TS(TS2),.OUT(OUT2),.IN(IN2),.IOCLK(clk));
   ioblock3 iob3(.PIN(io3),.TS(TS3),.OUT(OUT3),.IN(IN3),.IOCLK(clk));
   ioblock4 iob4(.PIN(io4),.TS(TS4),.OUT(OUT4),.IN(IN4),.IOCLK(clk));
   ioblock5 iob5(.PIN(io5),.TS(TS5),.OUT(OUT5),.IN(IN5),.IOCLK(clk));
   ioblock6 iob6(.PIN(io6),.TS(TS6),.OUT(OUT6),.IN(IN6),.IOCLK(clk));
/*   
   assign wiresmat1_1={ 5'bzzzzz , row1_1  , col1_1[5] , col1_1[4] , col1_1[3], col1_1[2], col1_1[1], 4'bzzzz     };
   assign wiresmat1_2={ 5'bzzzzz , 4'bzzzz , col2_1[5] , col2_1[4] , col2_1[3], col2_1[2], col2_1[1], row1_1[4], row1_1[3], row1_1[2], row1_1[1] };
   assign wiresmat2_1={ col1_1   , row2_1  , 5'bzzzzz    , 4'bzzzz     };
   assign wiresmat2_2={ col2_1   , 4'bzzzz , 5'bzzzzz    , row2_1[4], row2_1[3], row2_1[2], row2_1[1] };
*/
   matrix1_1 mat1_1(.wires({ 5'bzzzzz , row1_1  , col1_1[5] , col1_1[4] , col1_1[3], col1_1[2], col1_1[1], 4'bzzzz     }));
   
   matrix1_2 mat1_2(.wires({ 5'bzzzzz , 4'bzzzz , col2_1[5] , col2_1[4] , col2_1[3], col2_1[2], col2_1[1], row1_1[4], row1_1[3], row1_1[2], row1_1[1] }));
   matrix2_1 mat2_1(.wires({ col1_1   , row2_1  , 5'bzzzzz    , 4'bzzzz     }));
   matrix2_2 mat2_2(.wires({ col2_1   , 4'bzzzz , 5'bzzzzz    , row2_1[4], row2_1[3], row2_1[2], row2_1[1] }));

   clb1 clb1(/*AUTOINST*/
	     // Outputs
	     .X				(X),
	     .Y				(Y),
	     // Inputs
	     .A				(A),
	     .B				(B),
	     .C				(C),
	     .D				(D),
	     .K				(K));
  
   endmodule

   


   
