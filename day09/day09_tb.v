module day09_tb;
    reg [5:0] bin_code;
    wire [5:0] gray_code;

    day09 #(.BIN_LEN(6)) m1(bin_code, gray_code);

    integer i;

    initial begin
        for(i = 0; i < (1<<6); i = i + 1)begin
            bin_code = i;#1;
        end
    end

    initial begin
        $dumpfile("day09.vcd");
        $dumpvars(0, day09_tb);
    end
endmodule