`timescale 1ns/1ps
module day05_tb();
    reg clk;
    reg rst;

    wire [7:0] count;

    day05 m1(clk, rst, count);

    initial begin
        clk = 0;
        forever begin
            #1; clk = ~clk;
        end
    end

    initial begin
        rst <= 0;
        #400;
        rst <= 1;
        #3;
        rst <= 0;
        #10;
        $finish;
    end

    initial begin
        $dumpfile("day05.vcd");
        $dumpvars(0, day05_tb);
    end
endmodule