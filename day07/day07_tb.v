module day07_tb;
    reg clk;
    reg rst;
    wire out;

    day07 m1(clk,rst,out);

    initial begin
        clk = 0;
        forever begin
            #0.5 clk = ~clk;
        end
    end

    initial begin
        rst = 1;
        #2;
        rst = 0;
        #15;
        rst = 1;
        #2;
        rst = 0;
        #4;
        $finish;
    end

    initial begin
        $dumpfile("day07.vcd");
        $dumpvars(0, day07_tb);
    end
endmodule