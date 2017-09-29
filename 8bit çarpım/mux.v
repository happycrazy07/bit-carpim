module mux8 (in , s0, s1 ,s2,out);
input [7:0]in;
input s0,s1, s2;
output out;
wire [7:0]w1;


assign w1[0]= (~s0)&(~s1)&(~s2)&in[0];
assign w1[1]= (s0)&(~s1)&(~s2)&in[1];
assign w1[2]= (~s0)&(s1)&(~s2)&in[2];
assign w1[3]= (s0)&(s1)&(~s2)&in[3];
assign w1[4]= (~s0)&(~s1)&(s2)&in[4];
assign w1[5]= (s0)&(~s1)&(s2)&in[5];
assign w1[6]= (~s0)&(s1)&(s2)&in[6];
assign w1[7]= (s0)&(s1)&(s2)&in[7];

assign out=w1[0]| w1[1]| w1[2]| w1[3]| w1[4]| w1[5]| w1[6]| w1[7];

endmodule 