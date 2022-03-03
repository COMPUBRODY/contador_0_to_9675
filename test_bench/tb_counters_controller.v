`timescale 1ns / 10ps
module tb_counters_controller();

    reg clock = 1'b0, reset = 1'b0, enable = 1'b1;
    wire[15:0]  Output;        //son las salidas de los contadores
    wire[3:0]   blinks;             // es el activador de reset 


    counters_controller     tb_counters_controller_DUT(
                                                            .clk    (clock),
                                                            .rst    (reset),
                                                            .ena    (enable),
                                                            .Qdata  (Output),
                                                            .blink  (blinks)
    );

    initial

        begin

            enable  =   1'b0;
            #50;
            enable  =   1'b1;
            $finish;
        end


    always #1 clock = ~clock;
    

endmodule
