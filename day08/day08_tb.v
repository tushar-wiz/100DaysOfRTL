module day08_tb;
    reg [4:0] in;
    wire [31:0] out;
    
    day08 #(.BIN_LEN(5), .ONE_HOT_LEN(32)) m1(in, out);

    integer i;
    initial begin
        for (i = 0; i < 32 ; i++) begin
            in = i;
            #1;
        end
    end

    initial begin
        $dumpfile("day08.vcd");
        $dumpvars(0, day08_tb);
    end

endmodule