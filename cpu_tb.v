module cpu_tb();
  reg clk, reset, s, load;
  reg [15:0] in;
  wire [15:0] out;
  wire N,V,Z,w; 

  cpu dut( .clk(clk),
	   .reset(reset),
	   .s(s),
	   .load(load),
	   .in(in),
	   .out(out),
	   .N(N),
	   .V(V),
	   .Z(Z),
	   .w(w)
  );

  initial begin
    clk = 0; #5;
    forever begin
      clk = 1; #5;
      clk = 0; #5;
    end
  end

  initial begin
  //ADD CPU tb cases here (convincing test cases with at least 3 of each equation in TB1
  end 
endmodule 
