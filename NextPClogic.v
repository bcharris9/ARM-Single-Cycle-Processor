module NextPClogic(NextPC, CurrentPC, SignExtImm64, Branch, ALUZero, Uncondbranch); 
   input [63:0] CurrentPC, SignExtImm64; 
   input 	Branch, ALUZero, Uncondbranch; 
   output [63:0] NextPC; 

   /* write your code here */
   wire [63:0] shiftSignExt = SignExtImm64; // shift left 2 
   wire AND0 = Branch && ALUZero; // gate logic 
   wire muxControl = AND0 || Uncondbranch; // gate logic 
   reg [63:0] muxOutput; // result of MUX 
   
   always @ (*) 
      begin 
      // MUX logic 
         if(muxControl) 
            muxOutput <=  CurrentPC + shiftSignExt; 
         else 
            muxOutput <=  CurrentPC + 4; 
      end 
   assign NextPC = muxOutput; // Assign next PC

endmodule
