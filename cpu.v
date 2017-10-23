module cpu(clk,reset,s,load,in,out,N,V,Z,w);
  input clk, reset, s, load;
  input [15:0] in;
  output [15:0] out;
  output N, V, Z, w;

  wire [15:0] instruction_out;
  wire reset_state, load_w;
  wire [2:0] status;

  wire [1:0] nsel, op, ALUop, shift;
  wire [2:0] opcode, readnum, writenum;  
  wire [15:0] sximm5, sximm8; 

  //Check the reset at every posedge 
  vDFF rst(clk, reset, reset_state);
  assign w = reset_state | s; //w is equal to 1 either when reset is true or if not s is true 

  vDFFE instruct_reg(clk, load, in, instruction_out); //instruction register
   
  assign N = status[2];
  assign V = status[1]; 
  assign Z = status[0];  
endmodule

module instruct_decoder( instruction_out, 
			 nsel, 
			 opcode,
			 op,
			 ALUop, 
			 sximm5, 
			 sximm8, 
			 shift,
			 readnum,
			 writenum );

  input [15:0] instruction_out;
  input [1:0] nsel;
  output reg [2:0] opcode, readnum, writenum;
  output reg [1:0] shift, ALUop, op;
  output [15:0] sximm5, sximm8;
  wire [2:0] Rn, Rd, Rm;
  wire [4:0] imm5;
  wire [7:0] imm8;

  setval retval(instruction_out,opcode,op,ALUop,imm5,imm8,shift,Rn,Rd,Rm);
  //signed extended imm5 and imm8
  assign sximm5 = imm5 ? {11'b1,imm5}:{11'b0,imm5}; 
  assign sximm8 = imm8 ? {8'b1,imm8}:{11'b0,imm8};
  always @(*) 
    case(nsel)
      2'b00: {readnum,writenum} = {Rn,Rn}; //set the register to Rn if nsel = 0
      2'b01: {readnum,writenum} = {Rd,Rd}; //set register to Rd if nsel = 1
      2'b10: {readnum,writenum} = {Rm,Rm}; //set register to Rm if nsel = 2
      default: {readnum,writenum} = 6'bx; //set the registers to x 
    endcase
endmodule

module setval(instruction_out,opcode,op,ALUop,imm5,imm8,shift,Rn,Rd,Rm);
  input [15:0] instruction_out;
  output reg [2:0] opcode,Rn,Rd,Rm;
  output reg [1:0] op, ALUop, shift;
  output reg [4:0] imm5;
  output reg [7:0] imm8;

  always @(*) begin 
    casex(instruction_out)
	{5'b11010,11'bx}: {opcode,op,Rn,imm8} = {instruction_out[15:13],2'b10,instruction_out[10:8],instruction_out[7:0]};//Move value to register (MOV Rn, #<im8>)
	{8'b11000000,8'bx}: {opcode,op,Rn,Rd,shift,Rm} = {instruction_out[15:13],2'b0,3'b0,instruction_out[7:5],
						instruction_out[4:3],instruction_out[2:0]};//Shift a known value and store in a new register (Rn =sh_Rm)
	{5'b10100,11'bx}: {opcode,ALUop,Rn,Rd,shift,Rm} = {instruction_out[15:13],2'b0,instruction_out[10:8],
						instruction_out[7:5],instruction_out[4:3],instruction_out[2:0]};//Add (ADD Rd = Rn + Rm)
	{5'b10101,11'bx}: {opcode,ALUop,Rn,Rd,shift,Rm} = {instruction_out[15:13],2'b01,instruction_out[10:8],
						3'b0, instruction_out[4:3], instruction_out[2:0]};//Subtract (CMP status = Rn - Rm)
 	{5'b10110,11'bx}: {opcode,ALUop,Rn,Rd,shift,Rm} = {instruction_out[15:13],2'b10,instruction_out[10:8],
						instruction_out[7:5],instruction_out[4:3],instruction_out[2:0]};//And (AND Rd = Rn & Rm)
	{5'b10111,11'bx}: {opcode,ALUop,Rn,Rd,shift,Rm} = {instruction_out[15:13],2'b11,3'b0,
						instruction_out[7:5],instruction_out[4:3],instruction_out[2:0]};//Not (MVN Rd = ~Rm)
	default: {opcode,op,ALUop,Rn,imm8,imm5,Rd,shift,Rm} = {3'bx,2'bx,2'bx,3'bx,8'bx,5'bx,3'bx,2'bx,3'bx}; //for now any other operation will set all vars to x 
    endcase
end
endmodule
