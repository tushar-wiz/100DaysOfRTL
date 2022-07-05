// 2 input 4 bit mux
module day01(
    input   sel,
    input   [3:0] a,
    input   [3:0] b,
    output  [3:0] c
);
    assign c = (sel) ? b : a;

endmodule
