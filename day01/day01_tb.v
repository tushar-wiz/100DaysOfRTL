module day1_tb();
    reg [3:0] a;
    reg [3:0] b;
    reg sel;
    wire [3:0]out;

    integer i;

    initial begin
        for(i=0; i < 10; i =  i + 1) begin
            a = {$random}%16;
            b = {$random}%16;
            sel = {$random}%2;
            #5;
        end
    end

    day1 m1(sel,a,b,out);

    initial begin
        $dumpfile("day1.vcd");
        $dumpvars(0, day1_tb);
    end

endmodule