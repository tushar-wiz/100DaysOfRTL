// Odd 8bit Counter 
module day05(
    input   clk,
    input   rst,

    output reg [7:0] count = 8'b1
);
    always @(posedge clk)begin
        if(rst)
            count <= 8'b1;
        else begin
            count <= count + 2;
        end
    end

endmodule
