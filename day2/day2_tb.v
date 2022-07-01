`timescale 1ns/1ps

module day2_tb();
    reg D;
    reg clk;
    reg rst;
    wire Q;
    wire Q_bar;

    day2 Dff(clk, D, rst, Q, Q_bar);

    initial begin
        clk = 0;
        forever begin
            #2.5 clk = ~clk;
        end
    end

    initial begin
        D = 0;
        rst = 0;
        #5;
        D = 1;
        rst = 0;
        #1.1;
        rst = 1;
        #2.2;
        D = 0;
        #5;
        D=1;
        rst=0;
        #5;
        $finish;
    end

    initial begin
        $dumpfile("day2.vcd");
        $dumpvars(0, day2_tb);
    end
endmodule