// ============================================================================
// Copyright (c) 2013 by Terasic Technologies Inc.
// ============================================================================
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development 
//   Kits made by Terasic.  Other use of this code, including the selling 
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use 
//   or functionality of this code.
//
// ============================================================================
//           
//  Terasic Technologies Inc
//  9F., No.176, Sec.2, Gongdao 5th Rd, East Dist, Hsinchu City, 30070. Taiwan
//  
//  
//                     web: http://www.terasic.com/  
//                     email: support@terasic.com
//
// ============================================================================
//								Thu Feb 11 11:26:45 2022
//
//								Modified by	Fernando Madera
// ============================================================================


`define ENABLE_CLOCK
`define ENABLE_HEX
`define ENABLE_KEY
`define ENABLE_LEDR
`define ENABLE_SW

/*
module DE1_SOC_golden_top(
*/
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


//=======================================================
//  Structural coding
//=======================================================
always@(posedge CLOCK_50 or negedge KEY[0])
    begin
        if(!KEY[0])
			 Cont	<=	0;
        else
			 Cont	<=	Cont+1;
			 
    end
	 

	 
assign enable = (SW[1])? 1 : 0;		// DEBOUNCING 

// ASSIGNING THE COUNTERS CONTROLLER
counters_controller			u0	(	.clk		(Cont[15:14]), 
											.rst		(SW[0]), 
											.ena		(enable),
											.Qdata	(display_nums[15:0]),
											.blink	(LEDR[3:0])
											

	);

//assign reset = (SW[0] || (LEDR == 4'b1111) )? 1 : 0 ; 	//cuando los 4 leds esten encendidos al mismo tiempo aplica un reset, o con el switch 0
	
	 /* || (LEDR == 4'b1111) */
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
//corrimiento_9bits				u1 (	.clk		(Cont[23:22]),
//											.rst		(SW[0]),
//											.enable	(SW[1]),
//											.dir		(SW[2]),
//											.in		(Cont[23:22]),
//											.Out		(LEDR)	);