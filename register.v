module register(input mode,load,rst,clk,input [3:0] d,output reg q);
reg [3:0] i;
always@(posedge clk,posedge rst)
begin
if(rst)
begin
i<=4'd0;
q<=0;
end
else if(load)
i<=d;
else if(mode)
begin
i<=1<<i;
q<=i[3];
end
else
begin
i<=1>>i;
q<=i[0];
end
end
endmodule
