// Mux using different techniques
module day13(
    input   [3:0] a,
    input   [1:0] sel,

    output      y_ter_out,
    output  reg y_case_out,
    output  reg y_ifelse_out,
    output      y_aor_out
);
    //ternary op
    assign y_ter_out = (sel == 2'b00)?a[3]:
                       (sel == 2'b01)?a[2]:
                       (sel == 2'b10)?a[1]:
                       (sel == 2'b11)?a[0]:2'bxx;

    always @(*) begin
        case (sel)
            2'b00 : y_case_out = a[3];
            2'b01 : y_case_out = a[2];
            2'b10 : y_case_out = a[1];
            2'b11 : y_case_out = a[0]; 
            default: y_case_out = 2'bxx;
        endcase
    end 
    
    always @(*) begin
        if(sel == 2'b00)
            y_ifelse_out = a[3];
        else if(sel == 2'b01)
            y_ifelse_out = a[2];
        else if(sel == 2'b10)
            y_ifelse_out = a[1];
        else if(sel == 2'b11)
            y_ifelse_out = a[0];
        else
            y_ifelse_out = 2'bxx;
    end

    assign y_aor_out = (a[3] & ~(|sel))|(a[2] & (~sel[1] & sel[0]))|(a[1] & (sel[1] & ~sel[0]))|(a[0] & (&sel));    

endmodule