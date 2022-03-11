`timescale 1ns / 10ps
module tb_counters_controller();

    reg clock = 0, reset = 1, enable = 0;
    wire[15:0]  Output;        //son las salidas de los contadores
    wire[3:0]   blinks;             // es el activador de reset 


    counters_controller     tb_counters_controller_DUT(
                                    .clk    (clock),
                                    .reset    (reset),
                                    .ena    (enable),
                                    .Qdata  (Output),
                                    .blink  (blinks)
);

    //initial Output <= 14'b11111111111111;
    initial #10 reset = 0;
    initial #10 enable = 1;
    initial repeat (50) #1 clock = ~clock;
    initial $monitor ("Tiempo %t", $time);

    

endmodule
