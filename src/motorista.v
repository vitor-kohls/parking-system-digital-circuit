module motorista (
    input [3:0] VE,
    input [3:0] VD,
    input P,
    output [3:0] Q,
    output [1:0] V,
    output B
);


// Bloco responsável pela saída Q - quantidade de vagas

wire [2:0] s_codE;
wire [2:0] s_codD;

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



// Bloco responsável pelo bloco B - Direita ou Esquerda

wire s_seletor;
wire s_deteD;
wire s_deteE;


detector detector_D (
    .E(VD),
    .S(s_deteD)
);

detector detector_E (
    .E(VE),
    .S(s_deteE)
);

seletor seletor_bloco (
    .E(s_deteE),
    .D(s_deteD),
    .P(P),
    .S(s_seletor)
);

assign B = s_seletor;

// Bloco responsável pela saída  V - número da vaga

wire [1:0] s_vagD;
wire [1:0] s_vagE;

vaga seletor_vagaD (
    .E(VD),
    .S(s_vagD)
);


vaga seletor_vagaE (
    .E(VE),
    .S(s_vagE)
);

mux22a mux (
    .D(s_vagD),
    .E(s_vagE),
    .S(s_seletor),
    .Y(V)
);


endmodule