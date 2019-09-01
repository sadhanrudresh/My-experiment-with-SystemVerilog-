module top;
bit clk;
initial clk=0;
always #5 clk=~clk;
inter o1(clk);
test test12(o1);
register dut(.mode(o1.mode),.load(o1.load),.rst(o1.rst),.clk(clk),.d(o1.d),.q(o1.q));
initial 
begin
$dumpfile("finale.vcd");
$dumpvars;
$monitor("d=%d,load=%d,mode=%d,internal=%d,out=%d",o1.d,o1.load,o1.mode,dut.i,o1.q,);
end
endmodule
