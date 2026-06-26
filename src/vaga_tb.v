module vaga_tb ();

reg [3:0]E;
wire [1:0]S;


initial begin
    $dumpfile("sim/vaga_tb.vcd"); 
    $dumpvars(0, vaga_tb);
end   

vaga uut (E, S);

//Tabela Verdade
initial begin
    for(integer i = 0; i < 16; i++) begin
        E = i;
        #10;
    end

    $finish; 
end
    
endmodule