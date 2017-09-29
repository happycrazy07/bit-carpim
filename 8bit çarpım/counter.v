module counter(topla,clk,shift_stop,one_cycle_hold);

		input clk;
		output reg[2:0] topla=3'b000;
      output shift_stop,one_cycle_hold;
		
		reg stop;
			assign one_cycle_hold=(~topla[0]&topla[1]&topla[2]);
		assign shift_stop=stop;
		always@(posedge clk )
		begin
				if((topla[0]==1&topla[1]==1&topla[2]==1))
		begin 
		stop<=1;
		end
		else begin
		topla<=topla+1;
		stop<=0; 
		end
		end
	

endmodule
