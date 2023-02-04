module CLA (
    input  wire [3:0] A,
    input  wire [3:0] B,
    input  wire       Cin,
    output wire [4:0] Result
);

reg  [3:0] p, g;
reg  [4:0] PredCarry;
wire [3:0] S;

always @(*) begin
    //Propagation signal for each column
    p <= A | B;

    //Generation signal for each column
    g <= A & B;
end

always @(*) begin
    PredCarry[0] <= Cin;
    PredCarry[1] <= g[0] | (p[0] & PredCarry[0]);
    PredCarry[2] <= g[1] | (p[1] & PredCarry[1]);
    PredCarry[3] <= g[2] | (p[2] & PredCarry[2]);
    PredCarry[4] <= g[3] | (p[3] & PredCarry[3]);
end

//1st  bit
FullAdder     Bit0
(.A0          (A[0]),
 .B0          (B[0]),
 .Cin         (PredCarry[0]),
 .S0          (S[0]),
 .Cout        ()
 );

//2nd bit
FullAdder     Bit1
(.A0          (A[1]),
 .B0          (B[1]),
 .Cin         (PredCarry[1]),
 .S0          (S[1]),
 .Cout        ()
);

//3rd bit
FullAdder     Bit2
(.A0          (A[2]),
 .B0          (B[2]),
 .Cin         (PredCarry[2]),
 .S0          (S[2]),
 .Cout        ()
);

//4th bit
FullAdder     Bit3
(.A0          (A[3]),
 .B0          (B[3]),
 .Cin         (PredCarry[3]),
 .S0          (S[3]),
 .Cout        ()
);

assign Result = {PredCarry[4], S};
endmodule