module clb6(
	   input  A,
	   input  B,
	   input  C,
	   input  D,
	   input  K,
	   output X,
	   output Y
    /*AUTOARG*/);

   reg [2-1:0]	  mux2select;
   reg [2-1:0] 	  mux3select;
   reg [2-1:0]	  mux4select;
   reg [2-1:0] 	  mux5select;
   reg [2-1:0] 	  mux6select;
   reg 		  o2m1_0,o2m1_1;
   reg 		  o2m2_0,o2m2_1;
   reg 		  o2m3_0,o2m3_1;
   reg  	  DQmux1,DQmux2;
   reg        Q;
   reg [16-1:0]   mem;
   reg [2-1:0] 	  comboption;
   reg 		  floporlatch; 		  
   wire 	  F,G,S,R,KLK,DQ1,DQ2;

   
   assign DQ1 = (DQmux1==1'b0)?D:Q;
   assign DQ2 = (DQmux2==1'b0)?D:Q;
   
   assign #1 F  = (comboption==2'b00)?mem[{A,B,C,DQ1}]:((comboption==2'b01)?mem[{1'b0,(o2m1_0==1'b0)?A:B,(o2m2_0==1'b0)?B:C,(o2m3_0==1'b0)?C:DQ1}]:((B==1'b0)?mem[{1'b0,A,C,DQ1}]:mem[{1'b1,A,C,DQ2}]));
						   
   assign #1 G  = (comboption==2'b00)?mem[{A,B,C,DQ1}]:((comboption==2'b01)?mem[{1'b1,(o2m1_1==1'b0)?A:B,(o2m2_1==1'b0)?B:C,(o2m3_1==1'b0)?C:DQ2}]:((B==1'b0)?mem[{1'b0,A,C,DQ1}]:mem[{1'b1,A,C,DQ2}]));	
   assign S  = (mux2select==2'b00)?A:((mux2select==2'b01)?F:1'b0);
  
   assign R  = (mux4select==2'b00)?D:((mux4select==2'b01)?G:1'b0);

   assign KLK= (mux3select==2'b00)?G:((mux3select==2'b01)?C:K);

   assign X = (mux5select==2'b00)?F:((mux5select==2'b01)?G:Q);

   assign Y = (mux6select==2'b00)?Q:((mux6select==2'b01)?G:F);
   
   initial
     begin
	mux2select=2'b10;
	mux3select=2'b10;
	mux4select=2'b10;
	mux5select=2'b00;
	mux6select=2'b00;
	mem=16'b0000000100010110;
	comboption=2'b00;
	o2m1_0=1'b0;
	o2m2_0=1'b0;
	o2m3_0=1'b0;
	o2m1_1=1'b1;
	o2m2_1=1'b1;
	o2m3_1=1'b1;
	DQmux1=1'b0;
	DQmux2=1'b0;
	floporlatch=1'b0;
	Q=1'b0;
     end // initial begin

   always @( posedge KLK ) begin
      if(floporlatch==1'b0)
	begin
	   if(S==1'b0 && R==1'b0) Q <= F;
	   if(R==1'b1)            Q <= 1'b0;
	   if(S==1'b1 && R==1'b0) Q <= 1'b1;
	end
     end
     
   always @(KLK,F) begin
	if(floporlatch==1'b1 && KLK)
	  begin
	   if(S==1'b0 && R==1'b0) Q <= F;
	   if(R==1'b1)            Q <= 1'b0;
	   if(S==1'b1 && R==1'b0) Q <= 1'b1;
	  end
     end
   
endmodule // clb

