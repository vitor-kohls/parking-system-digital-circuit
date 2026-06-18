module detector (input [3:0] E, output S);
assign S = E[3] | E[2] | E[1] | E[0];
endmodule