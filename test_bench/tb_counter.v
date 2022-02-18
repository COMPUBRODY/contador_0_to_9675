`timescale 1ns / 100ps
module tb_counter ();

reg clk, rst, ena, carry;
wire [3:0] Qdata;
wire	flag;

always #2.5 clk = ~clk;

counter counter_DUT(	.clk		(clk),
							.rst		(rst),
							.ena		(ena),
							.carry	(carry),
							.Qdata	(Qdata),
							.flag		(flag)
);

initial

	begin
	
		clk 				= 1'b0;
		rst 				= 1'b1;
		ena				= 1'b1;
		carry				= 1'b0;
		#5		rst		= 1'b0;
		#1		rst 		= 1'b0;
		#10 	carry		= 1'b0;
		#100	rst		= 1'b0;
		#5 	carry		= 1'b1;
		#5 	carry		= 1'b0;
		#100	rst		= 1'b0;
		#100	rst		= 1'b0;

		$display("Simulation Finished Correctly");
		
		$stop;
		
	end
	
endmodule
