`timescale 1ns / 1ns //`timescale time_unit/time_precision

module Lab4Part3(
	input [9:0]SW, 	//SW[3:0] = data, SW[9] = Reset
	input [3:0]KEY,	//KEY[0] = clock, KEY[1] = Parallel Load, KEY[2] = Rotate to Right, KEY[3] = Left Shift
	output [9:0]LEDR);	//Top Level Circuit output
	
	TopCircuit u1(.data(SW[7:0]), .parallelLoad(KEY[1]), 
		.rotateRight(KEY[2]), .rightShift(KEY[3]), .reset(SW[9]), 
		.clock(KEY[0]), .newData(LEDR[7:0]));  
	
endmodule

module TopCircuit(
	input [7:0]data,
	input parallelLoad,
	input rotateRight,
	input rightShift,
	input reset,
	input clock,
	output [7:0]newData);
	
	wire rightData;

	assign rightData = rightShift ? 1'b0 : newData[0];
	
	SubCircuit u1(.rotateRight(rotateRight), .pData(data[7]), 
		.rightData(rightData), .leftData(newData[6]), 
		.pLoad(parallelLoad), .clock(clock), .reset(reset), 
		.newData(newData[7]));
	SubCircuit u2(.rotateRight(rotateRight), .pData(data[6]), 
		.rightData(newData[7]), .leftData(newData[5]), 
		.pLoad(parallelLoad), .clock(clock), .reset(reset), 
		.newData(newData[6]));
	SubCircuit u3(.rotateRight(rotateRight), .pData(data[5]), 
		.rightData(newData[6]), .leftData(newData[4]), 
		.pLoad(parallelLoad), .clock(clock), .reset(reset), 
		.newData(newData[5]));
	SubCircuit u4(.rotateRight(rotateRight), .pData(data[4]), 
		.rightData(newData[5]), .leftData(newData[3]), 
		.pLoad(parallelLoad), .clock(clock), .reset(reset), 
		.newData(newData[4]));
	SubCircuit u5(.rotateRight(rotateRight), .pData(data[3]), 
		.rightData(newData[4]), .leftData(newData[2]), 
		.pLoad(parallelLoad), .clock(clock), .reset(reset), 
		.newData(newData[3]));
	SubCircuit u6(.rotateRight(rotateRight), .pData(data[2]), 
		.rightData(newData[3]), .leftData(newData[1]), 
		.pLoad(parallelLoad), .clock(clock), .reset(reset), 
		.newData(newData[2]));
	SubCircuit u7(.rotateRight(rotateRight), .pData(data[1]), 
		.rightData(newData[2]), .leftData(newData[0]), 
		.pLoad(parallelLoad), .clock(clock), .reset(reset), 
		.newData(newData[1]));
	SubCircuit u8(.rotateRight(rotateRight), .pData(data[0]), 
		.rightData(newData[1]), .leftData(newData[7]), 
		.pLoad(parallelLoad), .clock(clock), .reset(reset), 
		.newData(newData[0]));
endmodule
		
module SubCircuit(
	input rotateRight,
	input pData,
	input leftData,
	input rightData, pLoad,
	input clock,
	input reset,
	output newData);
	
	wire registerInput;
	wire mux1Output;
	
	mux2to1 u1(.x(leftData), .y(rightData), .s(rotateRight), .m(mux1Output));
	mux2to1 u2(.x(pData), .y(mux1Output), .s(pLoad), .m(registerInput));
	Register u3(.D(registerInput), .Clock(clock), .Reset(reset), .Q(newData));
	
endmodule	

module Register (
	input D,
	input Clock,
	input Reset,
	input pData,
	output Q);
	
	reg registerOut;
	
	always @(posedge Clock)
	begin
		if (Reset == 1'b1)
			registerOut <= 1'b0;
		else
			registerOut <= D;
	end
	
	assign Q = registerOut; 

endmodule

module mux2to1(
	input x, y, s,
	output m);
	
	assign m = s ? y : x;
endmodule
