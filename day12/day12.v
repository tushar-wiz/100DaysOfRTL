// Detecting a Large Sequence
module day12(
    input   [15:0]  seq,
    input           stream,
    input           clk,
    input           rst,

    output          seq_detect
);
    reg [15:0] counter;

    always @(posedge clk) begin
        if(rst)
            counter <= 0;
        else
            counter <= {stream, counter[15:1]};
    end

    assign seq_detect = (counter == seq);

endmodule