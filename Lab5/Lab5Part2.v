`timescale 1ns / 1ns //`timescale time_unit/time_precision

module Lab5Part2(
	input [2:0]SW,
	input CLOCK_50,			//KEY[0] = clock;
	output [6:0]HEX0
	); 
	
	reg [26:0]max;
	
	always @(*)
		begin
			case (SW[1:0])
				2'b00: max = 26'b00000000000000000000000001;
				2'b01: max = 26'b00101111101011110000100000;
				2'b10: max = 26'b01011111010111100001000000;
				2'b11: max = 26'b10111110101111000010000000;
			endcase
		end
	
	wire [25:0]w1;
	wire [3:0]w2;
	wire enable;
	wire [25:0]rateDivider;
	
	BitCounter u1(.clock(CLOCK_50), .max(max[25:0]), .reset(SW[2]), .enable(1'b1), .newNum(rateDivider));
	assign enable = (rateDivider == max) ? 1 : 0;
	assign w2[3:0] = w1[3:0];
	BitCounter u2(.clock(CLOCK_50), .max(26'b00000000000000000000010000), .reset(SW[2]), .enable(enable), .newNum(w1[25:0]));
	
	segmentDisplay u3(.SW(w1[3:0]), .HEX0(HEX0[6:0]));
endmodule

module BitCounter(
	input clock, 
	input [25:0]max, 
	input reset, 
	input enable, 
	output [25:0]newNum);  
	reg [25:0]q; 					// declare q
	always @(posedge clock) 	// triggered every time clock rises
		begin
			if (reset == 1'b0) // when Clear b is 0	
				q <= 0; // q is set to 0
			else if (q == max) // when q is the maximum value for the counter
				q <= 0; // q reset to 0
			else if (enable == 1)// increment q only when Enable is 1
				q <= q + 1; // increment q
		end
	assign newNum = q;
endmodule

module segmentDisplay (SW, HEX0);
	input[3:0]SW;
	output [6:0]HEX0;

	assign HEX0 [0] = ~( (~SW[2]&~SW[0]) | (~SW[3]&SW[1]) | (SW[2]&SW[1]) | (SW[3]&~SW[0]) | (SW[3]&~SW[1]&~SW[2]) | (SW[2]&SW[0]&~SW[3]));
	assign HEX0 [1] = ~( (~SW[3]&~SW[1]&~SW[0]) | (~SW[2]&~SW[1]) | (~SW[3]&SW[1]&SW[0]) | (SW[3]&~SW[1]&SW[0]) | (~SW[2]&~SW[0]));
	assign HEX0 [2] = ~( (~SW[3]&~SW[1]) | (~SW[3]&SW[2]) | (~SW[3]&SW[0]) | (~SW[1]&SW[0]) | (SW[3]&~SW[2]));
	assign HEX0 [3] = ~( (SW[2]&~SW[1]&SW[0]) | (~SW[3]&~SW[2]&~SW[0]) | (SW[2]&SW[1]&~SW[0]) | (~SW[2]&SW[1]&SW[0]) | (SW[3]&~SW[1]));
	assign HEX0 [4] = ~( (~SW[2]&~SW[0]) | (SW[1]&~SW[0]) | (SW[3]&SW[2]) | (SW[3]&SW[1]) | (SW[3]&~SW[0]));
	assign HEX0 [5] = ~( (~SW[1]&~SW[0]) | (SW[2]&~SW[0]) | (SW[3]&SW[1]) | (SW[3]&~SW[2]) | (~SW[3]&SW[2]&~SW[1]) );
	assign HEX0 [6] = ~( (~SW[2]&SW[1]) | (SW[1]&~SW[0]) | (SW[3]&SW[0]) | (SW[3]&~SW[2]) | (~SW[3]&SW[2]&~SW[1]));	
	
endmodule
