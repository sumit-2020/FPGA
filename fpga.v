module fpga(
	    inout [1:64]io,	    
	    input clk);

   reg      [3-1:0]  outselect[1:64];
   reg      [3-1:0]  inselect [1:64]; 
   reg      [3-1:0]  tsselect [1:64];
   
genvar i;
generate
	for(i = 7; i <= 61; i=i+1)
		initial
		begin
			outselect[i] = 3'd0;
			inselect[i]  = 3'd0;
			tsselect[i]  = 3'd0;
		end
endgenerate


   reg [3-1:0] 		  Aselect[1:64] ,Bselect[1:64] ,Cselect[1:64] ,Dselect[1:64] ,Kselect[1:64] ,Xselect[1:64] ,Yselect[1:64];
  
 genvar j;
   generate
       for(j = 7; j <= 61; j=j+1)
           initial
           begin
               Aselect[j]  = 3'd0;
               Bselect[j]  = 3'd0;
               Cselect[j]  = 3'd0;
               Dselect[j]  = 3'd0;
               Kselect[j]  = 3'd0;
               Xselect[j]  = 3'd0;
               Yselect[j]  = 3'd0;
           end
   endgenerate


   wire 		  IN[1:64], OUT[1:64], TS[1:64];
 
   
   wire 		  A[1:64] ,B[1:64] ,C[1:64] ,D[1:64] ,K[1:64] ,X[1:64] ,Y[1:64];

   wire [4:1] 		  row[1:9][1:8];
   wire [5:1] 		  col[1:9][1:8];

   initial
     begin

	outselect[1] = 3'd0;
    inselect[1]  = 3'd2;
    tsselect[1]  = 3'd0;
    outselect[2] = 3'd0;
    inselect[2]  = 3'd1;
    tsselect[2]  = 3'd0;
    outselect[3] = 3'd1;
    inselect[3]  = 3'd0;
    tsselect[3]  = 3'd0;
    outselect[4] = 3'd0;
    inselect[4]  = 3'd2;
    tsselect[4]  = 3'd0;
    outselect[5] = 3'd0;
    inselect[5]  = 3'd4;
    tsselect[5]  = 3'd0;
	outselect[6] = 3'd0;
    inselect[6]  = 3'd4;
    tsselect[6]  = 3'd0; 
    outselect[64] = 3'd0;
    inselect[64] = 3'd4;
    tsselect[64]  = 3'd0;
    outselect[63] = 3'd0;
    inselect[63] = 3'd2;
    tsselect[63]  = 3'd0;
    outselect[62] = 3'd0;
    inselect[62] = 3'd1; 
    tsselect[62]  = 3'd0;
 
     
	Aselect[1]=3'd1;
	Bselect[1]=3'd5;
	Cselect[1]=3'd4;
	Dselect[1]=3'd1;
	Kselect[1]=3'd2;
	Yselect[1]=3'd1;
	Xselect[1]=3'd0;
     end // initial begin
   
   genvar p,q;
   generate
       for(p = 0; p <= 7; p=p+1)
	       for(q = 1; q <= 8; q=q+1)
             begin
	            assign A[8*p+q] = (Aselect[8*p+q] == 3'd0 ) ? 1'bz : row[p+1][q][Aselect[8*p+q]];
	            assign B[8*p+q] = (Bselect[8*p+q] == 3'd0 ) ? 1'bz : col[p+1][q][Bselect[8*p+q]];
	            assign C[8*p+q] = (Cselect[8*p+q] == 3'd0 ) ? 1'bz : col[p+1][q][Cselect[8*p+q]];
	            assign D[8*p+q] = (Dselect[8*p+q] == 3'd0 ) ? 1'bz : row[p+2][q][Dselect[8*p+q]];
	            assign K[8*p+q] = (Kselect[8*p+q] == 3'd0 ) ? 1'bz : col[p+1][q][Kselect[8*p+q]];
	   end
   endgenerate

   
   genvar o;
   generate
      for(o=2;o<=17;o=o+1)
	begin
	   assign OUT[o-1]  = ( outselect[o-1]  == 3'd0 ) ? 1'bz : row[1][o/2][outselect[o-1]];
	   assign OUT[o+15] = ( outselect[o+15] == 3'd0 ) ? 1'bz : col[9][o/2][outselect[o+15]];
	   assign OUT[o+31] = ( outselect[o+31] == 3'd0 ) ? 1'bz : row[9][9-(o/2)][outselect[o+31]];
	   assign OUT[o+47] = ( outselect[o+47] == 3'd0 ) ? 1'bz : col[1][9-(o/2)][outselect[o+47]];
	   
	   assign TS[o-1]   = ( tsselect[o-1]   == 3'd0 ) ? 1'bz : row[1][o/2][tsselect[o-1]];
	   assign TS[o+15]  = ( tsselect[o+15]  == 3'd0 ) ? 1'bz : col[9][o/2][tsselect[o+15]];
	   assign TS[o+31]  = ( tsselect[o+31]  == 3'd0 ) ? 1'bz : row[9][9-(o/2)][tsselect[o+31]];
	   assign TS[o+47]  = ( tsselect[o+47]  == 3'd0 ) ? 1'bz : col[1][9-(o/2)][tsselect[o+47]];
	end	  
	endgenerate 
//   assign OUT[1] = ( outselect[1] == 3'd0 ) ? 1'bz : row[1][1][outselect[1]];
//   assign OUT[2] = ( outselect[2] == 3'd0 ) ? 1'bz : row[1][1][outselect[2]];
//   assign OUT[3] = ( outselect[3] == 3'd0 ) ? 1'bz : col[2][1][outselect[3]];
//   assign OUT[4] = ( outselect[4] == 3'd0 ) ? 1'bz : row[2][1][outselect[4]];
//   assign OUT[5] = ( outselect[5] == 3'd0 ) ? 1'bz : row[2][1][outselect[5]];
//   assign OUT[6] = ( outselect[6] == 3'd0 ) ? 1'bz : col[1][1][outselect[6]];

//   assign TS[1] = ( tsselect[1] == 3'd0 ) ? 1'bz : row[1][1][tsselect[1]];
//   assign TS[2] = ( tsselect[2] == 3'd0 ) ? 1'bz : row[1][1][tsselect[2]];
//   assign TS[3] = ( tsselect[3] == 3'd0 ) ? 1'bz : col[2][1][tsselect[3]];
//   assign TS[4] = ( tsselect[4] == 3'd0 ) ? 1'bz : row[2][1][tsselect[4]];
//   assign TS[5] = ( tsselect[5] == 3'd0 ) ? 1'bz : row[2][1][tsselect[5]];
//   assign TS[6] = ( tsselect[6] == 3'd0 ) ? 1'bz : col[1][1][tsselect[6]];
   
genvar s;
   generate
      for(s=1;s<=8;s=s+1)
	begin
   assign row[1][s][1] = ( inselect[2*s] == 3'd1 ) ? IN[2*s] : (( inselect[2*s-1] == 3'd1) ? IN[2*s-1] : 1'bz);
   assign row[1][s][2] = ( inselect[2*s] == 3'd2 ) ? IN[2*s] : (( inselect[2*s-1] == 3'd2) ? IN[2*s-1] : 1'bz);
   assign row[1][s][3] = ( inselect[2*s] == 3'd3 ) ? IN[2*s] : (( inselect[2*s-1] == 3'd3) ? IN[2*s-1] : 1'bz);
   assign row[1][s][4] = ( inselect[2*s] == 3'd4 ) ? IN[2*s] : (( inselect[2*s-1] == 3'd4) ? IN[2*s-1] : 1'bz);
   end	  
       endgenerate 
genvar t;
      generate
         for(t=1;t<=8;t=t+1)
       begin
   assign col[9][t][1] = ( inselect[16+2*t] == 3'd1 ) ? IN[16+2*t] :( inselect[16+2*t-1] == 3'd1 ) ? IN[16+2*t-1] : ( Xselect[8*t] == 3'd1 ) ? X[1] :( ( Yselect[8*t]== 3'd1) ? Y[1] : 1'bz);
   assign col[9][t][2] = ( inselect[16+2*t] == 3'd2 ) ? IN[16+2*t] :( inselect[16+2*t-1] == 3'd1 ) ? IN[16+2*t-1] : ( Xselect[8*t] == 3'd2 ) ? X[1] :( ( Yselect[8*t]== 3'd2) ? Y[1] : 1'bz);
   assign col[9][t][3] = ( inselect[16+2*t] == 3'd3 ) ? IN[16+2*t] :( inselect[16+2*t-1] == 3'd1 ) ? IN[16+2*t-1] : ( Xselect[8*t] == 3'd3 ) ? X[1] :( ( Yselect[8*t]== 3'd3) ? Y[1] : 1'bz);
   assign col[9][t][4] = ( inselect[16+2*t] == 3'd4 ) ? IN[16+2*t] :( inselect[16+2*t-1] == 3'd1 ) ? IN[16+2*t-1] : ( Xselect[8*t] == 3'd4 ) ? X[1] :( ( Yselect[8*t]== 3'd4) ? Y[1] : 1'bz);
   assign col[9][t][5] = ( inselect[16+2*t] == 3'd5 ) ? IN[16+2*t] :( inselect[16+2*t-1] == 3'd1 ) ? IN[16+2*t-1] : ( Xselect[8*t] == 3'd5 ) ? X[1] :( ( Yselect[8*t]== 3'd5) ? Y[1] : 1'bz);
   end	  
       endgenerate 
genvar u;
      generate
         for(u=1;u<=8;u=u+1)
       begin
   assign row[9][9-u][1] = ( inselect[32+2*u-1] == 3'd1 ) ? IN[32+2*u-1] : (( inselect[32+2*u] == 3'd1) ? IN[32+2*u] : 1'bz);
   assign row[9][9-u][2] = ( inselect[32+2*u-1] == 3'd2 ) ? IN[32+2*u-1] : (( inselect[32+2*u] == 3'd2) ? IN[32+2*u] : 1'bz);
   assign row[9][9-u][3] = ( inselect[32+2*u-1] == 3'd3 ) ? IN[32+2*u-1] : (( inselect[32+2*u] == 3'd3) ? IN[32+2*u] : 1'bz);
   assign row[9][9-u][4] = ( inselect[32+2*u-1] == 3'd4 ) ? IN[32+2*u-1] : (( inselect[32+2*u] == 3'd4) ? IN[32+2*u] : 1'bz);
   end	  
       endgenerate 
genvar v;
      generate
         for(v=1;v<=8;v=v+1)
       begin
   assign col[1][9-v][1] = ( inselect[48+2*v-1] == 3'd1 ) ? IN[48+2*v-1] : ( inselect[48+2*v] == 3'd1 ) ? IN[48+2*v] : 1'bz;
   assign col[1][9-v][2] = ( inselect[48+2*v-1] == 3'd2 ) ? IN[48+2*v-1] : ( inselect[48+2*v] == 3'd2 ) ? IN[48+2*v] : 1'bz;
   assign col[1][9-v][3] = ( inselect[48+2*v-1] == 3'd3 ) ? IN[48+2*v-1] : ( inselect[48+2*v] == 3'd3 ) ? IN[48+2*v] : 1'bz;
   assign col[1][9-v][4] = ( inselect[48+2*v-1] == 3'd4 ) ? IN[48+2*v-1] : ( inselect[48+2*v] == 3'd4 ) ? IN[48+2*v] : 1'bz;
   assign col[1][9-v][5] = ( inselect[48+2*v-1] == 3'd5 ) ? IN[48+2*v-1] : ( inselect[48+2*v] == 3'd5 ) ? IN[48+2*v] : 1'bz;
   end	  
       endgenerate 
 
 genvar x,y;
             generate
                for(x=1;x<=8;x=x+1)
                    for(y=2;y<=8;y=y+1)
              begin
          assign col[y][x][1] = ( Xselect[y-1+8*(x-1)] == 3'd1 ) ? X[y-1+8*(x-1)] : ( Yselect[y-1+8*(x-1)] == 3'd1 ) ? Y[y-1+8*(x-1)] : 1'bz;
          assign col[y][x][2] = ( Xselect[y-1+8*(x-1)] == 3'd2 ) ? X[y-1+8*(x-1)] : ( Yselect[y-1+8*(x-1)] == 3'd2 ) ? Y[y-1+8*(x-1)] : 1'bz;
          assign col[y][x][3] = ( Xselect[y-1+8*(x-1)] == 3'd3 ) ? X[y-1+8*(x-1)] : ( Yselect[y-1+8*(x-1)] == 3'd3 ) ? Y[y-1+8*(x-1)] : 1'bz;
          assign col[y][x][4] = ( Xselect[y-1+8*(x-1)] == 3'd4 ) ? X[y-1+8*(x-1)] : ( Yselect[y-1+8*(x-1)] == 3'd4 ) ? Y[y-1+8*(x-1)] : 1'bz;
          assign col[y][x][5] = ( Xselect[y-1+8*(x-1)] == 3'd5 ) ? X[y-1+8*(x-1)] : ( Yselect[y-1+8*(x-1)] == 3'd5 ) ? Y[y-1+8*(x-1)] : 1'bz;
          end      
              endgenerate       
       
   

      ioblock1  iob1 (.PIN(io[1] ),.TS(TS[1] ),.OUT(OUT[1] ),.IN(IN[1] ),.IOCLK(clk));
      ioblock2  iob2 (.PIN(io[2] ),.TS(TS[2] ),.OUT(OUT[2] ),.IN(IN[2] ),.IOCLK(clk));
      ioblock3  iob3 (.PIN(io[3] ),.TS(TS[3] ),.OUT(OUT[3] ),.IN(IN[3] ),.IOCLK(clk));
      ioblock4  iob4 (.PIN(io[4] ),.TS(TS[4] ),.OUT(OUT[4] ),.IN(IN[4] ),.IOCLK(clk));
      ioblock5  iob5 (.PIN(io[5] ),.TS(TS[5] ),.OUT(OUT[5] ),.IN(IN[5] ),.IOCLK(clk));
      ioblock6  iob6 (.PIN(io[6] ),.TS(TS[6] ),.OUT(OUT[6] ),.IN(IN[6] ),.IOCLK(clk));
      ioblock7  iob7 (.PIN(io[7] ),.TS(TS[7] ),.OUT(OUT[7] ),.IN(IN[7] ),.IOCLK(clk));
      ioblock8  iob8 (.PIN(io[8] ),.TS(TS[8] ),.OUT(OUT[8] ),.IN(IN[8] ),.IOCLK(clk));
      ioblock9  iob9 (.PIN(io[9] ),.TS(TS[9] ),.OUT(OUT[9] ),.IN(IN[9] ),.IOCLK(clk));
      ioblock10 iob10(.PIN(io[10]),.TS(TS[10]),.OUT(OUT[10]),.IN(IN[10]),.IOCLK(clk));
      ioblock11 iob11(.PIN(io[11]),.TS(TS[11]),.OUT(OUT[11]),.IN(IN[11]),.IOCLK(clk));
      ioblock12 iob12(.PIN(io[12]),.TS(TS[12]),.OUT(OUT[12]),.IN(IN[12]),.IOCLK(clk));
      ioblock13 iob13(.PIN(io[13]),.TS(TS[13]),.OUT(OUT[13]),.IN(IN[13]),.IOCLK(clk));
      ioblock14 iob14(.PIN(io[14]),.TS(TS[14]),.OUT(OUT[14]),.IN(IN[14]),.IOCLK(clk));
      ioblock15 iob15(.PIN(io[15]),.TS(TS[15]),.OUT(OUT[15]),.IN(IN[15]),.IOCLK(clk));
      ioblock16 iob16(.PIN(io[16]),.TS(TS[16]),.OUT(OUT[16]),.IN(IN[16]),.IOCLK(clk));
      ioblock17 iob17(.PIN(io[17]),.TS(TS[17]),.OUT(OUT[17]),.IN(IN[17]),.IOCLK(clk));
      ioblock18 iob18(.PIN(io[18]),.TS(TS[18]),.OUT(OUT[18]),.IN(IN[18]),.IOCLK(clk));
      ioblock19 iob19(.PIN(io[19]),.TS(TS[19]),.OUT(OUT[19]),.IN(IN[19]),.IOCLK(clk));
      ioblock20 iob20(.PIN(io[20]),.TS(TS[20]),.OUT(OUT[20]),.IN(IN[20]),.IOCLK(clk));
      ioblock21 iob21(.PIN(io[21]),.TS(TS[21]),.OUT(OUT[21]),.IN(IN[21]),.IOCLK(clk));
      ioblock22 iob22(.PIN(io[22]),.TS(TS[22]),.OUT(OUT[22]),.IN(IN[22]),.IOCLK(clk));
      ioblock23 iob23(.PIN(io[23]),.TS(TS[23]),.OUT(OUT[23]),.IN(IN[23]),.IOCLK(clk));
      ioblock24 iob24(.PIN(io[24]),.TS(TS[24]),.OUT(OUT[24]),.IN(IN[24]),.IOCLK(clk));
      ioblock25 iob25(.PIN(io[25]),.TS(TS[25]),.OUT(OUT[25]),.IN(IN[25]),.IOCLK(clk));
      ioblock26 iob26(.PIN(io[26]),.TS(TS[26]),.OUT(OUT[26]),.IN(IN[26]),.IOCLK(clk));
      ioblock27 iob27(.PIN(io[27]),.TS(TS[27]),.OUT(OUT[27]),.IN(IN[27]),.IOCLK(clk));
      ioblock28 iob28(.PIN(io[28]),.TS(TS[28]),.OUT(OUT[28]),.IN(IN[28]),.IOCLK(clk));
      ioblock29 iob29(.PIN(io[29]),.TS(TS[29]),.OUT(OUT[29]),.IN(IN[29]),.IOCLK(clk));
      ioblock30 iob30(.PIN(io[30]),.TS(TS[30]),.OUT(OUT[30]),.IN(IN[30]),.IOCLK(clk));
      ioblock31 iob31(.PIN(io[31]),.TS(TS[31]),.OUT(OUT[31]),.IN(IN[31]),.IOCLK(clk));
      ioblock32 iob32(.PIN(io[32]),.TS(TS[32]),.OUT(OUT[32]),.IN(IN[32]),.IOCLK(clk));
      ioblock33 iob33(.PIN(io[33]),.TS(TS[33]),.OUT(OUT[33]),.IN(IN[33]),.IOCLK(clk));
      ioblock34 iob34(.PIN(io[34]),.TS(TS[34]),.OUT(OUT[34]),.IN(IN[34]),.IOCLK(clk));
      ioblock35 iob35(.PIN(io[35]),.TS(TS[35]),.OUT(OUT[35]),.IN(IN[35]),.IOCLK(clk));
      ioblock36 iob36(.PIN(io[36]),.TS(TS[36]),.OUT(OUT[36]),.IN(IN[36]),.IOCLK(clk));
      ioblock37 iob37(.PIN(io[37]),.TS(TS[37]),.OUT(OUT[37]),.IN(IN[37]),.IOCLK(clk));
      ioblock38 iob38(.PIN(io[38]),.TS(TS[38]),.OUT(OUT[38]),.IN(IN[38]),.IOCLK(clk));
      ioblock39 iob39(.PIN(io[39]),.TS(TS[39]),.OUT(OUT[39]),.IN(IN[39]),.IOCLK(clk));
      ioblock40 iob40(.PIN(io[40]),.TS(TS[40]),.OUT(OUT[40]),.IN(IN[40]),.IOCLK(clk));
      ioblock41 iob41(.PIN(io[41]),.TS(TS[41]),.OUT(OUT[41]),.IN(IN[41]),.IOCLK(clk));
      ioblock42 iob42(.PIN(io[42]),.TS(TS[42]),.OUT(OUT[42]),.IN(IN[42]),.IOCLK(clk));
      ioblock43 iob43(.PIN(io[43]),.TS(TS[43]),.OUT(OUT[43]),.IN(IN[43]),.IOCLK(clk));
      ioblock44 iob44(.PIN(io[44]),.TS(TS[44]),.OUT(OUT[44]),.IN(IN[44]),.IOCLK(clk));
      ioblock45 iob45(.PIN(io[45]),.TS(TS[45]),.OUT(OUT[45]),.IN(IN[45]),.IOCLK(clk));
      ioblock46 iob46(.PIN(io[46]),.TS(TS[46]),.OUT(OUT[46]),.IN(IN[46]),.IOCLK(clk));
      ioblock47 iob47(.PIN(io[47]),.TS(TS[47]),.OUT(OUT[47]),.IN(IN[47]),.IOCLK(clk));
      ioblock48 iob48(.PIN(io[48]),.TS(TS[48]),.OUT(OUT[48]),.IN(IN[48]),.IOCLK(clk));
      ioblock49 iob49(.PIN(io[49]),.TS(TS[49]),.OUT(OUT[49]),.IN(IN[49]),.IOCLK(clk));
      ioblock50 iob50(.PIN(io[50]),.TS(TS[50]),.OUT(OUT[50]),.IN(IN[50]),.IOCLK(clk));
      ioblock51 iob51(.PIN(io[51]),.TS(TS[51]),.OUT(OUT[51]),.IN(IN[51]),.IOCLK(clk));
      ioblock52 iob52(.PIN(io[52]),.TS(TS[52]),.OUT(OUT[52]),.IN(IN[52]),.IOCLK(clk));
      ioblock53 iob53(.PIN(io[53]),.TS(TS[53]),.OUT(OUT[53]),.IN(IN[53]),.IOCLK(clk));
      ioblock54 iob54(.PIN(io[54]),.TS(TS[54]),.OUT(OUT[54]),.IN(IN[54]),.IOCLK(clk));
      ioblock55 iob55(.PIN(io[55]),.TS(TS[55]),.OUT(OUT[55]),.IN(IN[55]),.IOCLK(clk));
      ioblock56 iob56(.PIN(io[56]),.TS(TS[56]),.OUT(OUT[56]),.IN(IN[56]),.IOCLK(clk));
      ioblock57 iob57(.PIN(io[57]),.TS(TS[57]),.OUT(OUT[57]),.IN(IN[57]),.IOCLK(clk));
      ioblock58 iob58(.PIN(io[58]),.TS(TS[58]),.OUT(OUT[58]),.IN(IN[58]),.IOCLK(clk));
      ioblock59 iob59(.PIN(io[59]),.TS(TS[59]),.OUT(OUT[59]),.IN(IN[59]),.IOCLK(clk));
      ioblock60 iob60(.PIN(io[60]),.TS(TS[60]),.OUT(OUT[60]),.IN(IN[60]),.IOCLK(clk));
      ioblock61 iob61(.PIN(io[61]),.TS(TS[61]),.OUT(OUT[61]),.IN(IN[61]),.IOCLK(clk));
      ioblock62 iob62(.PIN(io[62]),.TS(TS[62]),.OUT(OUT[62]),.IN(IN[62]),.IOCLK(clk));
      ioblock63 iob63(.PIN(io[63]),.TS(TS[63]),.OUT(OUT[63]),.IN(IN[63]),.IOCLK(clk));
      ioblock64 iob64(.PIN(io[64]),.TS(TS[64]),.OUT(OUT[64]),.IN(IN[64]),.IOCLK(clk));
      
      matrix1_1 mat1_1(                    .wbottom(col[1][1]) , .wright(row[1][1])                    );
      matrix1_2 mat1_2(                    .wbottom(col[2][1]) , .wright(row[1][2]) , .wleft(row[1][1]));
      matrix1_3 mat1_3(                    .wbottom(col[3][1]) , .wright(row[1][3]) , .wleft(row[1][2]));
      matrix1_4 mat1_4(                    .wbottom(col[4][1]) , .wright(row[1][4]) , .wleft(row[1][3]));
      matrix1_5 mat1_5(                    .wbottom(col[5][1]) , .wright(row[1][5]) , .wleft(row[1][4]));
      matrix1_6 mat1_6(                    .wbottom(col[6][1]) , .wright(row[1][6]) , .wleft(row[1][5]));
      matrix1_7 mat1_7(                    .wbottom(col[7][1]) , .wright(row[1][7]) , .wleft(row[1][6]));
      matrix1_8 mat1_8(                    .wbottom(col[8][1]) , .wright(row[1][8]) , .wleft(row[1][7]));
      matrix1_9 mat1_9(                    .wbottom(col[9][1]) ,                      .wleft(row[1][8]));
      matrix2_1 mat2_1( .wtop(col[1][1]) , .wbottom(col[1][2]) , .wright(row[2][1])                    );
      matrix2_2 mat2_2( .wtop(col[2][1]) , .wbottom(col[2][2]) , .wright(row[2][2]) , .wleft(row[2][1]));
      matrix2_3 mat2_3( .wtop(col[3][1]) , .wbottom(col[3][2]) , .wright(row[2][3]) , .wleft(row[2][2]));
      matrix2_4 mat2_4( .wtop(col[4][1]) , .wbottom(col[4][2]) , .wright(row[2][4]) , .wleft(row[2][3]));
      matrix2_5 mat2_5( .wtop(col[5][1]) , .wbottom(col[5][2]) , .wright(row[2][5]) , .wleft(row[2][4]));
      matrix2_6 mat2_6( .wtop(col[6][1]) , .wbottom(col[6][2]) , .wright(row[2][6]) , .wleft(row[2][5]));
      matrix2_7 mat2_7( .wtop(col[7][1]) , .wbottom(col[7][2]) , .wright(row[2][7]) , .wleft(row[2][6]));
      matrix2_8 mat2_8( .wtop(col[8][1]) , .wbottom(col[8][2]) , .wright(row[2][8]) , .wleft(row[2][7]));
      matrix2_9 mat2_9( .wtop(col[9][1]) , .wbottom(col[9][2]) ,                      .wleft(row[2][8]));
      matrix3_1 mat3_1( .wtop(col[1][2]) , .wbottom(col[1][3]) , .wright(row[3][1])                    );
      matrix3_2 mat3_2( .wtop(col[2][2]) , .wbottom(col[2][3]) , .wright(row[3][2]) , .wleft(row[3][1]));
      matrix3_3 mat3_3( .wtop(col[3][2]) , .wbottom(col[3][3]) , .wright(row[3][3]) , .wleft(row[3][2]));
      matrix3_4 mat3_4( .wtop(col[4][2]) , .wbottom(col[4][3]) , .wright(row[3][4]) , .wleft(row[3][3]));
      matrix3_5 mat3_5( .wtop(col[5][2]) , .wbottom(col[5][3]) , .wright(row[3][5]) , .wleft(row[3][4]));
      matrix3_6 mat3_6( .wtop(col[6][2]) , .wbottom(col[6][3]) , .wright(row[3][6]) , .wleft(row[3][5]));
      matrix3_7 mat3_7( .wtop(col[7][2]) , .wbottom(col[7][3]) , .wright(row[3][7]) , .wleft(row[3][6]));
      matrix3_8 mat3_8( .wtop(col[8][2]) , .wbottom(col[8][3]) , .wright(row[3][8]) , .wleft(row[3][7]));
      matrix3_9 mat3_9( .wtop(col[9][2]) , .wbottom(col[9][3]) ,                      .wleft(row[3][8]));
      matrix4_1 mat4_1( .wtop(col[1][3]) , .wbottom(col[1][4]) , .wright(row[4][1])                    );
      matrix4_2 mat4_2( .wtop(col[2][3]) , .wbottom(col[2][4]) , .wright(row[4][2]) , .wleft(row[4][1]));
      matrix4_3 mat4_3( .wtop(col[3][3]) , .wbottom(col[3][4]) , .wright(row[4][3]) , .wleft(row[4][2]));
      matrix4_4 mat4_4( .wtop(col[4][3]) , .wbottom(col[4][4]) , .wright(row[4][4]) , .wleft(row[4][3]));
      matrix4_5 mat4_5( .wtop(col[5][3]) , .wbottom(col[5][4]) , .wright(row[4][5]) , .wleft(row[4][4]));
      matrix4_6 mat4_6( .wtop(col[6][3]) , .wbottom(col[6][4]) , .wright(row[4][6]) , .wleft(row[4][5]));
      matrix4_7 mat4_7( .wtop(col[7][3]) , .wbottom(col[7][4]) , .wright(row[4][7]) , .wleft(row[4][6]));
      matrix4_8 mat4_8( .wtop(col[8][3]) , .wbottom(col[8][4]) , .wright(row[4][8]) , .wleft(row[4][7]));
      matrix4_9 mat4_9( .wtop(col[9][3]) , .wbottom(col[9][4]) ,                      .wleft(row[4][8]));
      matrix5_1 mat5_1( .wtop(col[1][4]) , .wbottom(col[1][5]) , .wright(row[5][1])                    );
      matrix5_2 mat5_2( .wtop(col[2][4]) , .wbottom(col[2][5]) , .wright(row[5][2]) , .wleft(row[5][1]));
      matrix5_3 mat5_3( .wtop(col[3][4]) , .wbottom(col[3][5]) , .wright(row[5][3]) , .wleft(row[5][2]));
      matrix5_4 mat5_4( .wtop(col[4][4]) , .wbottom(col[4][5]) , .wright(row[5][4]) , .wleft(row[5][3]));
      matrix5_5 mat5_5( .wtop(col[5][4]) , .wbottom(col[5][5]) , .wright(row[5][5]) , .wleft(row[5][4]));
      matrix5_6 mat5_6( .wtop(col[6][4]) , .wbottom(col[6][5]) , .wright(row[5][6]) , .wleft(row[5][5]));
      matrix5_7 mat5_7( .wtop(col[7][4]) , .wbottom(col[7][5]) , .wright(row[5][7]) , .wleft(row[5][6]));
      matrix5_8 mat5_8( .wtop(col[8][4]) , .wbottom(col[8][5]) , .wright(row[5][8]) , .wleft(row[5][7]));
      matrix5_9 mat5_9( .wtop(col[9][4]) , .wbottom(col[9][5]) ,                      .wleft(row[5][8]));
      matrix6_1 mat6_1( .wtop(col[1][5]) , .wbottom(col[1][6]) , .wright(row[6][1])                    );
      matrix6_2 mat6_2( .wtop(col[2][5]) , .wbottom(col[2][6]) , .wright(row[6][2]) , .wleft(row[6][1]));
      matrix6_3 mat6_3( .wtop(col[3][5]) , .wbottom(col[3][6]) , .wright(row[6][3]) , .wleft(row[6][2]));
      matrix6_4 mat6_4( .wtop(col[4][5]) , .wbottom(col[4][6]) , .wright(row[6][4]) , .wleft(row[6][3]));
      matrix6_5 mat6_5( .wtop(col[5][5]) , .wbottom(col[5][6]) , .wright(row[6][5]) , .wleft(row[6][4]));
      matrix6_6 mat6_6( .wtop(col[6][5]) , .wbottom(col[6][6]) , .wright(row[6][6]) , .wleft(row[6][5]));
      matrix6_7 mat6_7( .wtop(col[7][5]) , .wbottom(col[7][6]) , .wright(row[6][7]) , .wleft(row[6][6]));
      matrix6_8 mat6_8( .wtop(col[8][5]) , .wbottom(col[8][6]) , .wright(row[6][8]) , .wleft(row[6][7]));
      matrix6_9 mat6_9( .wtop(col[9][5]) , .wbottom(col[9][6]) ,                      .wleft(row[6][8]));
      matrix7_1 mat7_1( .wtop(col[1][6]) , .wbottom(col[1][7]) , .wright(row[7][1])                    );
      matrix7_2 mat7_2( .wtop(col[2][6]) , .wbottom(col[2][7]) , .wright(row[7][2]) , .wleft(row[7][1]));
      matrix7_3 mat7_3( .wtop(col[3][6]) , .wbottom(col[3][7]) , .wright(row[7][3]) , .wleft(row[7][2]));
      matrix7_4 mat7_4( .wtop(col[4][6]) , .wbottom(col[4][7]) , .wright(row[7][4]) , .wleft(row[7][3]));
      matrix7_5 mat7_5( .wtop(col[5][6]) , .wbottom(col[5][7]) , .wright(row[7][5]) , .wleft(row[7][4]));
      matrix7_6 mat7_6( .wtop(col[6][6]) , .wbottom(col[6][7]) , .wright(row[7][6]) , .wleft(row[7][5]));
      matrix7_7 mat7_7( .wtop(col[7][6]) , .wbottom(col[7][7]) , .wright(row[7][7]) , .wleft(row[7][6]));
      matrix7_8 mat7_8( .wtop(col[8][6]) , .wbottom(col[8][7]) , .wright(row[7][8]) , .wleft(row[7][7]));
      matrix7_9 mat7_9( .wtop(col[9][6]) , .wbottom(col[9][7]) ,                      .wleft(row[7][8]));
      matrix8_1 mat8_1( .wtop(col[1][7]) , .wbottom(col[1][8]) , .wright(row[8][1])                    );
      matrix8_2 mat8_2( .wtop(col[2][7]) , .wbottom(col[2][8]) , .wright(row[8][2]) , .wleft(row[8][1]));
      matrix8_3 mat8_3( .wtop(col[3][7]) , .wbottom(col[3][8]) , .wright(row[8][3]) , .wleft(row[8][2]));
      matrix8_4 mat8_4( .wtop(col[4][7]) , .wbottom(col[4][8]) , .wright(row[8][4]) , .wleft(row[8][3]));
      matrix8_5 mat8_5( .wtop(col[5][7]) , .wbottom(col[5][8]) , .wright(row[8][5]) , .wleft(row[8][4]));
      matrix8_6 mat8_6( .wtop(col[6][7]) , .wbottom(col[6][8]) , .wright(row[8][6]) , .wleft(row[8][5]));
      matrix8_7 mat8_7( .wtop(col[7][7]) , .wbottom(col[7][8]) , .wright(row[8][7]) , .wleft(row[8][6]));
      matrix8_8 mat8_8( .wtop(col[8][7]) , .wbottom(col[8][8]) , .wright(row[8][8]) , .wleft(row[8][7]));
      matrix8_9 mat8_9( .wtop(col[9][7]) , .wbottom(col[9][8]) ,                      .wleft(row[8][8]));
      matrix9_1 mat9_1( .wtop(col[1][8]) ,                       .wright(row[9][1])                    );
      matrix9_2 mat9_2( .wtop(col[2][8]) ,                       .wright(row[9][2]) , .wleft(row[9][1]));
      matrix9_3 mat9_3( .wtop(col[3][8]) ,                       .wright(row[9][3]) , .wleft(row[9][2]));
      matrix9_4 mat9_4( .wtop(col[4][8]) ,                       .wright(row[9][4]) , .wleft(row[9][3]));
      matrix9_5 mat9_5( .wtop(col[5][8]) ,                       .wright(row[9][5]) , .wleft(row[9][4]));
      matrix9_6 mat9_6( .wtop(col[6][8]) ,                       .wright(row[9][6]) , .wleft(row[9][5]));
      matrix9_7 mat9_7( .wtop(col[7][8]) ,                       .wright(row[9][7]) , .wleft(row[9][6]));
      matrix9_8 mat9_8( .wtop(col[8][8]) ,                       .wright(row[9][8]) , .wleft(row[9][7]));
      matrix9_9 mat9_9( .wtop(col[9][8]) ,                                            .wleft(row[9][8]));

      
   clb1  clb1 (.X (X[1] ) , .Y (Y[1] ) , .A(A[1] ) , .B(B[1] ) , .C(C[1] ) , .D(D[1] ) , .K(K[1] ) );
   clb2  clb2 (.X (X[2] ) , .Y (Y[2] ) , .A(A[2] ) , .B(B[2] ) , .C(C[2] ) , .D(D[2] ) , .K(K[2] ) );
   clb3  clb3 (.X (X[3] ) , .Y (Y[3] ) , .A(A[3] ) , .B(B[3] ) , .C(C[3] ) , .D(D[3] ) , .K(K[3] ) );
   clb4  clb4 (.X (X[4] ) , .Y (Y[4] ) , .A(A[4] ) , .B(B[4] ) , .C(C[4] ) , .D(D[4] ) , .K(K[4] ) );
   clb5  clb5 (.X (X[5] ) , .Y (Y[5] ) , .A(A[5] ) , .B(B[5] ) , .C(C[5] ) , .D(D[5] ) , .K(K[5] ) );
   clb6  clb6 (.X (X[6] ) , .Y (Y[6] ) , .A(A[6] ) , .B(B[6] ) , .C(C[6] ) , .D(D[6] ) , .K(K[6] ) );
   clb7  clb7 (.X (X[7] ) , .Y (Y[7] ) , .A(A[7] ) , .B(B[7] ) , .C(C[7] ) , .D(D[7] ) , .K(K[7] ) );
   clb8  clb8 (.X (X[8] ) , .Y (Y[8] ) , .A(A[8] ) , .B(B[8] ) , .C(C[8] ) , .D(D[8] ) , .K(K[8] ) );
   clb9  clb9 (.X (X[9] ) , .Y (Y[9] ) , .A(A[9] ) , .B(B[9] ) , .C(C[9] ) , .D(D[9] ) , .K(K[9] ) );
   clb10 clb10(.X (X[10]) , .Y (Y[10]) , .A(A[10]) , .B(B[10]) , .C(C[10]) , .D(D[10]) , .K(K[10]) );
   clb11 clb11(.X (X[11]) , .Y (Y[11]) , .A(A[11]) , .B(B[11]) , .C(C[11]) , .D(D[11]) , .K(K[11]) );
   clb12 clb12(.X (X[12]) , .Y (Y[12]) , .A(A[12]) , .B(B[12]) , .C(C[12]) , .D(D[12]) , .K(K[12]) );
   clb13 clb13(.X (X[13]) , .Y (Y[13]) , .A(A[13]) , .B(B[13]) , .C(C[13]) , .D(D[13]) , .K(K[13]) );
   clb14 clb14(.X (X[14]) , .Y (Y[14]) , .A(A[14]) , .B(B[14]) , .C(C[14]) , .D(D[14]) , .K(K[14]) );
   clb15 clb15(.X (X[15]) , .Y (Y[15]) , .A(A[15]) , .B(B[15]) , .C(C[15]) , .D(D[15]) , .K(K[15]) );
   clb16 clb16(.X (X[16]) , .Y (Y[16]) , .A(A[16]) , .B(B[16]) , .C(C[16]) , .D(D[16]) , .K(K[16]) );
   clb17 clb17(.X (X[17]) , .Y (Y[17]) , .A(A[17]) , .B(B[17]) , .C(C[17]) , .D(D[17]) , .K(K[17]) );
   clb18 clb18(.X (X[18]) , .Y (Y[18]) , .A(A[18]) , .B(B[18]) , .C(C[18]) , .D(D[18]) , .K(K[18]) );
   clb19 clb19(.X (X[19]) , .Y (Y[19]) , .A(A[19]) , .B(B[19]) , .C(C[19]) , .D(D[19]) , .K(K[19]) );
   clb20 clb20(.X (X[20]) , .Y (Y[20]) , .A(A[20]) , .B(B[20]) , .C(C[20]) , .D(D[20]) , .K(K[20]) );
   clb21 clb21(.X (X[21]) , .Y (Y[21]) , .A(A[21]) , .B(B[21]) , .C(C[21]) , .D(D[21]) , .K(K[21]) );
   clb22 clb22(.X (X[22]) , .Y (Y[22]) , .A(A[22]) , .B(B[22]) , .C(C[22]) , .D(D[22]) , .K(K[22]) );
   clb23 clb23(.X (X[23]) , .Y (Y[23]) , .A(A[23]) , .B(B[23]) , .C(C[23]) , .D(D[23]) , .K(K[23]) );
   clb24 clb24(.X (X[24]) , .Y (Y[24]) , .A(A[24]) , .B(B[24]) , .C(C[24]) , .D(D[24]) , .K(K[24]) );
   clb25 clb25(.X (X[25]) , .Y (Y[25]) , .A(A[25]) , .B(B[25]) , .C(C[25]) , .D(D[25]) , .K(K[25]) );
   clb26 clb26(.X (X[26]) , .Y (Y[26]) , .A(A[26]) , .B(B[26]) , .C(C[26]) , .D(D[26]) , .K(K[26]) );
   clb27 clb27(.X (X[27]) , .Y (Y[27]) , .A(A[27]) , .B(B[27]) , .C(C[27]) , .D(D[27]) , .K(K[27]) );
   clb28 clb28(.X (X[28]) , .Y (Y[28]) , .A(A[28]) , .B(B[28]) , .C(C[28]) , .D(D[28]) , .K(K[28]) );
   clb29 clb29(.X (X[29]) , .Y (Y[29]) , .A(A[29]) , .B(B[29]) , .C(C[29]) , .D(D[29]) , .K(K[29]) );
   clb30 clb30(.X (X[30]) , .Y (Y[30]) , .A(A[30]) , .B(B[30]) , .C(C[30]) , .D(D[30]) , .K(K[30]) );
   clb31 clb31(.X (X[31]) , .Y (Y[31]) , .A(A[31]) , .B(B[31]) , .C(C[31]) , .D(D[31]) , .K(K[31]) );
   clb32 clb32(.X (X[32]) , .Y (Y[32]) , .A(A[32]) , .B(B[32]) , .C(C[32]) , .D(D[32]) , .K(K[32]) );
   clb33 clb33(.X (X[33]) , .Y (Y[33]) , .A(A[33]) , .B(B[33]) , .C(C[33]) , .D(D[33]) , .K(K[33]) );
   clb34 clb34(.X (X[34]) , .Y (Y[34]) , .A(A[34]) , .B(B[34]) , .C(C[34]) , .D(D[34]) , .K(K[34]) );
   clb35 clb35(.X (X[35]) , .Y (Y[35]) , .A(A[35]) , .B(B[35]) , .C(C[35]) , .D(D[35]) , .K(K[35]) );
   clb36 clb36(.X (X[36]) , .Y (Y[36]) , .A(A[36]) , .B(B[36]) , .C(C[36]) , .D(D[36]) , .K(K[36]) );
   clb37 clb37(.X (X[37]) , .Y (Y[37]) , .A(A[37]) , .B(B[37]) , .C(C[37]) , .D(D[37]) , .K(K[37]) );
   clb38 clb38(.X (X[38]) , .Y (Y[38]) , .A(A[38]) , .B(B[38]) , .C(C[38]) , .D(D[38]) , .K(K[38]) );
   clb39 clb39(.X (X[39]) , .Y (Y[39]) , .A(A[39]) , .B(B[39]) , .C(C[39]) , .D(D[39]) , .K(K[39]) );
   clb40 clb40(.X (X[40]) , .Y (Y[40]) , .A(A[40]) , .B(B[40]) , .C(C[40]) , .D(D[40]) , .K(K[40]) );
   clb41 clb41(.X (X[41]) , .Y (Y[41]) , .A(A[41]) , .B(B[41]) , .C(C[41]) , .D(D[41]) , .K(K[41]) );
   clb42 clb42(.X (X[42]) , .Y (Y[42]) , .A(A[42]) , .B(B[42]) , .C(C[42]) , .D(D[42]) , .K(K[42]) );
   clb43 clb43(.X (X[43]) , .Y (Y[43]) , .A(A[43]) , .B(B[43]) , .C(C[43]) , .D(D[43]) , .K(K[43]) );
   clb44 clb44(.X (X[44]) , .Y (Y[44]) , .A(A[44]) , .B(B[44]) , .C(C[44]) , .D(D[44]) , .K(K[44]) );
   clb45 clb45(.X (X[45]) , .Y (Y[45]) , .A(A[45]) , .B(B[45]) , .C(C[45]) , .D(D[45]) , .K(K[45]) );
   clb46 clb46(.X (X[46]) , .Y (Y[46]) , .A(A[46]) , .B(B[46]) , .C(C[46]) , .D(D[46]) , .K(K[46]) );
   clb47 clb47(.X (X[47]) , .Y (Y[47]) , .A(A[47]) , .B(B[47]) , .C(C[47]) , .D(D[47]) , .K(K[47]) );
   clb48 clb48(.X (X[48]) , .Y (Y[48]) , .A(A[48]) , .B(B[48]) , .C(C[48]) , .D(D[48]) , .K(K[48]) );
   clb49 clb49(.X (X[49]) , .Y (Y[49]) , .A(A[49]) , .B(B[49]) , .C(C[49]) , .D(D[49]) , .K(K[49]) );
   clb50 clb50(.X (X[50]) , .Y (Y[50]) , .A(A[50]) , .B(B[50]) , .C(C[50]) , .D(D[50]) , .K(K[50]) );
   clb51 clb51(.X (X[51]) , .Y (Y[51]) , .A(A[51]) , .B(B[51]) , .C(C[51]) , .D(D[51]) , .K(K[51]) );
   clb52 clb52(.X (X[52]) , .Y (Y[52]) , .A(A[52]) , .B(B[52]) , .C(C[52]) , .D(D[52]) , .K(K[52]) );
   clb53 clb53(.X (X[53]) , .Y (Y[53]) , .A(A[53]) , .B(B[53]) , .C(C[53]) , .D(D[53]) , .K(K[53]) );
   clb54 clb54(.X (X[54]) , .Y (Y[54]) , .A(A[54]) , .B(B[54]) , .C(C[54]) , .D(D[54]) , .K(K[54]) );
   clb55 clb55(.X (X[55]) , .Y (Y[55]) , .A(A[55]) , .B(B[55]) , .C(C[55]) , .D(D[55]) , .K(K[55]) );
   clb56 clb56(.X (X[56]) , .Y (Y[56]) , .A(A[56]) , .B(B[56]) , .C(C[56]) , .D(D[56]) , .K(K[56]) );
   clb57 clb57(.X (X[57]) , .Y (Y[57]) , .A(A[57]) , .B(B[57]) , .C(C[57]) , .D(D[57]) , .K(K[57]) );
   clb58 clb58(.X (X[58]) , .Y (Y[58]) , .A(A[58]) , .B(B[58]) , .C(C[58]) , .D(D[58]) , .K(K[58]) );
   clb59 clb59(.X (X[59]) , .Y (Y[59]) , .A(A[59]) , .B(B[59]) , .C(C[59]) , .D(D[59]) , .K(K[59]) );
   clb60 clb60(.X (X[60]) , .Y (Y[60]) , .A(A[60]) , .B(B[60]) , .C(C[60]) , .D(D[60]) , .K(K[60]) );
   clb61 clb61(.X (X[61]) , .Y (Y[61]) , .A(A[61]) , .B(B[61]) , .C(C[61]) , .D(D[61]) , .K(K[61]) );
   clb62 clb62(.X (X[62]) , .Y (Y[62]) , .A(A[62]) , .B(B[62]) , .C(C[62]) , .D(D[62]) , .K(K[62]) );
   clb63 clb63(.X (X[63]) , .Y (Y[63]) , .A(A[63]) , .B(B[63]) , .C(C[63]) , .D(D[63]) , .K(K[63]) );
   clb64 clb64(.X (X[64]) , .Y (Y[64]) , .A(A[64]) , .B(B[64]) , .C(C[64]) , .D(D[64]) , .K(K[64]) );

endmodule

   
