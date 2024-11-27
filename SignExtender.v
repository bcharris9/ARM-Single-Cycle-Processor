module SignExtender(BusImm, Instr, Ctrl); 
   output reg [63:0] BusImm; 
   input [25:0]  Instr; 
   input [2:0] Ctrl; 

   always @(*) begin
      case (Ctrl)
         3'b000: begin //I-type
            BusImm = {52'b0, Instr[21:10]}; //done
         end
         3'b001: begin //D-type
            BusImm = {{55{Instr[20]}}, Instr[20:12]}; //done?
         end
         3'b010: begin //B-type
            BusImm = {{36{Instr[25]}}, Instr[25:0], 2'b0}; //done?
         end
         3'b011: begin //CB-type
            BusImm = {{43{Instr[23]}}, Instr[23:5], 2'b0}; //done?
         end
         3'b100: begin //MovIMM
            case(Instr[22:21])
               2'b00: //shift 1
                  BusImm = {48'b0, Instr[20:5]}; //done?
               2'b01: //shift 1
                  BusImm = {32'b0, Instr[20:5], 16'b0}; //done?
               2'b10: //shift 1
                  BusImm = {16'b0, Instr[20:5], 32'b0}; //done?
               2'b11: //shift 1
                  BusImm = {Instr[20:5], 48'b0}; //done?
            endcase
         end
      endcase
   end
endmodule
