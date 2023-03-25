module Vedic4x4_Top(
input         [3:0] A_2,
input         [3:0] B_2,
output        [7:0] Q

);

//internal signals(4output wires 2x2mul)

wire  [3:0]      WM1;
wire  [3:0]      WM2;
wire  [3:0]      WM3;
wire  [3:0]      WM4;


Vedic_2bit_Mul M1                  (.A(A_2[1:0]),.B(B_2[1:0]),.Res(WM1));

Vedic_2bit_Mul M2                  (.A(A_2[3:2]),.B(B_2[1:0]),.Res(WM2));

Vedic_2bit_Mul M3                  (.A(A_2[1:0]),.B(B_2[3:2]),.Res(WM3));

Vedic_2bit_Mul M4                  (.A(A_2[3:2]),.B(B_2[3:2]),.Res(WM4));

vedic_adder #(.MUL_Size(4))  VA     (.q0(WM1),.q1(WM2),.q2(WM3),.q3(WM4),.Q(Q));

endmodule