module cpu(clk,reset,s,load,in,out,N,V,Z,w);
input clk, reset, s, load;
input [15:0] in;
output [15:0] out;
output N, V, Z, w;
wire {15:0] instruction_out;
wire reset_state, load_w;
wire [2:0] status;

//Check the reset at every posedge 
vDFF rst(clk, reset, reset_state);
assign w = reset_state | s; //w is equal to 1 either when reset is true or if not s is true 
assign load_w = load ^ ;

vDFFE compute(clk, load, in, instruction_out); //instruction register

assign N = status[2];
assign V = status[1]; 
assign Z = status[0];  
endmodule

module instruct_decoder( instruction_out, 
			 vsel, 
			 opcode,
			 op,
			 ALUop, 
			 sximm5, 
			 sximm8, 
			 shift,
			 readnum,
			 writenum );

input [15:0] instruction_out;
input [1:0] vsel;
output [2:0] opcode, readnum, writenum;
output [1:0] shift, ALUop;
output [15:0] sximm5, sximm8;
wire [2:0] Rn, Rd, Rm;
wire [4:0] imm5;
wire [7:0] imm8;
endmodule
