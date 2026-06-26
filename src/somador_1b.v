module somador_1b (
	input a,
	input b,
	input ci,
	output s,
	output co
);

//saída de soma
assign s = (~ci & ~b & a)|(~ci & b & ~a)|(ci & ~b & ~a)|(ci & b & a);

//saída de carry-out
assign co = (ci & b) | (ci & a) | (b & a);

endmodule
