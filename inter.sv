interface inter(input bit clk);
logic mode,load,rst;
logic [3:0] d;
logic q;
clocking ad@(posedge clk);
default input #3ns output #2ns;
output mode,load,d;
input q;
endclocking:ad
modport tb(clocking ad,output rst);

sequence dee;
(d==4'd1);
endsequence

sequence mod;
(mode==1);
endsequence

sequence lode;
(load==1);
endsequence

sequence res;
$rose(rst);
endsequence

sequence rese;
(q==0);
endsequence



property p1;
@(posedge clk)res|->rese;
endproperty

property p2;
@(posedge clk)lode|->dee|->mod|=>(q==1);
endproperty

prp1:assert property(p1) $display("reset successful");

prp2:assert property(p2) $display("right shift successful");
else $display("right shift not successful");
endinterface
