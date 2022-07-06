`timescale 1ns/1ps
module day06_tb;
    reg clk;
    reg serialIn;
    reg rst;
    wire [3:0] parallelOut;
    wire serialOut;

    day06 m1(serialIn, clk, rst, parallelOut, serialOut);

    initial begin
        clk = 0;
        forever #0.5 clk = ~clk;
    end

    initial begin
        rst = 1;
        #1;
        rst = 0;
        serialIn = 1;
        #1;
        serialIn = 0;
        #5;
        $finish;
    end

    initial begin
        $dumpfile("day06.vcd");
        $dumpvars(0, day06_tb);
    end
endmodule