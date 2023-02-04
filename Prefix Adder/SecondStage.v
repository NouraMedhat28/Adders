module SecondStage (
    input  wire  G1,
    input  wire  G2,
    input  wire  P1,
    input  wire  P2,
    output wire  Pout,
    output wire  Gout
);

assign Pout = P1 & P2;
assign Gout = G2 | (G1 & P2);   
endmodule