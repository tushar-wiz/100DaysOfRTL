// Round Robin Arbiter
module day15(
    input           clk,
    input   [3:0]   in_sig,   

    output  [3:0]   out_sig
);
    reg [1:0] reg_count = 0;
    reg [3:0] reg_mask = 4'b1000;

    always @(posedge clk) begin
        case(reg_count)
            2'b00:  reg_mask <= 4'b1000;
            2'b01:  reg_mask <= 4'b0100;
            2'b10:  reg_mask <= 4'b0010;
            3'b11:  reg_mask <= 4'b0001;
        endcase
        reg_count <= reg_count + 1;
    end

    assign out_sig = in_sig & reg_mask;

endmodule