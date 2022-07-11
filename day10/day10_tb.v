`timescale 1ns/1ps
module day10_tb;

    reg [3:0] load_val;
    reg load_en;
    reg clk;
    reg rst;
    wire [3:0] out;

    day10 #(.BIN_LEN(4)) m1(load_val, load_en, clk, rst, out);

    initial begin
        clk = 0;
        forever begin
            #0.5 clk = ~clk;
        end
    end

    initial begin
        rst = 1;
        load_en = 0;
        #1;
        rst = 0;
        load_val = 12;
        load_en = 0;
        #5;
        load_en = 1;
        #2;
        load_en = 0;
        #5;
        rst = 1;
        #1;
        load_en = 1;
        rst = 1;
        #2;
        $finish;
    end

    initial begin
        $dumpfile("day10.vcd");
        $dumpvars(0, day10_tb);
    end

endmodule