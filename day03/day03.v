// Edge Detector
module day03(
    input   clk,
    input   sig,
    output  pos_edge,
    output  neg_edge
);
    reg sig_prev = 0;
    always @(posedge clk)begin
        sig_prev <= sig;
    end

    assign pos_edge = ~sig_prev & sig;
    assign neg_edge = sig_prev & ~sig;

endmodule