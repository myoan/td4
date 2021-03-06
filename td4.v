// `define LEN_CLOCK 10
`define LEN_CLOCK 5000000
module td4(clk, rst, led);
    input clk, rst;
    wire a, b, cout;
    reg c;
    wire[3:0] op, im, s, y, in;
    wire[3:0] q0, q1, q2, q3;
    output[3:0] led;

    reg [26:0] counter;
    reg td4_clk;

    initial begin
        td4_clk = 1'b0;
        c = 1'b0;
    end

    always @(posedge clk) begin
        if (rst | counter == `LEN_CLOCK - 1) begin
	        counter <= 0;
	        td4_clk <= ~td4_clk;
            $write("[%t] click c: %b\n", $time, counter);
	    end else counter <= counter + 1'b1;
    end

    memory mem_ins(.pc(q3),.op(op),.im(im));
    decoder dcd_ins(.op(op),.cin(c),.a(a),.b(b),.s(s));

    data_selector ds_ins(.op(op),.r1(q0),.r2(q1),.y(y));
    alu a_ins(.y(y),.im(im),.sgm(in),.cout(cout));

    always @(posedge td4_clk) begin
        $write("[%t] ALU: cout: %b, sgm: %b\n", $time, cout, in);
        c <= cout;
    end

    register r1_ins(.clk(td4_clk),.rst(rst),.ld(s[3]),.in(in),.q(q0));
    register r2_ins(.clk(td4_clk),.rst(rst),.ld(s[2]),.in(in),.q(q1));
    register r3_ins(.clk(td4_clk),.rst(rst),.ld(s[1]),.in(in),.q(q2));
    program_counter pc_ins(.clk(td4_clk),.rst(rst),.ld(s[0]),.in(in),.q(q3));
    assign led = q2;
endmodule

/*
// LED chika
module memory(pc, op, im);
    input [3:0] pc;
    output reg[3:0] op, im;

    always @* begin
        case(pc)
            4'b0000: {op, im} = 8'b10110011; 
            4'b0001: {op, im} = 8'b10110110; 
            4'b0010: {op, im} = 8'b10111100; 
            4'b0011: {op, im} = 8'b10111000; 
            4'b0100: {op, im} = 8'b10111000; 
            4'b0101: {op, im} = 8'b10111100; 
            4'b0110: {op, im} = 8'b10110110; 
            4'b0111: {op, im} = 8'b10110011; 
            4'b1000: {op, im} = 8'b10110001; 
            4'b1001: {op, im} = 8'b11110000; 
        endcase
        $write("[%t] memory(%b): %b\n", $time, pc, {op, im});
    end
endmodule
*/

/*
// 1min timer
module memory(pc, op, im);
    input [3:0] pc;
    output reg[3:0] op, im;

    always @(pc) begin
        case(pc)

            4'b0000: {op, im} = 8'b10110000; // OUT 0000
            4'b0001: {op, im} = 8'b10110100; // OUT 0100

            4'b0010: {op, im} = 8'b00000001; // ADD A,0001
            4'b0011: {op, im} = 8'b11100000; // JNC 0000
            4'b0100: {op, im} = 8'b10111000; // OUT 1000
            4'b0101: {op, im} = 8'b11110101; // JMP 0101
        endcase
        $write("[%t] memory(%b): %b\n", $time, pc, {op, im});
    end
endmodule
*/

// 3min timer
module memory(pc, op, im);
    input [3:0] pc;
    output reg[3:0] op, im;

    always @* begin
        case(pc)
            4'b0000: {op, im} = 8'b10110111; // OUT 0111
            4'b0001: {op, im} = 8'b00000001; // ADD A,0001
            4'b0010: {op, im} = 8'b11100001; // JNC 0001
            4'b0011: {op, im} = 8'b00000001; // ADD A,0001

            4'b0100: {op, im} = 8'b11100011; // JNC 0011
            4'b0101: {op, im} = 8'b10110110; // OUT 0110
            4'b0110: {op, im} = 8'b00000001; // ADD A,0001
            4'b0111: {op, im} = 8'b11100110; // JNC 0110

            4'b1000: {op, im} = 8'b00000001; // ADD A,0001
            4'b1001: {op, im} = 8'b11101000; // JNC 1000
            4'b1010: {op, im} = 8'b10110000; // OUT 0000
            4'b1011: {op, im} = 8'b10110100; // OUT 0100

            4'b1100: {op, im} = 8'b00000001; // ADD A,0001
            4'b1101: {op, im} = 8'b11101010; // JNC 1010
            4'b1110: {op, im} = 8'b10111000; // OUT 1000
            4'b1111: {op, im} = 8'b11111111; // JMP 1111
        endcase
        $write("[%t] memory(%b): %b\n", $time, pc, {op, im});
    end
endmodule

module register(clk, rst, ld, in, q);
    input wire clk, rst;
    input wire ld;
    input wire[3:0] in;
    output reg[3:0] q;

    always @(posedge clk) begin
        if (rst)
            q <= 4'h0;
        else if (ld == 1'b0)
            q <= in;
        $write("[%t] reg: rst: %b, ld: %b, in: %b, q:%b\n", $time, rst, ld, in, q);
    end
endmodule

module program_counter(clk, rst, ld, in, q);
    input wire clk, rst;
    input wire ld;
    input wire[3:0] in;
    output reg[3:0] q;

    always @(posedge clk) begin
        if (rst)
            q <= 4'h0;
        else if (ld == 1'b0)
            q <= in;
        else
            q <= q + 1;
        $write("[%t] pc: rst: %b, ld: %b, in: %b, q:%b\n", $time, rst, ld, in, q);
    end
endmodule
