module data_selector(op, r1, r2, y);
    input wire[3:0] op, r1, r2;
    output reg[3:0] y;
    wire a, b;
    assign a = op[0] | op[3];
    assign b = op[1];

    always @* begin
        case({a, b})
            2'b00: y = r1; 
            2'b01: y = r2; 
            2'b10: y = 4'b0; 
            2'b11: y = 4'b0; 
        endcase
        $write("[%t] data selector(op: %b, a: %b, b: %b): %b):\n", $time, op, a, b, y);
    end
endmodule

/*
module ds_sim();
  reg[3:0] op, r1, r2;
  wire[3:0] y;
  data_selector ds_instance(op, r1, r2, y);

  initial begin
    op = 4'b0000;
    #10 op = 4'b0001;
    #10 op = 4'b0010;
    #10 op = 4'b0011;
    #10 op = 4'b0100;
    #10 op = 4'b0101;
    #10 op = 4'b0110;
    #10 op = 4'b0111;
    #10 op = 4'b1000;
    #10 op = 4'b1001;
    #10 op = 4'b1010;
    #10 op = 4'b1011;
    #10 op = 4'b1100;
    #10 op = 4'b1101;
    #10 op = 4'b1110;
    #10 op = 4'b1111;
  end

  initial begin
    r1 = 4'b0001;
    r2 = 4'b1111;
    #200 $finish();
  end

  initial begin
      $dumpfile("ds_sim.vcd");
      $dumpvars(0, ds_instance);
  end

endmodule
*/