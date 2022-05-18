module PRPG (Qout,clk,set);
    input clk;
    input set;
    output [2:0]Qout;
    reg [2:0]Qout;

    always@(posedge clk)begin
        if(set)begin
            Qout <= 3'b110;
        end
        else begin
            Qout[0] <= Qout[2] ^ Qout[0];
            Qout[1] <= Qout[0];
            Qout[2] <= Qout[1];
        end
    end
endmodule
