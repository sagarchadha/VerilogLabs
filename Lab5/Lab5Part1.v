`timescale 1ns / 1ns //`timescale time_unit/time_precision

module Lab5Part1(
	input [1:0]SW,
	input [3:0]KEY,			//KEY[0] = clock;
	output [6:0]HEX0,
	output [6:0]HEX1
	); 
	
	wire [7:0]w1;
	BitCounter u1(.enable(SW[1]), .reset(SW[0]), .clock(KEY[0]), .Q(w1));
	
	segmentDisplay u2(.SW(w1[3:0]), .HEX0(HEX0[6:0]));
	segmentDisplay u3(.SW(w1[7:4]), .HEX0(HEX1[6:0]));
endmodule

module BitCounter(input enable, clock, reset, output [7:0]Q);
	wire w1, w2, w3, w4, w5, w6, w7;
	
	assign w1 = Q[0] & enable;
	assign w2 = Q[1] & w1;
	assign w3 = Q[2] & w2;
	assign w4 = Q[3] & w3;
	assign w5 = Q[4] & w4;
	assign w6 = Q[5] & w5;
	assign w7 = Q[6] & w6;
	
	tFlip t1(.enable(enable), .clock(clock), .reset(reset), .Q(Q[0]));
	tFlip t2(.enable(w1), .clock(clock), .reset(reset), .Q(Q[1]));
	tFlip t3(.enable(w2), .clock(clock), .reset(reset), .Q(Q[2]));
	tFlip t4(.enable(w3), .clock(clock), .reset(reset), .Q(Q[3]));
	tFlip t5(.enable(w4), .clock(clock), .reset(reset), .Q(Q[4]));
	tFlip t6(.enable(w5), .clock(clock), .reset(reset), .Q(Q[5]));
	tFlip t7(.enable(w6), .clock(clock), .reset(reset), .Q(Q[6]));
	tFlip t8(.enable(w7), .clock(clock), .reset(reset), .Q(Q[7]));
	
endmodule
	
module tFlip(input enable, clock, reset, output Q);
	wire w1;
	assign w1 = enable ^ Q;
	reg r1;
	
	always @(negedge clock)
		if (!reset)
			r1 <= 0;
		else r1 <= w1;
	
	assign Q = r1;
	
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
