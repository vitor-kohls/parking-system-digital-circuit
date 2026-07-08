module seletor_tb ();

reg E, D, P;
wire S;

initial begin
    $dumpfile("sim/seletor_tb.vcd"); 
    $dumpvars(0,seletor_tb);
end   


seletor uut (E, D, P, S);

//Tabela Verdade
initial begin
        P = 0; E = 0; D = 0; #10
        P = 0; E = 0; D = 1; #10
        P = 0; E = 1; D = 0; #10
        P = 0; E = 1; D = 1; #10
        P = 1; E = 0; D = 0; #10
        P = 1; E = 0; D = 1; #10
        P = 1; E = 1; D = 0; #10
        P = 1; E = 1; D = 1; #10
    $finish; 
end
    
endmodule