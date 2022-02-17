module counters_controller ( clk, rst, ena, Qdata, blink);

input clk, rst, ena;
output [15:0] Qdata;
output wire [3:0] blink;


//=======================================================
//  REG/WIRE declarations
//=======================================================

wire [3:0] flags;

wire [2:0] resets;

//=======================================================
//  Structural coding
//=======================================================
counter u0(	.clk(clk), 
				.rst(rst), 
				.ena(ena), 
				.carry(),
				.Qdata(Qdata[3:0]),
				.flag(flags[0])
	);
	

counter u1(	.clk(clk), 
				.rst(resets[0]), 
				.ena(), 
				.carry(flags[0]),
				.Qdata(Qdata[7:4]),
				.flag(flags[1])
	);

counter u2(	.clk(clk), 
				.rst(resets[1]), 
				.ena(), 
				.carry(flags[1]),
				.Qdata(Qdata[11:8]),
				.flag(flags[2])
	);

counter u3(	.clk(clk), 
				.rst(resets[2]), 
				.ena(), 
				.carry(flags[2]),
				.Qdata(Qdata[15:12]),
				.flag(flags[3])
	);


	assign blink[0] = (Qdata[3:0] == 4'b0101)? 1 : 0 ;		// Si qdata es 5 se activa el led
	assign blink[1] = (Qdata[7:4] == 4'b0111)? 1 : 0 ;		// Si qdata es 7 se activa el led	
	assign blink[2] = (Qdata[11:8] == 4'b0110)? 1 : 0 ;	// Si qdata es 6 se activa el led
	assign blink[3] = (Qdata[15:12] == 4'b1001)? 1 : 0 ;	// Si qdata es 9 se activa el led

	assign resets[0] = ( rst || (flags[1] && (Qdata[7:4] == 4'h09) ) )? 1 :0;	
	assign resets[1] = ( rst || (flags[2] && (Qdata[11:8] == 4'h09) ) )? 1 :0;	
	assign resets[2] = ( rst || (flags[3] && (Qdata[15:12] == 4'h09) ) )? 1 :0;	

endmodule


