// https://hdlbits.01xz.net/wiki/Module_cseladd

module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire[15:0] sum1, sum2, sum3, sum4;
    wire cout1, cout2, cout3;
    add16 inst1(a[15:0], b[15:0], 0, sum1, cout1);
    add16 inst2(a[31:16], b[31:16], 0, sum2, cout2);
    add16 inst3(a[31:16], b[31:16], 1, sum3, cout3);

    assign sum4 = (cout1 == 1) ? sum3 : sum2;
    assign sum = {sum4, sum1};

endmodule
