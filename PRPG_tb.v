`timescale 1ns/1ps 

module PRPG_tb();

reg set;
reg clk;
wire [2:0]Qout;

parameter PERIOD = 20;
parameter real DUTY_CYCLE = 0.5;
parameter OFFSET = 0;  

initial
    begin   
        #OFFSET;
        forever
            begin
                clk = 1'b1;
                #(PERIOD-(PERIOD*DUTY_CYCLE)) clk = 1'b0;
                #(PERIOD*DUTY_CYCLE);
            end
        end
initial begin
    set = 1;
    #10  set = 0;
    #300 $finish;
end
initial
    begin
        $dumpfile("PRPG.vcd"); 
        $dumpvars(0,prpg);  
    end
PRPG prpg(
    .Qout(Qout),
    .clk(clk),
    .set(set)
);
endmodule
