module Vedic(
input                clk,
input                rst,
input         [31:0] A_5,
input         [31:0] B_5,
output  reg [63:0] Q_REG

);

//regestering  outputs

wire [63:0]  Q;
reg  [31:0] A_5_reg;
reg  [31:0] B_5_reg;


always@(posedge clk or negedge rst)
begin
      if(~rst)
	  begin
        Q_REG   <=0;
		A_5_reg <=0;
		B_5_reg <=0;
  end
		else
begin
		  Q_REG <=Q;
		A_5_reg <=A_5;
		B_5_reg <=B_5;
		
		end
end
//internal signals(4output wires 2x2mul)

wire  [31:0]      WM1;
wire  [31:0]      WM2;
wire  [31:0]      WM3;
wire  [31:0]      WM4;


Vedic16x16_Top M1                  (.A_4(A_5_reg[15:0]),.B_4(B_5_reg[15:0]),.Q(WM1));

Vedic16x16_Top M2                  (.A_4(A_5_reg[31:16]),.B_4(B_5_reg[15:0]),.Q(WM2));

Vedic16x16_Top M3                  (.A_4(A_5_reg[15:0]),.B_4(B_5_reg[31:16]),.Q(WM3));

Vedic16x16_Top M4                  (.A_4(A_5_reg[31:16]),.B_4(B_5_reg[31:16]),.Q(WM4));

vedic_adder #(.MUL_Size(32))  VA     (.q0(WM1),.q1(WM2),.q2(WM3),.q3(WM4),.Q(Q));

endmodule