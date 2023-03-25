module Vedic16x16_Top(

input         [15:0] A_4,
input         [15:0] B_4,
output        [31:0] Q

);


//internal signals(4output wires 2x2mul)

wire  [15:0]      WM1;
wire  [15:0]      WM2;
wire  [15:0]      WM3;
wire  [15:0]      WM4;


Vedic8x8_Top M1                  (.A_3(A_4[7:0]),.B_3(B_4[7:0]),.Q(WM1));

Vedic8x8_Top M2                  (.A_3(A_4[15:8]),.B_3(B_4[7:0]),.Q(WM2));

Vedic8x8_Top M3                  (.A_3(A_4[7:0]),.B_3(B_4[15:8]),.Q(WM3));

Vedic8x8_Top M4                  (.A_3(A_4[15:8]),.B_3(B_4[15:8]),.Q(WM4));

vedic_adder #(.MUL_Size(16))  VA     (.q0(WM1),.q1(WM2),.q2(WM3),.q3(WM4),.Q(Q));

endmodule