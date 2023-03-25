module vedic_adder (q0,q1,q2,q3,Q);

	
	parameter MUL_Size 			=  4; 						// number of bits of each input
	parameter Small_Adder_Size  =  MUL_Size;				// adder that take the output of the middle two multipliers
	parameter Big_Adder_Size 	=  MUL_Size + MUL_Size/2;   // adder that take the output of the left two multipliers
															// and also the adder that take the output of the two previous adders
	parameter Added_Zeros 		=  MUL_Size/2;
	parameter Mul_Output_Size   =  2*MUL_Size;

	input  [MUL_Size-1:0] 		   q0,q1,q2,q3;
	output [Mul_Output_Size-1:0]   Q;

	wire [Small_Adder_Size-1:0]   Small_Adder_Sum;
	wire [Big_Adder_Size-1:0]     Big_Adder_Sum;
	
	N_bit_adder_no_carry #(.N(Small_Adder_Size)) FBA (.IN1({{Added_Zeros{1'b0}},q0[MUL_Size-1:Added_Zeros]}),.IN2(q1),.S(Small_Adder_Sum));
	N_bit_adder_no_carry #(.N(Big_Adder_Size))   SBA_0 (.IN1({{Added_Zeros{1'b0}},q2}),.IN2({q3,{Added_Zeros{1'b0}}}),.S(Big_Adder_Sum));
	N_bit_adder_no_carry #(.N(Big_Adder_Size))   SBA_1 (.IN1({{Added_Zeros{1'b0}},Small_Adder_Sum}),.IN2(Big_Adder_Sum),.S(Q[Mul_Output_Size-1:Added_Zeros]));
	
	assign Q[Added_Zeros-1:0] = q0[Added_Zeros-1:0];

endmodule
