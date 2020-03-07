module top();
  reg CLK, RST_X;
  wire[3:0] LED;
  td4 td4_instance(CLK, RST_X, LED);

  initial begin
    CLK = 0;
    forever #1 CLK = ~CLK;
  end

  initial begin
    RST_X = 1;
    #20 RST_X = 0;
  end

  initial begin
    #3000 $finish();
  end

  initial begin
      $dumpfile("td4_sim.vcd");
      $dumpvars(0, td4_instance);
  end

endmodule
