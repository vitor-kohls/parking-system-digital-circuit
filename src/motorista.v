module motorista (
    input [3:0] VE,
    input [3:0] VD,
    input P,
    output [3:0] Q,
    output [1:0]V,
    output B
);


// Bloco responsável pela saída Q - quantidade de vagas

wire [2:0] s_codE, s_codD;

codificador codificador_VE (
    .E(VE),
    .S(s_codE)
);

codificador codificador_VD (
    .E(VD),
    .S(s_codD)
);

somador_3b somador (
    .a(s_codE),
    .b(s_codD),
    .ci(0), // Carry in vazio
    .s(Q[2:0]),
    .co(Q[3])
);


// Bloco responsável pela saída  V - número da vaga

wire [1:0] s_vagD, s_vag;

vaga seletor_vagaD (
    .E(D),
    .S(s_vagD)
);


vaga seletor_vagaE (
    .E(E),
    .S(s_vagE)
);

mux22a mux (
    .D(s_vagD),
    .E(s_vagE),
    .S(B),
    .Y(V)
);


// Bloco responsável pelo bloco B - Direita ou Esquerda

wire s_deteD, s_deteE;

detector detector_D (
    .E(D),
    .S(s_deteD)
);

detector detector_E (
    .E(E),
    .S(s_deteE)
);

seletor seletor_bloco (
    .E(s_deteE),
    .D(s_deteD),
    .P(P),
    .S(B)
);

endmodule
