module topo(
    input [8:0]sw,
    output [7:0]led,
    output [6:0]hex2, 
    output [6:0]hex1, 
    output [6:0]hex0
);

wire q_seg[3:0], v_seg[1:0], b_seg;


// Leds
assign led = sw[7:0]

// Processamento dos Sinais de Entrada
motorista motorista1(
    .VE(sw[7:4]),
    .VD(sw[3:0]),
    .P(sw[8]),
    .Q(q_seg),
    .V(v_seg),
    .B(b_seg)
);

// Display de 7 Segmentos (Output)

bcd_para_7seg decod2(
    .a(q_seg[3]),
    .b(q_seg[2]),
    .c(q_seg[1]),
    .d(q_seg[0]),
    .G(hex0[6]),
    .F(hex0[5]),
    .E(hex0[4]),
    .D(hex0[3]),
    .C(hex0[2]),
    .B(hex0[1]),
    .A(hex0[0])
);

bcd_para_7seg decod1(
    .a(1'b0),
    .b(1'b0),
    .c(v_seg[1]),
    .d(v_seg[0]),
    .G(hex1[6]),
    .F(hex1[5]),
    .E(hex1[4]),
    .D(hex1[3]),
    .C(hex1[2]),
    .B(hex1[1]),
    .A(hex1[0])
);

bcd_para_7seg decod0(
    .a(1'b0),
    .b(1'b0),
    .c(1'b0),
    .d(b_seg),
    .G(hex2[6]),
    .F(hex2[5]),
    .E(hex2[4]),
    .D(hex2[3]),
    .C(hex2[2]),
    .B(hex2[1]),
    .A(hex2[0])
);

endmodule