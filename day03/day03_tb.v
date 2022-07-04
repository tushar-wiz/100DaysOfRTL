`timescale 1ns/1ps

module day03_tb();
    reg clk;
    reg sig;
    wire pos_edge;
    wire neg_edge;

    day03 m1(clk, sig, pos_edge, neg_edge);

    initial begin
        clk = 0;
        forever begin
            #1 clk = ~clk;
        end
    end

    integer i;

    initial begin
        sig = 0;
        @(posedge clk) begin
		    for(i=0;i<16;i = i+1) begin
                sig <= $random%2;
                @(posedge clk);
            end
        end
        $finish;
    end

    initial begin
        $dumpfile("day03.vcd");
        $dumpvars(0, day03_tb);
    end
endmodule
