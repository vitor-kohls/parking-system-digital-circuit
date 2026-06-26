module vaga (
    input [3:0] E,
    output [1:0] S
);

assign S[1] = E[1] & E[0];
assign S[0] = (E[2] & E[0]) | (~E[1] & E[0]);


endmodule