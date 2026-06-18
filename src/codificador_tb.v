module codificador_tb ();

reg [3:0]E;
wire [2:0]S;


initial begin
    $dumpfile("sim/codificador_tb.vcd"); 
    $dumpvars(0,codificador_tb);
end   

codificador codificador1 (E, S);

//Tabela Verdade
initial begin
    E[3] = 0; E[2] = 0; E[1] = 0; E[0] = 0; #10
    E[3] = 0; E[2] = 0; E[1] = 0; E[0] = 1; #10
    E[3] = 0; E[2] = 0; E[1] = 1; E[0] = 0; #10
    E[3] = 0; E[2] = 0; E[1] = 1; E[0] = 1; #10
    E[3] = 0; E[2] = 1; E[1] = 0; E[0] = 0; #10
    E[3] = 0; E[2] = 1; E[1] = 0; E[0] = 1; #10
    E[3] = 0; E[2] = 1; E[1] = 1; E[0] = 0; #10
    E[3] = 0; E[2] = 1; E[1] = 1; E[0] = 1; #10
    E[3] = 1; E[2] = 0; E[1] = 0; E[0] = 0; #10
    E[3] = 1; E[2] = 0; E[1] = 0; E[0] = 1; #10
    E[3] = 1; E[2] = 0; E[1] = 1; E[0] = 0; #10
    E[3] = 1; E[2] = 0; E[1] = 1; E[0] = 1; #10
    E[3] = 1; E[2] = 1; E[1] = 0; E[0] = 0; #10
    E[3] = 1; E[2] = 1; E[1] = 0; E[0] = 1; #10
    E[3] = 1; E[2] = 1; E[1] = 1; E[0] = 0; #10
    E[3] = 1; E[2] = 1; E[1] = 1; E[0] = 1; #10
    $finish; 
end
    
endmodule