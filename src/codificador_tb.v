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
        for(integer i = 0; i < 16; i++) begin
            E = i;
            #10;
        end
        $finish;
    $finish; 
end
    
endmodule