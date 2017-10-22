module datapath(clk, readnum, vsel, loada, loadb, shift, asel, bsel,
		ALUop, loadc, loads, writenum, write, mdata, 
		status, C, mdata, sximm8, PC, sximm5);

  input clk, loada, loadb, loadc, loads, asel, bsel, write;
  input [1:0] vsel;
  input [1:0] shift, ALUop; 
  input [2:0] writenum, readnum;  
  input [15:0] mdata, sximm8, sximm5;
  input [7:0] PC;
  output [2:0] status;
  output [15:0] C;
  wire [15:0] muxa, muxb, aout, bout, bout_shift, data_in, data_out, ALUout;
  wire [2:0] status_out;
  wire [3:0] vsel_in;
  
  //2 - 4 binary to one hot decoder
  dec #(2,4) vselect(vsel, vsel_in);
  //4 select mux for input to register file 
  mux4 #(16) data_in_reg(mdata, sximm8, {8'b0,PC}, C, vsel_in, data_in);

  //The 8 Register File which will determine whether or not to 
  //write or read to a register, will only return out data_out when 
  //reading a register 
  regfile RegisterFile( .clk(clk), 
           		.write(write),
			.writenum(writenum),
			.readnum(readnum),
			.data_in(data_in),
			.data_out(data_out)
  );
  
  //Pipeline Registers A, B, C and Status
  vDFFE #(16) reg_a(clk, loada, data_out, aout);
  vDFFE #(16) reg_b(clk, loadb, data_out, bout); 
  vDFFE #(16) reg_c(clk, loadc, ALUout, C);
  vDFFE #(3) status_block(clk, loads, statusout, status);

  //Shifter for Reg_B
  shifter shift_b(shift, bout, bout_shift);

  //Source operand MUX (A and B)  
  assign muxa = asel ? 16'b0:aout;
  assign muxb = bsel ? sximm5:bout_shift;

  //ALU block, which will add muxa + muxb, subtract muxa -muxb, 
  //bitwise AND muxa&muxb, or NOT ~muxb and return that 16'b value for reg_c as 
  //well as a 1'b value for status block (1 if ALUout = 16'b0, 0 otherwise)
  alu ALU_block( ALUop, muxa, muxb, ALUout, statusout);

endmodule 

//4 Register Multiplexer Implementation 
module mux4(r3, r2, r1, r0, s, b);
  parameter k = 1;
  input [k-1:0] r3, r2, r1, r0;
  input [3:0] s;
  output [k-1:0] b;

  wire [k-1:0] b = ({k{s[0]}} & r0) |
		   ({k{s[1]}} & r1) |    
		   ({k{s[2]}} & r2) |
		   ({k{s[3]}} & r3) ;
endmodule 