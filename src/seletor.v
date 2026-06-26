module seletor (input E, D, P, output S);

assign S = ~E | (D & P);

endmodule
