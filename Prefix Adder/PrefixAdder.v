module PrefixAdder (
    input  wire [3:0] A,
    input  wire [3:0] B,
    input  wire       Cin,
    output wire [4:0] Result
);

wire [3:0] GBit, PBit;
//The needed Ps & Gs signals for the summation
wire P0, G0, P1, G1, P2, G2, P3, G3;

//Intermediate signals
wire PIntermediate1, GIntermediate1;


OneBitStage         Stage0
(.A                 (A),
 .B                 (B),
 .G                 (GBit),                
 .P                 (PBit)
);

SecondStage         StageOne1 //G0:-1
(.G1                (Cin),
 .G2                (GBit[0]),
 .P1                (1'b1),
 .P2                (PBit[0]),
 .Pout              (P0),//P0:-1
 .Gout              (G0) //G0:-1
);

SecondStage         StageOne2 //G2:1
(.G1                (GBit[1]),
 .G2                (GBit[2]),
 .P1                (PBit[1]),
 .P2                (PBit[2]),
 .Pout              (PIntermediate1),//P2:1
 .Gout              (GIntermediate1) //G2:1
);

SecondStage         StageTwo1 //G1:-1
(.G1                (G0),
 .G2                (GBit[1]),
 .P1                (P0),
 .P2                (PBit[1]),
 .Pout              (P1),//P1:-1
 .Gout              (G1) //G1:-1
);

SecondStage         StageTwo2 //G2:-1
(.G1                (G0),
 .G2                (GIntermediate1),
 .P1                (P0),
 .P2                (PIntermediate1),
 .Pout              (P2),//P2:-1
 .Gout              (G2) //G2:-1
);

SecondStage         StageThree //G3:-1
(.G1                (G2),
 .G2                (GBit[3]),
 .P1                (P2),
 .P2                (PBit[3]),
 .Pout              (P3),
 .Gout              (G3)
);

SummationStage      S0
(.In1               (A[0]),
 .In2               (B[0]),
 .G                 (Cin),
 .S                 (Result[0])
);

SummationStage      S1
(.In1               (A[1]),
 .In2               (B[1]),
 .G                 (G0),
 .S                 (Result[1])
);

SummationStage      S2
(.In1               (A[2]),
 .In2               (B[2]),
 .G                 (G1),
 .S                 (Result[2])
);

SummationStage      S3
(.In1               (A[3]),
 .In2               (B[3]),
 .G                 (G2),
 .S                 (Result[3])
);

//Carry
assign Result[4] = GBit[3];
endmodule