`include "driver.sv"
program test(inter.tb t1);
driver drv;
initial begin 
t1.rst<=0;
#11 t1.rst<=1;
#12 t1.rst<=0;
end
initial 
begin
drv=new(t1);
repeat(100)@(t1.ad)
begin
drv.drivedata();
end
end
endprogram
