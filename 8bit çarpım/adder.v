module _16bitadder(in1,in2,carryin,out,carryout,topla);
input [15:0]in1,in2;
input carryin,topla;
output [15:0]out;
output carryout;
wire [15:0]topla_out;
wire out1,out2,out3,carryout1;
assign topla_out[0]=topla&in2[0];
assign topla_out[1]=topla&in2[1];
assign topla_out[2]=topla&in2[2];
assign topla_out[3]=topla&in2[3];
assign topla_out[4]=topla&in2[4];
assign topla_out[5]=topla&in2[5];
assign topla_out[6]=topla&in2[6];
assign topla_out[7]=topla&in2[7];
assign topla_out[8]=topla&in2[8];
assign topla_out[9]=topla&in2[9];
assign topla_out[10]=topla&in2[10];
assign topla_out[11]=topla&in2[11];
assign topla_out[12]=topla&in2[12];
assign topla_out[13]=topla&in2[13];
assign topla_out[14]=topla&in2[14];
assign topla_out[15]=topla&in2[15];

_8bitadder(in1[7:0],topla_out[7:0],carryin,out[7:0],carryout1);
_8bitadder(in1[15:8],topla_out[15:8],carryout1,out[15:8],carryout);
endmodule

module _8bitadder(in1,in2,carryin,out,carryout);
input [7:0]in1,in2;
input carryin;
output [7:0]out;
output carryout;
wire out1,out2,out3,carryout1;
_4bitadder(in1[3:0],in2[3:0],carryin,out[3:0],carryout1);
_4bitadder(in1[7:4],in2[7:4],carryout1,out[7:4],carryout);
endmodule

module _4bitadder(in1,in2,carryin,out,carryout);
input [3:0]in1,in2;
input carryin;
output [3:0]out;
output carryout;
wire out1,out2,out3,carryout1;
_2bitadder(in1[1:0],in2[1:0],carryin,out[1:0],carryout1);
_2bitadder(in1[3:2],in2[3:2],carryout1,out[3:2],carryout);
endmodule

module _2bitadder(in1,in2,carryin,out,carryout);
input [1:0]in1,in2;
input carryin;
output [1:0]out;
output carryout;
wire out1,out2,out3,carryout1;
fulladder(in1[0],in2[0],carryin,out[0],carryout1);
fulladder(in1[1],in2[1],carryout1,out[1],carryout);
endmodule

module fulladder(in1,in2,carryin,out,carryout);
input in1,in2,carryin;
output out,carryout;
wire wire1,wire2,wire3;
assign wire1=in1^in2;
assign wire2=in1&in2;
assign wire3=wire1&carryin;
assign carryout=wire3|wire2;
assign out=wire1^carryin;

endmodule