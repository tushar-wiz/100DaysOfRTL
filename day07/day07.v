// Linear Feedback Shift Register
module day07(
    input   clk,
    input   rst,

    output reg  [3:0] out
);
    always @(posedge clk) begin
        if(rst)
            out <= 4'hB;
        else
            out <= {out[2:0], out[3]^out[2]};
    end

endmodule