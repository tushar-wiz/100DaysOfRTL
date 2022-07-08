module day08
#(
    parameter   BIN_LEN = 4,
    parameter   ONE_HOT_LEN = 8
)
(
    input   [BIN_LEN-1:0]       binaryIn,
    output  [ONE_HOT_LEN-1:0]   oneHotOut
);

    assign oneHotOut = (1 << binaryIn);

endmodule