`timescale 1ns / 1ns //`timescale time_unit/time_precision

module Lab5Part3(
	input [2:0]SW,
	input [1:0]KEY,
	input CLOCK_50,
	output [1:0]LEDR
	); 
	
	reg [13:0]pattern;
	wire [13:0]display;
	
	always @(*)
		begin
			case (SW[2:0])
				3'b000: pattern = 14'b10101000000000; 	//s
				3'b001: pattern = 14'b11100000000000;	//t
				3'b010: pattern = 14'b10101110000000;	//u
				3'b011: pattern = 14'b10101011100000;	//v
				3'b100: pattern = 14'b10111011100000;	//w
				3'b101: pattern = 14'b11101010111000;	//x
				3'b110: pattern = 14'b11101011101110;	//y
				3'b111: pattern = 14'b11101110101000;	//z
			endcase
		end
	
	wire enable;
	wire [24:0]rateDivider;
	wire [24:0]max = 25'b1011111010111100001000000; //25'b0000000000000000000000010; 
	
	BitCounter b1(.clock(CLOCK_50), .max(max[24:0]), .reset(KEY[0]), .enable(1'b1), .newNum(rateDivider));
	assign enable = (rateDivider == max) ? 1 : 0;

	SubCircuit s1(.pData(pattern[0]), .shiftData(1'b0), .pLoad(KEY[1]), 
		.clock(CLOCK_50), .enable(enable), .reset(KEY[0]), .newData(display[0]));
	SubCircuit s2(.pData(pattern[1]), .shiftData(display[0]), .pLoad(KEY[1]), 
		.clock(CLOCK_50), .enable(enable), .reset(KEY[0]), .newData(display[1]));
	SubCircuit s3(.pData(pattern[2]), .shiftData(display[1]), .pLoad(KEY[1]), 
		.clock(CLOCK_50), .enable(enable), .reset(KEY[0]), .newData(display[2]));
	SubCircuit s4(.pData(pattern[3]), .shiftData(display[2]), .pLoad(KEY[1]), 
		.clock(CLOCK_50), .enable(enable), .reset(KEY[0]), .newData(display[3]));
	SubCircuit s5(.pData(pattern[4]), .shiftData(display[3]), .pLoad(KEY[1]), 
		.clock(CLOCK_50), .enable(enable), .reset(KEY[0]), .newData(display[4]));
	SubCircuit s6(.pData(pattern[5]), .shiftData(display[4]), .pLoad(KEY[1]), 
		.clock(CLOCK_50), .enable(enable), .reset(KEY[0]), .newData(display[5]));
	SubCircuit s7(.pData(pattern[6]), .shiftData(display[5]), .pLoad(KEY[1]), 
		.clock(CLOCK_50), .enable(enable), .reset(KEY[0]), .newData(display[6]));
	SubCircuit s8(.pData(pattern[7]), .shiftData(display[6]), .pLoad(KEY[1]), 
		.clock(CLOCK_50), .enable(enable), .reset(KEY[0]), .newData(display[7]));
	SubCircuit s9(.pData(pattern[8]), .shiftData(display[7]), .pLoad(KEY[1]), 
		.clock(CLOCK_50), .enable(enable), .reset(KEY[0]), .newData(display[8]));
	SubCircuit s10(.pData(pattern[9]), .shiftData(display[8]), .pLoad(KEY[1]), 
		.clock(CLOCK_50), .enable(enable), .reset(KEY[0]), .newData(display[9]));
	SubCircuit s11(.pData(pattern[10]), .shiftData(display[9]), .pLoad(KEY[1]), 
		.clock(CLOCK_50), .enable(enable), .reset(KEY[0]), .newData(display[10]));
	SubCircuit s12(.pData(pattern[11]), .shiftData(display[10]), .pLoad(KEY[1]), 
		.clock(CLOCK_50), .enable(enable), .reset(KEY[0]), .newData(display[11]));
	SubCircuit s13(.pData(pattern[12]), .shiftData(display[11]), .pLoad(KEY[1]), 
		.clock(CLOCK_50), .enable(enable), .reset(KEY[0]), .newData(display[12]));
	SubCircuit s14(.pData(pattern[13]), .shiftData(display[12]), .pLoad(KEY[1]), 
		.clock(CLOCK_50), .enable(enable), .reset(KEY[0]), .newData(display[13]));
	assign LEDR[0] = display[13];
endmodule

module SubCircuit(
	input pData,
	input shiftData, pLoad,
	input clock,
	input reset,
	input enable,
	output newData);
	
	wire registerInput;
	
	assign registerInput = pLoad ? pData : shiftData;
	Register r1(.D(registerInput), .pLoad(pLoad), .clock(clock), .enable(enable), .reset(reset), .Q(newData));
	
endmodule

module Register (
	input D,
	input clock,
	input enable,
	input pLoad,
	input reset,
	output Q);
	
	reg registerOut;

	always @(negedge clock)
	begin
		if (reset == 1'b0)
			registerOut <= 1'b0;
		else if (enable == 1'b1 && pLoad == 0)
			registerOut <= D;
		else if (pLoad == 1)
			registerOut <= D;
	end
	
	assign Q = registerOut; 

endmodule

module BitCounter(
	input clock, 
	input [24:0]max, 
	input reset, 
	input enable,
	output [24:0]newNum);  
	reg [24:0]q; 					// declare q
	always @(negedge clock) 	// triggered every time clock rises
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
