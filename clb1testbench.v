`timescale 1ns / 1ps

module clbtestbench(X,Y);

   reg A,B,C,D,K;
   output X,Y;
   /*AUTOWIRE*/
   /*AUTOREGINPUT*/
  
   clb1 uut(/*AUTOINST*/
	   // Outputs
	   .X				(X),
	   .Y				(Y),
	   // Inputs
	   .A				(A),
	   .B				(B),
	   .C				(C),
	   .D				(D),
	   .K				(K));
    initial
     begin
	A=1'b0;
	B=1'b0;
	C=1'b1;
	D=1'b0;
	K=1'b0;
	#30
	A=1'b0;
	B=1'b1;
	C=1'b0;
	D=1'b0;
	K=1'b1;
	#30
	A=1'b0;
	B=1'b1;
	C=1'b1;
	D=1'b1;
	K=1'b1;
	#30
	A=1'b1;
	B=1'b1;
	C=1'b1;
	D=1'b0;
	K=1'b0;
	#30
	A=1'b1;
	B=1'b1;
	C=1'b0;
	D=1'b0;
	K=1'b0;
	#30
	A=1'b0;
	B=1'b0;
	C=1'b1;
	D=1'b0;
	K=1'b1;
	#30
	A=1'b0;
	B=1'b1;
	C=1'b1;
	D=1'b0;
	K=1'b0;
	#30
	A=1'b0;
    B=1'b1;
    C=1'b1;
    D=1'b1;
    K=1'b1;
    #30
    A=1'b1;
    B=1'b1;
    C=1'b1;
    D=1'b0;
    K=1'b0;
    #30
    A=1'b1;
    B=1'b1;
    C=1'b1;
    D=1'b0;
    K=1'b0;
    #30
    A=1'b0;
    B=1'b0;
    C=1'b1;
    D=1'b0;
    K=1'b1;
    #30
    A=1'b0;
    B=1'b1;
    C=1'b1;
    D=1'b0;
    K=1'b0;
    #30
    A=1'b0;
    B=1'b0;
    C=1'b1;
    D=1'b0;
    K=1'b0;
    #30
    A=1'b0;
    B=1'b1;
    C=1'b0;
    D=1'b0;
    K=1'b1;
    #30
    A=1'b0;
    B=1'b1;
    C=1'b1;
    D=1'b0;
    K=1'b1;
    #30
    A=1'b1;
    B=1'b0;
    C=1'b1;
    D=1'b0;
    K=1'b0;
    #30
    A=1'b1;
    B=1'b0;
    C=1'b0;
    D=1'b0;
    K=1'b0;
    #30
    A=1'b0;
    B=1'b1;
    C=1'b1;
    D=1'b0;
    K=1'b1;
    #30
    A=1'b1;
    B=1'b1;
    C=1'b1;
    D=1'b0;
    K=1'b0;
    #30
   
	$finish;
     end
endmodule
