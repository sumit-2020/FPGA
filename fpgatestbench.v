`timescale 1ns / 1ps

module fpgatestbench(inout [1:64]io);

   reg [1:64]ioreg;
   
   genvar j;
   generate
    for(j = 1; j <= 64; j=j+1)
      initial begin
                 ioreg[j]=1'b0;      
              end
   endgenerate   
 
   reg			clk;			
   fpga uut(
	    .io(io),
	    .clk			(clk));
	                      
 assign io[1]=ioreg[1];      
 assign io[2]=ioreg[2];      
 assign io[62]=ioreg[4];      
 assign io[63]=ioreg[5];      
 assign io[64]=ioreg[6];      

        
        
    initial
     begin
    clk=1'b0;
	ioreg[2]=1'b0;
	ioreg[1]=1'b0;
	ioreg[6]=1'b1;
	ioreg[4]=1'b0;
	ioreg[5]=1'b0;
	#30
	ioreg[2]=1'b0;
	ioreg[1]=1'b1;
	ioreg[6]=1'b0;
	ioreg[4]=1'b0;
	ioreg[5]=1'b1;
	#30
	ioreg[2]=1'b0;
	ioreg[1]=1'b1;
	ioreg[6]=1'b1;
	ioreg[4]=1'b1;
	ioreg[5]=1'b1;
	#30
	ioreg[2]=1'b1;
	ioreg[1]=1'b1;
	ioreg[6]=1'b1;
	ioreg[4]=1'b0;
	ioreg[5]=1'b0;
	#30
	ioreg[2]=1'b1;
	ioreg[1]=1'b1;
	ioreg[6]=1'b0;
	ioreg[4]=1'b0;
	ioreg[5]=1'b0;
	#30
	ioreg[2]=1'b0;
	ioreg[1]=1'b0;
	ioreg[6]=1'b1;
	ioreg[4]=1'b0;
	ioreg[5]=1'b1;
	#30
	ioreg[2]=1'b0;
	ioreg[1]=1'b1;
	ioreg[6]=1'b1;
	ioreg[4]=1'b0;
	ioreg[5]=1'b0;
	#30
	ioreg[2]=1'b0;
	ioreg[1]=1'b1;
	ioreg[6]=1'b1;
	ioreg[4]=1'b1;
	ioreg[5]=1'b1;
	#30
	ioreg[2]=1'b1;
	ioreg[1]=1'b1;
	ioreg[6]=1'b1;
	ioreg[4]=1'b0;
	ioreg[5]=1'b0;
	#30
	ioreg[2]=1'b1;
	ioreg[1]=1'b1;
	ioreg[6]=1'b1;
	ioreg[4]=1'b0;
	ioreg[5]=1'b0;
	#30
	ioreg[2]=1'b0;
	ioreg[1]=1'b0;
	ioreg[6]=1'b1;
	ioreg[4]=1'b0;
	ioreg[5]=1'b1;
	#30
	ioreg[2]=1'b0;
	ioreg[1]=1'b1;
	ioreg[6]=1'b1;
	ioreg[4]=1'b0;
	ioreg[5]=1'b0;
	#30
	ioreg[2]=1'b0;
	ioreg[1]=1'b0;
	ioreg[6]=1'b1;
	ioreg[4]=1'b0;
	ioreg[5]=1'b0;
	#30
	ioreg[2]=1'b0;
	ioreg[1]=1'b1;
	ioreg[6]=1'b0;
	ioreg[4]=1'b0;
	ioreg[5]=1'b1;
	#30
	ioreg[2]=1'b0;
	ioreg[1]=1'b1;
	ioreg[6]=1'b1;
	ioreg[4]=1'b0;
	ioreg[5]=1'b1;
	#30
	ioreg[2]=1'b1;
	ioreg[1]=1'b0;
	ioreg[6]=1'b1;
	ioreg[4]=1'b0;
	ioreg[5]=1'b0;
	#30
	ioreg[2]=1'b1;
	ioreg[1]=1'b0;
	ioreg[6]=1'b0;
	ioreg[4]=1'b0;
	ioreg[5]=1'b0;
	#30
	ioreg[2]=1'b0;
	ioreg[1]=1'b1;
	ioreg[6]=1'b1;
	ioreg[4]=1'b0;
	ioreg[5]=1'b1;
	#30
	ioreg[2]=1'b1;
	ioreg[1]=1'b1;
	ioreg[6]=1'b1;
	ioreg[4]=1'b0;
	ioreg[5]=1'b0;
	#30
   
	$finish;
     end // initial begin
   
endmodule
