// SIPO Shift Register
module day06(
    input   serialIn,
    input   clk,
    input   rst,

    output  reg [3:0] parallelOut,
    output  serialOut
);

    always @(posedge clk) begin
        if(rst)
            parallelOut <= 0;
        else
            parallelOut <= {serialIn, parallelOut[3:1]};
    end
    
    assign serialOut = parallelOut[0];

endmodule