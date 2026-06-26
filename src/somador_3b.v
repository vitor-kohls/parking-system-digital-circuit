module somador_3b (
	input [2:0] a,
	input [2:0] b,
	input ci,
	output [2:0] s,
	output co
);

//sinais internos
wire co0, co1;
// primeira instância do somador de 1 bit
somador_1b somador0 (
	.a(a[0]),
	.b(b[0]),
	.ci(ci),
	.s(s[0]),
	.co(co0) // fio interno que conecta a primeira e a segunda instância 
); 
// segunda instância do somador de 1 bit
somador_1b somador1 (
	.a(a[1]),
	.b(b[1]),
	.ci(co0), // fio interno que conecta a primeira e a segunda instância
	.s(s[1]),
	.co(co1) // fio interno que conecta a segunda e a terceira instância
);
// terceira instância do somador de 1 bit
somador_1b somador2 (
	.a(a[2]),
	.b(b[2]),
	.ci(co1), // fio interno que conecta a segunda e a terceira instância
	.s(s[2]),
	.co(co)
);

endmodule

