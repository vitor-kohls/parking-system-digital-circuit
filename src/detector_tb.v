module detector_tb ();

reg [3:0]E;
wire S;

initial begin
    $dumpfile("sim/detector_tb.vcd"); 
    $dumpvars(0,detector_tb);
end   


detector detector1 (E, S);

//Tabela Verdade
initial begin
    for(integer i = 0; i < 16; i++) begin
        E = i;
        #10;
    end
    $finish; 
end
    
endmodule