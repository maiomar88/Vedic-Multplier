module N_bit_adder_no_carry (IN1,IN2,S);

	parameter N = 4;
	input [N-1:0] IN1,IN2;
	output [N-1:0] S;

	assign S = IN1 + IN2;

endmodule