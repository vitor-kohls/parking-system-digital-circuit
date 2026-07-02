module topo (
    input [8:0] sw, // Chaves
    output [6:0] hex0,
    output [6:0] hex1,
    output [6:0] hex2,
    output [7:0] led
);
    wire B;
    wire [1:0] V;
    wire [1:0] Q;

    motorista motoris (
        .E(sw[3:0]),
        .D(sw[7:4]),
        .P(sw[8]),
        .Q(Q),
        .V(V),
        .B(B),

    );
    bcd_para_7seg bcd2sevenseg0_B (
        .a(0),
        .b(0),
        .c(0),
        .d(B),
        .G(hex0[6]),
        .F(hex0[5]),
        .E(hex0[4]),
        .D(hex0[3]),
        .C(hex0[2]),
        .B(hex0[1]),
        .A(hex0[0])
    );
    bcd_para_7seg bcd2sevenseg0_V (
        .a(0),
        .b(0),
        .c(V[1]),
        .d(V[0]),
        .G(hex1[6]),
        .F(hex1[5]),
        .E(hex1[4]),
        .D(hex1[3]),
        .C(hex1[2]),
        .B(hex1[1]),
        .A(hex1[0])
    );
    bcd_para_7seg bcd2sevenseg0_Q (
        .a(Q[3]),
        .b(Q[2]),
        .c(Q[1]),
        .d(Q[0]),
        .G(hex3[6]),
        .F(hex3[5]),
        .E(hex3[4]),
        .D(hex3[3]),
        .C(hex3[2]),
        .B(hex3[1]),
        .A(hex3[0])
    );
endmodule