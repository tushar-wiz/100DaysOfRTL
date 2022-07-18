module day15_tb;

    reg clk;
    reg [3:0] in_sig;   
    wire [3:0] out_sig;

    day15 m1(clk, in_sig, out_sig);
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    integer i;
    initial begin
        for (i = 0; i < 100; i = i + 1) begin
            in_sig = $random%16;
            #1;
        end
        $finish;
    end


    initial begin
        $dumpfile("day15.vcd");
        $dumpvars(0, day15_tb);
    end
endmodule