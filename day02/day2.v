// positive edge D ff with Async reset
module day2(
    input   clk,
    input   D,
    input   rst,
    output  reg Q,
    output  Q_bar
);
    always @(posedge clk or posedge rst) begin
        if(rst)
            Q <= 0;
        else
            Q <= D;
    end

    assign Q_bar = ~Q;

endmodule