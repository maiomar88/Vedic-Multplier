module Vedic8x8_Top(
input         [7:0] A_3,
input         [7:0] B_3,
output        [15:0] Q

);

//internal signals(4output wires 2x2mul)

wire  [7:0]      WM1;
wire  [7:0]      WM2;
wire  [7:0]      WM3;
wire  [7:0]      WM4;


Vedic4x4_Top M1                  (.A_2(A_3[3:0]),.B_2(B_3[3:0]),.Q(WM1));

Vedic4x4_Top M2                  (.A_2(A_3[7:4]),.B_2(B_3[3:0]),.Q(WM2));

Vedic4x4_Top M3                  (.A_2(A_3[3:0]),.B_2(B_3[7:4]),.Q(WM3));

Vedic4x4_Top M4                  (.A_2(A_3[7:4]),.B_2(B_3[7:4]),.Q(WM4));

vedic_adder #(.MUL_Size(8))  VA     (.q0(WM1),.q1(WM2),.q2(WM3),.q3(WM4),.Q(Q));

endmodule