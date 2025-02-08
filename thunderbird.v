module thunderbird(
    input Clk,
    input reset,
    input left,
    input right,
    output reg [2:0] L,
    output reg [2:0] R
);
    localparam Off= 3'b000,
               L1 = 3'b001,
               L2 = 3'b010,
               L3 = 3'b011,
               R1 = 3'b100,
               R2 = 3'b101,
               R3 = 3'b110,
               LR = 3'b111;
					
	//set initial state as off, first        
    reg [2:0] state_p = 3'b000; 
    reg [2:0] state_n;
    wire in_sequence;

//state register using a modified d flip-flop with reset
  always @(posedge Clk or posedge reset) begin 
   if(reset)
   state_p <= Off; 
   else 
   state_p <= state_n;  
end

//next state logic 
always @(*) begin
   case(state_p)
	
	Off: if(left && right) state_n = LR;
			else if (right) state_n = R1;
			else if (left)  state_n = L1;
			else state_n = Off;
		  
	LR: state_n = Off;
   L1: state_n = L2;
   L2: state_n = L3; 
   L3: state_n = Off;  
	
   R1: state_n = R2; 
   R2: state_n = R3;
   R3: state_n = Off; 

   default: state_n = Off;

endcase
end

//output logic 	
always @(*) begin 
   case(state_p)
   L1: {L, R} = 6'b100000; 
   L2: {L, R} = 6'b110000; 
   L3: {L, R} = 6'b111000; 
   R1: {L, R} = 6'b000100;
   R2: {L, R} = 6'b000110;
   R3: {L, R} = 6'b000111;
	LR: {L, R} = 6'b111111; //all on 
   Off:{L, R} = 6'b000000; //off
   endcase
end 

endmodule