// Counter with Load Operation
module day10
#(
    parameter BIN_LEN = 4
)
(
    input   [BIN_LEN-1:0]   load_val,
    input                   load_en,
    input                   clk,
    input                   rst,
    
    output  [BIN_LEN-1:0]   out_val 
);

    reg [BIN_LEN-1:0] count;

    always @(posedge clk) begin
        if(rst)
            count <= 0;
        else
            count <= (load_en)?(load_val):(count+1);
    end

    assign out_val = count;

endmodule