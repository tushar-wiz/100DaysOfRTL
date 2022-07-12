`timescale 1ns/1ps
module day11_tb;
    reg [3:0] parallel_in;
    reg clk;
    reg rst;
    wire serial_out;
    wire valid_out;
    wire empty_out;

    day11 m1(parallel_in, clk, rst, serial_out, valid_out, empty_out);

    initial begin
        clk = 0;
        forever #0.5 clk = ~clk;   
    end

    initial begin
        rst = 1;
        parallel_in = 4;
        #2;
        rst = 0;
        #2;
        parallel_in = 5;
        #5;
        rst = 1;
        #1;
        $finish;
    end

    initial begin
        $dumpfile("day11.vcd");
        $dumpvars(2, day11_tb);
    end

endmodule