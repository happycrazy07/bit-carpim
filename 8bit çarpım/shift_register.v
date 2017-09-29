module shiftregister(data1,data2,clk,register_out,counter_out,clk2,topla,control_initial);
input [7:0]data1,data2;
input clk,clk2;
output [6:0]counter_out;
input control_initial;
wire [15:0]shift_out;
output [15:0]register_out;
wire [15:0]register_input;
output topla;
wire shift_stop,one_cycle_hold;
wire PWM1,PWM2;
wire PWM,counter_clk,wire_one_clk;
wire counter_start,shift_start;
PWM_deneme(clk,PWM1);
PWM_deneme(PWM1,PWM);
flip(control_initial,counter_start,PWM);


assign counter_clk=PWM&counter_start;
counter(counter_out,counter_clk,shift_stop,one_cycle_hold); //counter(topla,clk,shift_stop,one_cycle_hold);
assign counter_out[6]=control_initial;
mux8(data2 , counter_out[0], counter_out[1] ,counter_out[2],topla);//module mux8 (in , s0, s1 ,s2,out);

//_16bitshift(PWM&!one_cycle_hold ,shift_out,control_initial,data1,0,shift_stop);
flip(one_cycle_hold,wire_one_clk,PWM);

_16bitshift(PWM&!wire_one_clk,shift_out,!control_initial,data1,0,shift_stop);
assign counter_out[5]=!one_cycle_hold;
productregister(register_out,register_input,PWM&~shift_stop); //productregister(dataout,datastore,clk);
_16bitadder(register_out,shift_out,,register_input,,topla&control_initial);

endmodule
//********************************PWM**********************************************************

module PWM_deneme(clockin,PWM);
input clockin;
output PWM;

wire [0:14]q;
_dff(q[0],~q[0],clockin);
_dff(q[1],~q[1],q[0]);
_dff(q[2],~q[2],q[1]);
_dff(q[3],~q[3],q[2]);
_dff(q[4],~q[4],q[3]);
_dff(q[5],~q[5],q[4]);
_dff(q[6],~q[6],q[5]);
_dff(q[7],~q[7],q[6]);
_dff(q[8],~q[8],q[7]);
_dff(q[9],~q[9],q[8]);
_dff(q[10],~q[10],q[9]);
_dff(q[11],~q[11],q[10]);
_dff(q[12],~q[12],q[11]);
_dff(q[13],~q[13],q[12]);

assign PWM=q[12];

endmodule
module  _dff(q,d,clk);

	output reg q;
	input   d,clk;
	
	always @ (posedge clk)
	begin
		q<=d;
	end
endmodule

//*****************************************************************************************
//********************************ADDER********************************************************

//**************************   ADDER  END  *******************************************************
module productregister(dataout,datastore,clk);

	output reg [15:0]dataout;
	input [15:0]datastore;
	input clk;
		
	always @(posedge clk)
	begin
		dataout<=datastore;
	end
endmodule 






/*
module flip(d,q,clk);
input d,clk;
output q;
 wire w1,w2,w3,w4;
 
assign w1=!(clk&d);
assign w2=!(clk&!d);

assign q= ~(w4&w1);
assign w4= ~(q&w2);

endmodule

*/

module flip(D,out,clk);
input clk;
output out;
reg Q;
input D;
always@(posedge clk)
begin
Q<=D;
end 
assign out =Q;
endmodule


