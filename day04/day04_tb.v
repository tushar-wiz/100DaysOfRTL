module day04_tb();
    reg [7:0] a;
    reg [7:0] b;
    reg [3:0] OP_CODE;
    wire [7:0] out;

    integer i,j;

    day04 m1(a,b,OP_CODE,out);
    initial begin
        for (i = 0; i < 7; i = i + 1) begin
            for (j = 0; j < 3; j = j + 1) begin
                a = $random%(256);
                b = $random%(256);
                OP_CODE = i;
                #2;
            end
        end
        OP_CODE = 7;
        a = 104;
        b = 321;
        #2;
        a = 32;
        b = 32;
        #2;
        $finish;
    end

    initial begin
        $dumpfile("day04.vcd");
        $dumpvars(0,day04_tb);
    end
endmodule