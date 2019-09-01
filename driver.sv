`include "transactor.sv"
class driver;
transactor tx;
virtual inter.tb i1 ;
covergroup cg;
mode0:coverpoint i1.ad.mode;
load0:coverpoint i1.ad.load;
d0:coverpoint i1.ad.d{bins d1={[0:10]};
                      bins d2={[11:15]};}
out0:coverpoint i1.ad.q;
endgroup:cg

function new(virtual inter.tb i2);
this.i1=i2;
this.cg=new();
endfunction

task drivedata();
//for a new transaction each time
tx=new();
if(tx.randomize())
begin
i1.ad.mode<=tx.mode;
i1.ad.load<=tx.load;
i1.ad.d<=tx.d;

//to see if the groups are covered
cg.sample();
end
else
$display("++++++++++++++++error+++++++++++++++");
endtask
endclass

