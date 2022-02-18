
//                     email: fernando.madera@cinvestav.mx
//
// ============================================================================
//								Thu Feb 11 11:26:45 2022
//
//								Modified by	Fernando Madera
// ============================================================================


`define ENABLE_CLOCK
`define ENABLE_HEX
//`define ENABLE_KEY
`define ENABLE_LEDR
`define ENABLE_SW
//`define ENABLE_CORRIMIENTO



module contador_0_to_9675(

      /* Enables CLOCK */
	`ifdef ENABLE_CLOCK
      input              CLOCK_50,
	`endif

      /* Enables HEX - 3.3V */
	`ifdef ENABLE_HEX
      output      [6:0]  HEX0,
      output      [6:0]  HEX1,
      output      [6:0]  HEX2,
      output      [6:0]  HEX3,
	`endif

      /* Enables KEY - 3.3V */
	`ifdef ENABLE_KEY
      input       [3:0]  KEY,
	`endif

      /* Enables LEDR - 3.3V */
	`ifdef ENABLE_LEDR
      output      [9:0]  LEDR,
	`endif

      /* Enables SW - 3.3V */
	`ifdef ENABLE_SW
      input       [9:0]  SW
	`endif

);


//=======================================================
//  REG/WIRE declarations
//=======================================================

reg  [31:0]	Cont;
wire [15:0]	display_nums;
wire reset;
wire enable;
wire clock;


//=======================================================
//  Structural coding
//=======================================================
/*
always@(posedge CLOCK_50 or negedge KEY[0])
    begin
        if(!KEY[0])
			 Cont	<=	0;
        else
			 Cont	<=	Cont+1;
			 
    end
*/	 

	 
assign enable = (SW[1])? 1 : 0;		// DEBOUNCING 

//ASSIGNING THE CLOCK_DIVIDER 
clock_divider					u0 (		.fast_clock (CLOCK_50),
											.rst			(SW[2]),
											.slow_clock	(clock)
											
	);


// ASSIGNING THE COUNTERS CONTROLLER
counters_controller			u1	(			.clk		(clock), 
											.rst		(SW[0]), 
											.ena		(enable),
											.Qdata	(display_nums[15:0]),
											.blink	(LEDR[3:0])
											

	);


// ASSIGNING THE DISPLAYS CONTROLLER 
displays_controller			u2	(	//SALIDAS
											.seg0(HEX0),
											.seg1(HEX1),
											.seg2(HEX2),
											.seg3(HEX3),
											//ENTRADAS
											.num(display_nums) );


endmodule


//// ASSIGNING THE SHIFT REGISTER
//`ifdef ENABLE_CORRIMIENTO
//corrimiento_9bits				u1 (	.clk		(Cont[23:22]),
//											.rst		(SW[0]),
//											.enable	(SW[1]),
//											.dir		(SW[2]),
//											.in		(Cont[23:22]),
//											.Out		(LEDR)	);
//`endif