// Parallel To Serial with Valid and Empty
// 1. Data loads only when Empty
// 2. When Data Value > 0 Valid signal is high 
module day11
(
    input   [3:0]   parallel_in,
    input           clk,
    input           rst,

    output          serial_out,
    output          valid_out,
    output          empty_out
);

    reg [3:0] counter;
    reg [1:0] count_shifts;
    
    always @(posedge clk) begin
        if(rst) begin
            counter <= 4'b0;
            count_shifts <= 2'b0;
        end
        else
            counter <= next_state;
    end

    assign next_state = (empty_out)?(parallel_in):({counter[2:0], 1'b0});

     
    always @(posedge clk) begin
        if(valid_out)
            count_shifts <= 0;
        else begin
            count_shifts <= (count_shifts == 3)?(2'b0):(count_shifts+1);
        end
    end

    assign serial_out = counter[3];
    assign empty_out = (count_shifts == 2'b0);
    assign valid_out = |counter;

endmodule