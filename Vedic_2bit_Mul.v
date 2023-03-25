module Vedic_2bit_Mul(

input            [1:0]A,
input            [1:0]B,
output           [3:0]Res
                     );

//internal signals                        
wire [2:0] And_out;
wire        c_ha_1;

 /////////////////////////////4AND_Gates////////////////////////////////////
                     
assign Res[0]        = A[0]&B[0];
assign And_out[0]    = A[0]&B[1];
assign And_out[1]    = A[1]&B[0];

 ///////////////////////////////&HA//////////////////////////////////
                               
HA ha_1(.sum(Res[1]),.cout(c_ha_1),.IN1(And_out[0]),.IN2(And_out[1]));

assign And_out[2]    = A[1]&B[1];

///////////////////////////////&HA//////////////////////////////////


HA ha_2(.sum(Res[2]),.cout(Res[3]),.IN1(c_ha_1),.IN2(And_out[2]));


endmodule
