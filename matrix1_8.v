`timescale 1ns / 1ps

module matrix1_8(wtop,wbottom,wright,wleft);
   
   inout [5-1:0] wtop,wbottom;
   inout [4-1:0] wleft,wright;   
   reg [6-1:0] dtop[5-1:0];
   reg [6-1:0] dbottom[5-1:0];
   reg [6-1:0] dleft[4-1:0];
   reg [6-1:0] dright[4-1:0];
   
   
   initial
     begin
	dtop[0]     = 6'b000000;
	dtop[1]     = 6'b000000;
	dtop[2]     = 6'b000000;
	dtop[3]     = 6'b000000;
	dtop[4]     = 6'b000000;
	dbottom[0]  = 6'b000000;
	dbottom[1]  = 6'b000000;
	dbottom[2]  = 6'b000000;
	dbottom[3]  = 6'b000000;
	dbottom[4]  = 6'b000000;
	dleft[0]    = 6'b000000;
	dleft[1]    = 6'b000000;
	dleft[2]    = 6'b000000;
	dleft[3]    = 6'b000000;
	dright[0]   = 6'b000000;
	dright[1]   = 6'b000000;
	dright[2]   = 6'b000000;
	dright[3]   = 6'b000000;
     end // initial begin
  
   
   generate
      genvar i;
      for(i=0;i<5;i=i+1)
	begin
           assign wtop[i]    = (dtop[i][2:0]   == 3'd1)?wtop[dtop[i][5:3]]   :(dtop[i][2:0]   == 3'd2)?wright[dtop[i][5:3]]   :(dtop[i][2:0]   == 3'd3)?wbottom[dtop[i][5:3]]   :(dtop[i][2:0]   == 3'd4)?wleft[dtop[i][5:3]]   :1'bz;
           assign wbottom[i] = (dbottom[i][2:0]== 3'd1)?wtop[dbottom[i][5:3]]:(dbottom[i][2:0]== 3'd2)?wright[dbottom[i][5:3]]:(dbottom[i][2:0]== 3'd3)?wbottom[dbottom[i][5:3]]:(dbottom[i][2:0]== 3'd4)?wleft[dbottom[i][5:3]]:1'bz;
	end
   endgenerate

     generate
      genvar j;
      for(j=0;j<4;j=j+1)
	begin
           assign wleft[j]  = (dleft[j][2:0] == 3'd1)?wtop[dleft[j][5:3]] :(dleft[j][2:0] == 3'd2)?wright[dleft[j][5:3]] :(dleft[j][2:0] == 3'd3)?wbottom[dleft[j][5:3]] :(dleft[j][2:0] == 3'd4)?wleft[dleft[j][5:3]] :1'bz;
           assign wright[j] = (dright[j][2:0]== 3'd1)?wtop[dright[j][5:3]]:(dright[j][2:0]== 3'd2)?wright[dright[j][5:3]]:(dright[j][2:0]== 3'd3)?wbottom[dright[j][5:3]]:(dright[j][2:0]== 3'd4)?wleft[dright[j][5:3]]:1'bz;
	end
   endgenerate

   
endmodule
