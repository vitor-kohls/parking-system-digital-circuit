module bcd_para_7seg (
    input a, 
    input b, 
    input c, 
    input d,
    output G, 
    output F, 
    output E, 
    output D,
    output C, 
    output B, 
    output A
);

assign G = (~a & ~b & ~c)|(b & c & d);
assign F = (~a & ~b & d)|(~b & c)|(c & d);
assign E = (d)|(b & ~c);
assign D = (b & ~c & ~d)|(b & c & d)|(~a & ~b & ~c & d);
assign C = (~b & c & ~d);
assign B = (b & ~c & d)|(b & c & ~d);
assign A = (b & ~c & ~d)|(~a & ~b & ~c & d);

endmodule
