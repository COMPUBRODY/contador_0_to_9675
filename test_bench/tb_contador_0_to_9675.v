`timescale 1ns / 10ps

module tb_contador_0_to_9675();

	//todas las entradas del modulo se declaran como reg en el tb
	reg	clk;
	reg	[3:0]switch;
	
	//todas las saludas como wires
	wire	[6:0]disp_0;
	wire	[6:0]disp_1;
	wire	[6:0]disp_2;
	wire	[6:0]disp_3;		//todos los display
	wire	[3:0]leds;			//todos los led
	
	
	always #1 clk = ~clk;
	//localparam period = 2 ;
	//=======================================================
	//  DUT Instantiation
	//=======================================================
	contador_0_to_9675	tb_contador_0_to_9675_DUT(		.CLOCK_50	(clk),
														.SW			(switch),
														//OUTPUTS
														.HEX0		(disp_0),
														.HEX1		(disp_1),
														.HEX2		(disp_2),
														.HEX3		(disp_3),
														.LEDR		(leds)
	);

	initial
		
		begin
		
			clk		=	1'b0;
			//keys	=	3'b111;		//set all buttons to 0 IDK IF TIS NEED TO BE 1 it deppends in the logic of the hardware push up or push down
			switch[2:0]	=	3'b000;	//Set all Switches to 0

			//ENABLE the counter
			
			#50;
			switch[2:0]	=	3'b001;
			#50
			switch[2:0]	=	3'b010;
			#50
			switch[2:0]	=	3'b011;
			#50
			switch[2:0]	=	3'b100;
			#50
			switch[2:0]	=	3'b101;
			#50
			switch[2:0]	=	3'b110;
			#50
			switch[2:0]	=	3'b111;
			#50
			#50
			#50
			
			$display("Simulation in contador_0_to_9675 Finished!");
			$stop;
			
		end
		

endmodule
