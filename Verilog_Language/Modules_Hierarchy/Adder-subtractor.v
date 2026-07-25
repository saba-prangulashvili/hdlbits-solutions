// https://hdlbits.01xz.net/wiki/Module_addsub

module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);

    wire[31:0] b2;
    assign b2 = b^{32{sub}};
    wire[15:0] sum1, sum2;
    wire cout1, cout2;
    add16 inst1(a[15:0], b2[15:0], sub, sum1, cout1);
    add16 inst2(a[31:16], b2[31:16], cout1, sum2, cout2);
    assign sum = {sum2, sum1};

endmodule
