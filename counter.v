
module	counter #(parameter DATA_WIDTH=4)( 

input clk, rst, ena,
output reg [DATA_WIDTH-1:0] Qdata
//output reg	flag

);

//initial Qdata <= 1'b1;

always	@ (posedge clk)

	begin

		if (rst)begin
		
			Qdata	= 4'h0000;
		end
//PARA DETECTAR CUANDO ESTE EL 4'h0A y EL ENABLE 
		if(ena && Qdata==4'b1001) begin

			Qdata	= 4'h0000;

		end
// cuenta con solo enable
		if(ena) begin
	
			Qdata = Qdata + 1;
			
						
		end


		/*
		if(ena) begin
		
			Qdata <= Qdata + 1;
			
			if(Qdata == 4'h0a)
				begin
					flag = 1;
					Qdata <= 4'h00;
				end
			else
				flag = 0;
						
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
		*/
		
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
