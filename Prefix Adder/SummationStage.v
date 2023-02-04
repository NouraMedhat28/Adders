module SummationStage (
    input  wire In1,
    input  wire In2,
    input  wire G,
    output wire S
);

assign S = G ^ (In1 ^ In2);
    
endmodule