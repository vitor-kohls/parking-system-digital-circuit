module detector (
    input [3:0] E,
    output S
    );


nand (S, E[3], E[2], E[1], E[0]);

endmodule