module day14_tb;

    reg [7:0] in_sig;
    wire [7:0] out_sig;

    day14 m1(in_sig, out_sig);

    integer i;
    integer j;
    initial begin
        for(i = 0;i<10;i = i + 1)begin
            for(j=0;j<8;j = j + 1)begin
                in_sig[j] = $random%2;
            end
            #1;
        end
    end
    
    initial begin
        $dumpfile("day14.vcd");
        $dumpvars(0, day14_tb);
    end
endmodule