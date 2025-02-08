`include "thunderbird.v"

module thunderbird_tb;
    reg clk;
    reg reset;
    reg left;
    reg right;

    wire [2:0] L;
    wire [2:0] R;
    wire LA, LB, LC; 
    wire RA, RB, RC; 

    // Map the individual bits
    assign {LA, LB, LC} = L;
    assign {RA, RB, RC} = R;

    thunderbird uut (
        .Clk(clk),
        .reset(reset),
        .left(left),
        .right(right),
        .L(L),
        .R(R)
    );

    always begin
        #5 clk = ~clk;  
    end

    initial begin

        $dumpfile("thunderbird_tb.vcd");
        $dumpvars(0, thunderbird_tb);

        // Initialize Inputs
        clk = 0;
        reset = 0;
        left = 0;
        right = 0;

        // Test Left Button Press
        $display("Testing left press...");
        left = 1; right = 0;  
        #50;
        left = 0; right = 0;
        #40;

        // Test Right Button Press
        $display("Testing right press...");
        left = 0; right = 1; 
        #100 

        // Test Both Buttons Pressed Simultaneously
        $display("Testing both left and right press...");
        left = 1; right = 1;  
        #150;

        //Apply reset
        $display("Applying reset...");
        reset = 1; 
        #40
        reset = 0;
        //Simultaneous then release right
        #30;
        left = 1; right = 0;
        #60;

        // End simulation
        $finish;
    end

    initial begin
        $monitor("At time %t, L = %b, R = %b, left = %b, right = %b", 
                 $time, L, R, left, right);
    end
endmodule