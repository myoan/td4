module top();
  reg CLK, RST_X;
  td4 td4_instance(CLK, RST_X);

  initial begin
    CLK = 0;
    forever #1 CLK = ~CLK;
  end

  initial begin
    RST_X = 1;
    #2 RST_X = 0;
  end

  initial begin
    #500 $finish();
  end

  initial begin
      $dumpfile("td4_sim.vcd");
      $dumpvars(0, td4_instance);
  end

endmodule