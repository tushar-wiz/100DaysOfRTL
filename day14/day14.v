// Priority Arbiter
// in_sig[0] highest priority
module day14 (
    input   [7:0]   in_sig,
    output  [7:0]   out_sig
);

    assign out_sig[0] = in_sig[0];

    genvar i;
    for(i = 1; i < 8; i = i + 1)begin
        assign out_sig[i] = in_sig[i] & ~(|out_sig[i-1:0]);
    end
    
endmodule