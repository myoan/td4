module decoder(op, cin, a, b, s);
    input wire [3:0] op;
    input wire cin;
    output reg a, b;
    output reg[3:0] s;
    reg [5:0] data;

    always @(op) begin
        case(op)
            4'b0000: {b, a, s} <= 6'b000111;
            4'b0001: {b, a, s} <= 6'b010111;
            4'b0010: {b, a, s} <= 6'b100111;
            4'b0011: {b, a, s} <= 6'b110111;
            4'b0100: {b, a, s} <= 6'b001011;
            4'b0101: {b, a, s} <= 6'b011011;
            4'b0110: {b, a, s} <= 6'b101011;
            4'b0111: {b, a, s} <= 6'b111011;
            4'b1001: {b, a, s} <= 6'b011101;
            4'b1011: {b, a, s} <= 6'b111101;
            4'b1110:
                begin
                    if (cin == 1'b1) 
                        {b, a, s} <= 6'b001111;
                    else
                        {b, a, s} <= 6'b111110;
                end
            4'b1111: {b, a, s} <= 6'b111110;
            default: {b, a, s} <= 6'b000000;
        endcase
        $write("[%t] decoder(%b, %b): %b\n", $time, op, cin, {b, a, s});
    end
endmodule

/*
module decoder_sim();
    reg[3:0] op;
    reg cin;
    wire a, b;
    wire[3:0] s;
    decoder decoder_instance(op, cin, a, b, s);

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
        #10 op = 4'b0000;
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
        cin = 0;
        #150 cin = 1;
        #300 $finish();
    end

    initial begin
        $dumpfile("decoder_sim.vcd");
        $dumpvars(0, decoder_instance);
    end
endmodule
*/
