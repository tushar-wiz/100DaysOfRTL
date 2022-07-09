// binary to gray code
module day09 
#(
    parameter BIN_LEN = 4
) 
(
    input   [BIN_LEN-1:0] bin_code,
    output  [BIN_LEN-1:0] gray_code
);
    genvar i;
    
    assign gray_code[BIN_LEN-1] = bin_code[BIN_LEN-1];

    for(i = 0; i < BIN_LEN - 1 ; i = i + 1)begin
        assign gray_code[i] = bin_code[i+1] ^ bin_code[i];
    end
    
endmodule