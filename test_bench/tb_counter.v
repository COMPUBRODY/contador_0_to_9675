`timescale 1ns / 100ps
module tb_counter ();

reg clk, rst, ena;
wire [3:0] Qdata;


localparam n = 4;

always #1 clk = ~clk;

counter counter_DUT(	.clk		(clk),
						.rst		(rst),
						.ena		(ena),
						.Qdata	(Qdata)
);

initial

	repeat (2**n)
	begin
	
		clk 				= 1'b0;
		#2
		rst 				= 1'b0;
		#2
		ena				= 1'b0;
		#2
		rst				= 1'b1;
		#2
		ena				= 1'b1;
		#2
		rst				= 1'b0;
		
		#10

		$display("Simulation Finished Correctly");
		
		$stop;
		
	end
	
	
	
endmodule
