module counters_controller ( clk, reset, ena, Qdata, blink);

input clk, reset, ena;
output [15:0] Qdata;
output wire [3:0] blink;


//=======================================================
//  REG/WIRE declarations
//=======================================================


//reg reset;

//=======================================================
//  Structural coding
//=======================================================
counter u0(	.clk(clk), 
				.rst(reset), 
				.ena(ena), 
				.Qdata(Qdata[3:0])
	);
	


counter u1(	.clk(clk), 
				.rst(reset), 
				.ena(ena), 
				.Qdata(Qdata[7:4])
	);

counter u2(	.clk(clk), 
				.rst(reset), 
				.ena(ena), 
				.Qdata(Qdata[11:8])

	);

counter u3(	.clk(clk), 
				.rst(reset), 
				.ena(ena), 
				.Qdata(Qdata[15:12])

	);


	assign blink[0] = (Qdata[3:0] == 4'b0101)? 1 : 0 ;		// Si qdata es 5 se activa el led
	assign blink[1] = (Qdata[7:4] == 4'b0111)? 1 : 0 ;		// Si qdata es 7 se activa el led	
	assign blink[2] = (Qdata[11:8] == 4'b0110)? 1 : 0 ;	// Si qdata es 6 se activa el led
	assign blink[3] = (Qdata[15:12] == 4'b1001)? 1 : 0 ;	// Si qdata es 9 se activa el led
	
	/*always@(posedge clk)
    begin
			if (blink[3:0] == 4'b1111)	 
				reset <= 1'b1;
			else 
				reset <= 1'b0;
			
    end
	 
	
	
	assign resets[0] = ( rst || (flags[1] && (Qdata[7:4] == 4'h09) ) )? 1 :0;	
	assign resets[1] = ( rst || (flags[2] && (Qdata[11:8] == 4'h09) ) )? 1 :0;	
	assign resets[2] = ( rst || (flags[3] && (Qdata[15:12] == 4'h09) ) )? 1 :0;	
*/
endmodule


