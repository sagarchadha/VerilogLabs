`timescale 1ns / 1ns //`timescale time_unit/time_precision

module Lab4Part2(
	input [9:0]SW, 	//SW[3:0] = a, SW[9] = ResetB
	input [3:0]KEY,	//KEY[0] = clock, KEY[3:1] = select inputs
	output [9:0]LEDR,	//Register output
	output [6:0]HEX0,	//Set to data = a
	output [6:0]HEX1,	//Set to 0
	output [6:0]HEX2,	//Set to 0
	output [6:0]HEX3,	//Set to 0
	output [6:0]HEX4,	//Set to least significant of register
	output [6:0]HEX5);//Set to most significant of register
	
	wire [3:0]wireb;
	wire [7:0]aluOut;
	wire [7:0]regInput;
	
	assign wireb = SW[9] ? LEDR[3:0] : 4'b0000;	
	ALU u1(.a(SW[3:0]), .b(wireb[3:0]), .KEY(KEY[3:1]), .regInput(regInput), .LEDR(aluOut[7:0])); 
	
	Register8Bit u2(.D(aluOut[7:0]), .Clock(KEY[0]), .Reset(SW[9]), .Q(LEDR[7:0]));
	
	assign regInput[7:0] = LEDR[7:0];
	segmentDisplay u3(.SW(SW[3:0]), .HEX0(HEX0[6:0]));
	segmentDisplay u4(.SW(LEDR[3:0]), .HEX0(HEX4[6:0]));
	segmentDisplay u5(.SW(LEDR[7:4]), .HEX0(HEX5[6:0]));
	assign HEX1[6:0] = 7'b0000000;
	assign HEX2[6:0] = 7'b0000000;
	assign HEX3[6:0] = 7'b0000000;
	
	
endmodule

module Register8Bit (
	input [7:0]D,
	input Clock,
	input Reset,
	output [7:0]Q);
	
	reg [7:0]registerOut;
	
	always @(posedge Clock)
	begin
		if (Reset == 1'b0)
			registerOut[7:0] <= 8'b00000000;
		else
			registerOut[7:0] <= D[7:0];
	end
	
	assign Q[7:0] = registerOut[7:0]; 

endmodule


module ALU(
	input [3:0]a,
	input [3:0]b,
	input [2:0]KEY,
	input [7:0]regInput,
	output [9:0]LEDR
	);
	
	wire [7:0]ab;
	wire [3:0]count1;
	wire [3:0]count2;
	wire [9:0]case1;
	
	assign ab[7:0] = {b[3:0], a[3:0]};
	assign count1 = a[0] + a[1] + a[2] + a[3];
	assign count2 = b[0] + b[1] + b[2] + b[3];
	
	AdderCircuit u1(.SW(ab[7:0]), .LEDR(case1[9:0])); 

	
	reg [7:0]ALUout;
	
	always @(*) // declare always block
	begin
		case (KEY[2:0])
			3'b000: ALUout[7:0] = {3'b000, case1[4:0]};
			
			3'b001: ALUout = a + b;
 			
			3'b010: ALUout[7:0] = {~(a[3:0] & b[3:0]), ~(a[3:0] | b[3:0]) }; 
			
			3'b011: ALUout[7:0] = |ab[7:0] ? 8'b11000000 : 8'b00000000;

			3'b100:
			begin
			if ( (count1 == 2'b10) && (count2 == 2'b11) ) 
				ALUout[7:0] = 8'b00111111;
			else
				ALUout[7:0] = 8'b00000000;	 
			end

			3'b101: ALUout[7:0] = {b[3:0], ~a[3:0]};
		
			3'b110: ALUout[7:0] = {a[3:0] ^ b[3:0], a[3:0] ~^ b[3:0]};	
			
			3'b111: ALUout[7:0] = regInput[7:0];
 			
			default: ALUout = 8'b00000000;  			
		endcase
	end
	
	assign LEDR[0] = ALUout[0];
	assign LEDR[1] = ALUout[1];
	assign LEDR[2] = ALUout[2];
	assign LEDR[3] = ALUout[3];
	assign LEDR[4] = ALUout[4];
	assign LEDR[5] = ALUout[5];
	assign LEDR[6] = ALUout[6];
	assign LEDR[7] = ALUout[7];
	
endmodule

module AdderCircuit(
	input [9:0]SW, //cin = 0
	output [9:0]LEDR);
	
	wire c1, c2, c3;
	FA u1(.a(SW[4]), .b(SW[0]), .cin(1'b0), .s(LEDR[0]), .cout(c1));
	FA u2(.a(SW[5]), .b(SW[1]), .cin(c1), .s(LEDR[1]), .cout(c2));
	FA u3(.a(SW[6]), .b(SW[2]), .cin(c2), .s(LEDR[2]), .cout(c3));	
	FA u4(.a(SW[7]), .b(SW[3]), .cin(c3), .s(LEDR[3]), .cout(LEDR[4]));

endmodule

module FA(
	input a, b, cin, 
	output s,
	output cout);
	
	assign s = a ^ b ^ cin;
	assign cout = (a&b) | (a&cin) | (b&cin);

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
