module  mux22a (
        input [1:0] D, // entrada de dados D
        input [1:0] E, // entrada de dados E
        input S, // seleção
        output [1:0]Y // saída do mux
    );
    assign Y[0] = (S & D[0]) | (~S & E[0]); 
    assign Y[1] = (S & D[1]) | (~S & E[1]); 

endmodule