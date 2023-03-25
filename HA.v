module HA(
input IN1,
input IN2,
output cout,
output sum    
               );


assign sum = IN1^IN2;
assign cout= IN1&IN2;

endmodule
