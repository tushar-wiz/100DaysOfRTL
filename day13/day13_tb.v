module day13_tb;
    reg [3:0] a;
    reg [1:0] sel;

    wire y_ter_out;
    wire y_case_out;
    wire y_ifelse_out;
    wire y_aor_out;

    day13 m1(a, sel, y_ter_out, y_case_out, y_ifelse_out, y_aor_out);

    integer i;

    initial begin
        a = 4'b1000;
        for (i = 0; i < 4; i = i + 1) begin
            sel = i;
            #1;
        end
        a = 4'b0100;
        for (i = 0; i < 4; i = i + 1) begin
            sel = i;
            #1;
        end
        a = 4'b0010;
        for (i = 0; i < 4; i = i + 1) begin
            sel = i;
            #1;
        end
        a = 4'b0001;
        for (i = 0; i < 4; i = i + 1) begin
            sel = i;
            #1;
        end
        $finish;
    end

    initial begin
        $dumpfile("day13.vcd");
        $dumpvars(0, day13_tb);
    end
endmodule