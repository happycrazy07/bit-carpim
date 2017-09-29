
module _16bitshift(clk,data_out,control_initial,information,first_bit,shift_stop);
input clk,control_initial,first_bit;
input [7:0]information;
output [15:0]data_out;
input shift_stop;

_8bitshift(clk,data_out[7:0],control_initial,information[7:0],first_bit,shift_stop);
_8bitshift(clk,data_out[15:8],control_initial,,data_out[7],shift_stop);
endmodule

module _8bitshift(clk,data_out,control_initial,information,first_bit,shift_stop);
input clk,control_initial,first_bit,shift_stop;
input [7:0]information;
output [7:0]data_out;

wire [7:0]d_in;
wire [7:0]d_in2;
wire clk_shift;

assign clk_shift=clk&~shift_stop;
assign d_in2[0]=control_initial&information[0];
assign d_in2[1]=control_initial&information[1];
assign d_in2[2]=control_initial&information[2];
assign d_in2[3]=control_initial&information[3];
assign d_in2[4]=control_initial&information[4];
assign d_in2[5]=control_initial&information[5];
assign d_in2[6]=control_initial&information[6];
assign d_in2[7]=control_initial&information[7];

assign d_in[0]=(!control_initial&first_bit)|d_in2[0];
assign d_in[1]=(!control_initial&data_out[0])|d_in2[1];
assign d_in[2]=(!control_initial&data_out[1])|d_in2[2];
assign d_in[3]=(!control_initial&data_out[2])|d_in2[3];
assign d_in[4]=(!control_initial&data_out[3])|d_in2[4];
assign d_in[5]=(!control_initial&data_out[4])|d_in2[5];
assign d_in[6]=(!control_initial&data_out[5])|d_in2[6];
assign d_in[7]=(!control_initial&data_out[6])|d_in2[7];


flip dff0(d_in[0],data_out[0],clk_shift);
flip dff1(d_in[1],data_out[1],clk_shift);
flip dff2(d_in[2],data_out[2],clk_shift);
flip dff3(d_in[3],data_out[3],clk_shift);
flip dff4(d_in[4],data_out[4],clk_shift);
flip dff5(d_in[5],data_out[5],clk_shift);
flip dff6(d_in[6],data_out[6],clk_shift);
flip dff7(d_in[7],data_out[7],clk_shift);
endmodule
