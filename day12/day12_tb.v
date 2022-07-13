`timescale 1ns/1ps
module day12_tb;
    reg   [15:0]  seq;
    reg           stream;
    reg           clk;
    reg           rst;
    wire          seq_detect;

    day12 m1(seq, stream, clk, rst, seq_detect);

    initial begin
        clk = 0;
        forever #0.5 clk = ~clk;
    end

    initial begin
        rst = 1;
        #2;
        rst = 0;
        seq = 3276;
        #25;
        $finish;
    end

    //Stream of data goes LSB first
    integer i = 0;
    reg [15:0] str = 16'b110011001100;
    initial begin
        stream = 0;
        #2;
        for(i = 0; i<16; i = i+1) begin
            stream = str[i];
            @(posedge clk);
        end
    end

    initial begin
        $dumpfile("day12.vcd");
        $dumpvars(0, day12_tb);
    end


endmodule