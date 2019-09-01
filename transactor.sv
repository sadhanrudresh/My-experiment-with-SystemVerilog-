class transactor;
rand bit mode;
rand bit load;
rand logic [3:0] d;
logic rst;
constraint l1{d inside {[0:15]};}
endclass
