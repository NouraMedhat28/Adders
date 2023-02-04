module FullAdder (
    input  wire A0,
    input  wire B0,
    input  wire Cin,
    output wire S0,
    output wire Cout
);

assign {Cout, S0} = A0 + B0 + Cin;
    
endmodule