module codificador (
    input [3:0] E,
    output [2:0]S
    );


assign S[2] = ~(E[3] | E[2] | E[1] | E[0]);

assign S[1] = (E[3] & ~E[2] & ~E[1])
            | (E[2] & ~E[1] & ~E[0])
            | (~E[3] & ~E[2] & E[0])
            | (~E[3] & E[2] & ~E[1])
            | (~E[3] & E[1] & ~E[0])
            | (E[3] & ~E[2] & ~E[0]);


// Como o mapa de Karnaugh replica o comportamento de uma porta XOR - OU exculsivo -, foi aplicado a fórmula de tal porta, com 4 entradas
assign S[0] = (~E[3] & ((~E[2] & ((E[0] & ~E[1]) | (~E[0] & E[1]))) | (E[2] & ~((E[0] & ~E[1]) | (~E[0] & E[1])))))
            | (E[3] & ~((~E[2] & ((E[0] & ~E[1]) | (~E[0] & E[1]))) | (E[2] & ~((E[0] & ~E[1]) | (~E[0] & E[1])))));


endmodule