module OneBitStage (
    input  wire [3:0]  A,
    input  wire [3:0]  B,
    output wire [3:0]  G,
    output wire [3:0]  P
);

assign G = A & B;
assign P = A | B;  
endmodule