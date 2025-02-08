module thunderbird_wrapper(
	 input Clk,
    input reset,
    input left,
    input right,
    output [2:0] L,
    output [2:0] R
);

//instantiate clk_div
clk_div clk(
.clk(Clk), 
.rst(reset),
.clk_en(clk_en)); 

//instantiate thunderbird fsm
 thunderbird uut(
        .Clk(clk_en),
        .reset(reset),
        .left(left),
        .right(right),
        .L(L),
        .R(R)
    );
	 
endmodule	