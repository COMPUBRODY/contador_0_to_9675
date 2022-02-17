`timescale 1ns / 100ps
module	counter #(parameter DATA_WIDTH=4)( 

input clk, rst, ena, carry,
output reg [3:0] Qdata,
output reg	flag

);



always	@ (posedge clk)

	begin

		if (rst)
		
			Qdata	<= 4'h00;
			
		else if(ena) begin
		
			Qdata <= Qdata + 1;
			
			if(Qdata == 4'h0a)
				begin
					flag <= 1;
					Qdata <= 4'h00;
				end
			else
				flag <= 0;
						
		end
		else if(carry)
			
			Qdata <= Qdata + 1;
			if(Qdata == 4'h0a)
				begin
					flag <= 1;
					Qdata <= 4'h00;
				end
			else
				flag <= 0;			
		
		
	end
	

	
	

endmodule


		
//			Qdata <= Qdata + 1;
//					
//			if(Qdata == 4'h09)
//				begin
//					#20 flag <= 1;
//					#20 Qdata <= 4'h00;
//				end
//			else
//				flag <= 0;
