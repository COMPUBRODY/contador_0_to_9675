module corrimiento_9bits (
	
	input clk, rst, enable,
	input in,
	input	dir,
	output reg [9:0] Out

);


	always @(posedge clk)
	
	begin
	
		if(rst)
			begin
				Out <= {9{1'b0}};
			end
		else
			begin
			if(enable)	
				begin
					if(dir)
						begin
						Out[0] <= in;
						Out[1] <= #15 Out[0];
						Out[2] <= #15 Out[1];
						Out[3] <= #15 Out[2];
						Out[4] <= #15 Out[3];
						Out[5] <= #15 Out[4];
						Out[6] <= #15 Out[5];
						Out[7] <= #15 Out[6];	
						Out[8] <= #15 Out[7];
						Out[9] <= #15 Out[8];
						end
					else
						begin
						Out[9] <= in;
						Out[8] <= Out[9];
						Out[7] <= Out[8];
						Out[6] <= Out[7];
						Out[5] <= Out[6];
						Out[4] <= Out[5];
						Out[3] <= Out[4];
						Out[2] <= Out[3];
						Out[1] <= Out[2];
						Out[0] <= Out[1];
						end
				end
			end	
			
	end
	
endmodule