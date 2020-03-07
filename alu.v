module alu(y, im, sgm, cout);
    input wire[3:0] y;
    input wire[3:0] im;
    output [3:0] sgm;
    output cout;
    assign {cout, sgm} = y + im;
endmodule

/*
module alu_sim();
    reg[3:0] y, im;
    wire[3:0] s;
    wire c;
    alu alu_instance(y, im, s, c);

    initial begin
        y = 4'b0000;
        #10 y = 4'b0001;
        #10 y = 4'b0010;
        #10 y = 4'b0011;
        #10 y = 4'b0100;
        #10 y = 4'b0101;
        #10 y = 4'b0110;
        #10 y = 4'b0111;
        #10 y = 4'b1000;
        #10 y = 4'b1001;
        #10 y = 4'b1010;
        #10 y = 4'b1011;
        #10 y = 4'b1100;
        #10 y = 4'b1101;
        #10 y = 4'b1110;
        #10 y = 4'b1111;
    end

    initial begin
        im = 4'b0001;
        #100 im = 4'b0101;
        #200 $finish();
    end

    initial begin
        $dumpfile("alu_sim.vcd");
        $dumpvars(0, alu_instance);
    end
endmodule
*/
