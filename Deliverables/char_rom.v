// char_rom.v - Character generator ROM (6x8 font)
module char_rom (
    input wire [7:0] char_code,   // ASCII character code
    input wire [2:0] row_addr,    // Row address (0-7)
    output reg [5:0] font_row     // 6 pixels of font data
);

    always @(*) begin
        case ({char_code, row_addr})

            // Digits 0–9
            {8'h30, 3'h0}: font_row = 6'b011110; // 0
            {8'h30, 3'h1}: font_row = 6'b100001;
            {8'h30, 3'h2}: font_row = 6'b100011;
            {8'h30, 3'h3}: font_row = 6'b100101;
            {8'h30, 3'h4}: font_row = 6'b101001;
            {8'h30, 3'h5}: font_row = 6'b110001;
            {8'h30, 3'h6}: font_row = 6'b100001;
            {8'h30, 3'h7}: font_row = 6'b011110;

            {8'h31, 3'h0}: font_row = 6'b001000; // 1
            {8'h31, 3'h1}: font_row = 6'b011000;
            {8'h31, 3'h2}: font_row = 6'b001000;
            {8'h31, 3'h3}: font_row = 6'b001000;
            {8'h31, 3'h4}: font_row = 6'b001000;
            {8'h31, 3'h5}: font_row = 6'b001000;
            {8'h31, 3'h6}: font_row = 6'b001000;
            {8'h31, 3'h7}: font_row = 6'b011100;

            {8'h32, 3'h0}: font_row = 6'b011110; // 2
            {8'h32, 3'h1}: font_row = 6'b100001;
            {8'h32, 3'h2}: font_row = 6'b000001;
            {8'h32, 3'h3}: font_row = 6'b000010;
            {8'h32, 3'h4}: font_row = 6'b000100;
            {8'h32, 3'h5}: font_row = 6'b001000;
            {8'h32, 3'h6}: font_row = 6'b010000;
            {8'h32, 3'h7}: font_row = 6'b111111;

            {8'h33, 3'h0}: font_row = 6'b011110; // 3
            {8'h33, 3'h1}: font_row = 6'b100001;
            {8'h33, 3'h2}: font_row = 6'b000001;
            {8'h33, 3'h3}: font_row = 6'b001110;
            {8'h33, 3'h4}: font_row = 6'b000001;
            {8'h33, 3'h5}: font_row = 6'b000001;
            {8'h33, 3'h6}: font_row = 6'b100001;
            {8'h33, 3'h7}: font_row = 6'b011110;

            {8'h34, 3'h0}: font_row = 6'b000100; // 4
            {8'h34, 3'h1}: font_row = 6'b001100;
            {8'h34, 3'h2}: font_row = 6'b010100;
            {8'h34, 3'h3}: font_row = 6'b100100;
            {8'h34, 3'h4}: font_row = 6'b111111;
            {8'h34, 3'h5}: font_row = 6'b000100;
            {8'h34, 3'h6}: font_row = 6'b000100;
            {8'h34, 3'h7}: font_row = 6'b000100;

            {8'h35, 3'h0}: font_row = 6'b111111; // 5
            {8'h35, 3'h1}: font_row = 6'b100000;
            {8'h35, 3'h2}: font_row = 6'b100000;
            {8'h35, 3'h3}: font_row = 6'b111110;
            {8'h35, 3'h4}: font_row = 6'b000001;
            {8'h35, 3'h5}: font_row = 6'b000001;
            {8'h35, 3'h6}: font_row = 6'b100001;
            {8'h35, 3'h7}: font_row = 6'b011110;

            {8'h36, 3'h0}: font_row = 6'b001110; // 6
            {8'h36, 3'h1}: font_row = 6'b010000;
            {8'h36, 3'h2}: font_row = 6'b100000;
            {8'h36, 3'h3}: font_row = 6'b111110;
            {8'h36, 3'h4}: font_row = 6'b100001;
            {8'h36, 3'h5}: font_row = 6'b100001;
            {8'h36, 3'h6}: font_row = 6'b100001;
            {8'h36, 3'h7}: font_row = 6'b011110;

            {8'h37, 3'h0}: font_row = 6'b111111; // 7
            {8'h37, 3'h1}: font_row = 6'b000001;
            {8'h37, 3'h2}: font_row = 6'b000010;
            {8'h37, 3'h3}: font_row = 6'b000100;
            {8'h37, 3'h4}: font_row = 6'b001000;
            {8'h37, 3'h5}: font_row = 6'b010000;
            {8'h37, 3'h6}: font_row = 6'b100000;
            {8'h37, 3'h7}: font_row = 6'b100000;

            {8'h38, 3'h0}: font_row = 6'b011110; // 8
            {8'h38, 3'h1}: font_row = 6'b100001;
            {8'h38, 3'h2}: font_row = 6'b100001;
            {8'h38, 3'h3}: font_row = 6'b011110;
            {8'h38, 3'h4}: font_row = 6'b100001;
            {8'h38, 3'h5}: font_row = 6'b100001;
            {8'h38, 3'h6}: font_row = 6'b100001;
            {8'h38, 3'h7}: font_row = 6'b011110;

            {8'h39, 3'h0}: font_row = 6'b011110; // 9
            {8'h39, 3'h1}: font_row = 6'b100001;
            {8'h39, 3'h2}: font_row = 6'b100001;
            {8'h39, 3'h3}: font_row = 6'b100001;
            {8'h39, 3'h4}: font_row = 6'b011111;
            {8'h39, 3'h5}: font_row = 6'b000001;
            {8'h39, 3'h6}: font_row = 6'b000010;
            {8'h39, 3'h7}: font_row = 6'b011100;

            // Lowercase letters a-z
            {8'h61, 3'h0}: font_row = 6'b000000; // a
            {8'h61, 3'h1}: font_row = 6'b000000;
            {8'h61, 3'h2}: font_row = 6'b011100;
            {8'h61, 3'h3}: font_row = 6'b000010;
            {8'h61, 3'h4}: font_row = 6'b011110;
            {8'h61, 3'h5}: font_row = 6'b100010;
            {8'h61, 3'h6}: font_row = 6'b100010;
            {8'h61, 3'h7}: font_row = 6'b011110;

            {8'h62, 3'h0}: font_row = 6'b100000; // b
            {8'h62, 3'h1}: font_row = 6'b100000;
            {8'h62, 3'h2}: font_row = 6'b101100;
            {8'h62, 3'h3}: font_row = 6'b110010;
            {8'h62, 3'h4}: font_row = 6'b100010;
            {8'h62, 3'h5}: font_row = 6'b100010;
            {8'h62, 3'h6}: font_row = 6'b110010;
            {8'h62, 3'h7}: font_row = 6'b101100;

            {8'h63, 3'h0}: font_row = 6'b000000; // c
            {8'h63, 3'h1}: font_row = 6'b000000;
            {8'h63, 3'h2}: font_row = 6'b011100;
            {8'h63, 3'h3}: font_row = 6'b100010;
            {8'h63, 3'h4}: font_row = 6'b100000;
            {8'h63, 3'h5}: font_row = 6'b100000;
            {8'h63, 3'h6}: font_row = 6'b100010;
            {8'h63, 3'h7}: font_row = 6'b011100;

            {8'h64, 3'h0}: font_row = 6'b000010; // d
            {8'h64, 3'h1}: font_row = 6'b000010;
            {8'h64, 3'h2}: font_row = 6'b011010;
            {8'h64, 3'h3}: font_row = 6'b100110;
            {8'h64, 3'h4}: font_row = 6'b100010;
            {8'h64, 3'h5}: font_row = 6'b100010;
            {8'h64, 3'h6}: font_row = 6'b100110;
            {8'h64, 3'h7}: font_row = 6'b011010;

            {8'h65, 3'h0}: font_row = 6'b000000; // e
            {8'h65, 3'h1}: font_row = 6'b000000;
            {8'h65, 3'h2}: font_row = 6'b011100;
            {8'h65, 3'h3}: font_row = 6'b100010;
            {8'h65, 3'h4}: font_row = 6'b111110;
            {8'h65, 3'h5}: font_row = 6'b100000;
            {8'h65, 3'h6}: font_row = 6'b100010;
            {8'h65, 3'h7}: font_row = 6'b011100;

            {8'h66, 3'h0}: font_row = 6'b001100; // f
            {8'h66, 3'h1}: font_row = 6'b010000;
            {8'h66, 3'h2}: font_row = 6'b010000;
            {8'h66, 3'h3}: font_row = 6'b111000;
            {8'h66, 3'h4}: font_row = 6'b010000;
            {8'h66, 3'h5}: font_row = 6'b010000;
            {8'h66, 3'h6}: font_row = 6'b010000;
            {8'h66, 3'h7}: font_row = 6'b010000;

            {8'h67, 3'h0}: font_row = 6'b000000; // g
            {8'h67, 3'h1}: font_row = 6'b011110;
            {8'h67, 3'h2}: font_row = 6'b100010;
            {8'h67, 3'h3}: font_row = 6'b100010;
            {8'h67, 3'h4}: font_row = 6'b011110;
            {8'h67, 3'h5}: font_row = 6'b000010;
            {8'h67, 3'h6}: font_row = 6'b000100;
            {8'h67, 3'h7}: font_row = 6'b011000;

            {8'h68, 3'h0}: font_row = 6'b100000; // h
            {8'h68, 3'h1}: font_row = 6'b100000;
            {8'h68, 3'h2}: font_row = 6'b101100;
            {8'h68, 3'h3}: font_row = 6'b110010;
            {8'h68, 3'h4}: font_row = 6'b100010;
            {8'h68, 3'h5}: font_row = 6'b100010;
            {8'h68, 3'h6}: font_row = 6'b100010;
            {8'h68, 3'h7}: font_row = 6'b100010;

            {8'h69, 3'h0}: font_row = 6'b001000; // i
            {8'h69, 3'h1}: font_row = 6'b000000;
            {8'h69, 3'h2}: font_row = 6'b011000;
            {8'h69, 3'h3}: font_row = 6'b001000;
            {8'h69, 3'h4}: font_row = 6'b001000;
            {8'h69, 3'h5}: font_row = 6'b001000;
            {8'h69, 3'h6}: font_row = 6'b001000;
            {8'h69, 3'h7}: font_row = 6'b011100;

            {8'h6A, 3'h0}: font_row = 6'b000100; // j
            {8'h6A, 3'h1}: font_row = 6'b000000;
            {8'h6A, 3'h2}: font_row = 6'b001100;
            {8'h6A, 3'h3}: font_row = 6'b000100;
            {8'h6A, 3'h4}: font_row = 6'b000100;
            {8'h6A, 3'h5}: font_row = 6'b000100;
            {8'h6A, 3'h6}: font_row = 6'b100100;
            {8'h6A, 3'h7}: font_row = 6'b011000;
			
			{8'h6B, 3'h0}: font_row = 6'b100000; // k
            {8'h6B, 3'h1}: font_row = 6'b100000;
            {8'h6B, 3'h2}: font_row = 6'b100100;
            {8'h6B, 3'h3}: font_row = 6'b101000;
            {8'h6B, 3'h4}: font_row = 6'b110000;
            {8'h6B, 3'h5}: font_row = 6'b101000;
            {8'h6B, 3'h6}: font_row = 6'b100100;
            {8'h6B, 3'h7}: font_row = 6'b100010;

            {8'h6C, 3'h0}: font_row = 6'b011000; // l
            {8'h6C, 3'h1}: font_row = 6'b001000;
            {8'h6C, 3'h2}: font_row = 6'b001000;
            {8'h6C, 3'h3}: font_row = 6'b001000;
            {8'h6C, 3'h4}: font_row = 6'b001000;
            {8'h6C, 3'h5}: font_row = 6'b001000;
            {8'h6C, 3'h6}: font_row = 6'b001000;
            {8'h6C, 3'h7}: font_row = 6'b011100;

            {8'h6D, 3'h0}: font_row = 6'b000000; // m
            {8'h6D, 3'h1}: font_row = 6'b000000;
            {8'h6D, 3'h2}: font_row = 6'b110100;
            {8'h6D, 3'h3}: font_row = 6'b101010;
            {8'h6D, 3'h4}: font_row = 6'b101010;
            {8'h6D, 3'h5}: font_row = 6'b101010;
            {8'h6D, 3'h6}: font_row = 6'b101010;
            {8'h6D, 3'h7}: font_row = 6'b101010;

            {8'h6E, 3'h0}: font_row = 6'b000000; // n
            {8'h6E, 3'h1}: font_row = 6'b000000;
            {8'h6E, 3'h2}: font_row = 6'b101100;
            {8'h6E, 3'h3}: font_row = 6'b110010;
            {8'h6E, 3'h4}: font_row = 6'b100010;
            {8'h6E, 3'h5}: font_row = 6'b100010;
            {8'h6E, 3'h6}: font_row = 6'b100010;
            {8'h6E, 3'h7}: font_row = 6'b100010;

            {8'h6F, 3'h0}: font_row = 6'b000000; // o
            {8'h6F, 3'h1}: font_row = 6'b000000;
            {8'h6F, 3'h2}: font_row = 6'b011100;
            {8'h6F, 3'h3}: font_row = 6'b100010;
            {8'h6F, 3'h4}: font_row = 6'b100010;
            {8'h6F, 3'h5}: font_row = 6'b100010;
            {8'h6F, 3'h6}: font_row = 6'b100010;
            {8'h6F, 3'h7}: font_row = 6'b011100;

            {8'h70, 3'h0}: font_row = 6'b000000; // p
            {8'h70, 3'h1}: font_row = 6'b000000;
            {8'h70, 3'h2}: font_row = 6'b101100;
            {8'h70, 3'h3}: font_row = 6'b110010;
            {8'h70, 3'h4}: font_row = 6'b100010;
            {8'h70, 3'h5}: font_row = 6'b110010;
            {8'h70, 3'h6}: font_row = 6'b101100;
            {8'h70, 3'h7}: font_row = 6'b100000;

            {8'h71, 3'h0}: font_row = 6'b000000; // q
            {8'h71, 3'h1}: font_row = 6'b000000;
            {8'h71, 3'h2}: font_row = 6'b011010;
            {8'h71, 3'h3}: font_row = 6'b100110;
            {8'h71, 3'h4}: font_row = 6'b100010;
            {8'h71, 3'h5}: font_row = 6'b100110;
            {8'h71, 3'h6}: font_row = 6'b011010;
            {8'h71, 3'h7}: font_row = 6'b000010;

            {8'h72, 3'h0}: font_row = 6'b000000; // r
            {8'h72, 3'h1}: font_row = 6'b000000;
            {8'h72, 3'h2}: font_row = 6'b101100;
            {8'h72, 3'h3}: font_row = 6'b110010;
            {8'h72, 3'h4}: font_row = 6'b100000;
            {8'h72, 3'h5}: font_row = 6'b100000;
            {8'h72, 3'h6}: font_row = 6'b100000;
            {8'h72, 3'h7}: font_row = 6'b100000;

            {8'h73, 3'h0}: font_row = 6'b000000; // s
            {8'h73, 3'h1}: font_row = 6'b000000;
            {8'h73, 3'h2}: font_row = 6'b011110;
            {8'h73, 3'h3}: font_row = 6'b100000;
            {8'h73, 3'h4}: font_row = 6'b011100;
            {8'h73, 3'h5}: font_row = 6'b000010;
            {8'h73, 3'h6}: font_row = 6'b000010;
            {8'h73, 3'h7}: font_row = 6'b111100;

            {8'h74, 3'h0}: font_row = 6'b010000; // t
            {8'h74, 3'h1}: font_row = 6'b010000;
            {8'h74, 3'h2}: font_row = 6'b111000;
            {8'h74, 3'h3}: font_row = 6'b010000;
            {8'h74, 3'h4}: font_row = 6'b010000;
            {8'h74, 3'h5}: font_row = 6'b010000;
            {8'h74, 3'h6}: font_row = 6'b010010;
            {8'h74, 3'h7}: font_row = 6'b001100;

            {8'h75, 3'h0}: font_row = 6'b000000; // u
            {8'h75, 3'h1}: font_row = 6'b000000;
            {8'h75, 3'h2}: font_row = 6'b100010;
            {8'h75, 3'h3}: font_row = 6'b100010;
            {8'h75, 3'h4}: font_row = 6'b100010;
            {8'h75, 3'h5}: font_row = 6'b100010;
            {8'h75, 3'h6}: font_row = 6'b100110;
            {8'h75, 3'h7}: font_row = 6'b011010;

            {8'h76, 3'h0}: font_row = 6'b000000; // v
            {8'h76, 3'h1}: font_row = 6'b000000;
            {8'h76, 3'h2}: font_row = 6'b100010;
            {8'h76, 3'h3}: font_row = 6'b100010;
            {8'h76, 3'h4}: font_row = 6'b010100;
            {8'h76, 3'h5}: font_row = 6'b010100;
            {8'h76, 3'h6}: font_row = 6'b001000;
            {8'h76, 3'h7}: font_row = 6'b001000;

            {8'h77, 3'h0}: font_row = 6'b000000; // w
            {8'h77, 3'h1}: font_row = 6'b000000;
            {8'h77, 3'h2}: font_row = 6'b100010;
            {8'h77, 3'h3}: font_row = 6'b100010;
            {8'h77, 3'h4}: font_row = 6'b101010;
            {8'h77, 3'h5}: font_row = 6'b101010;
            {8'h77, 3'h6}: font_row = 6'b111110;
            {8'h77, 3'h7}: font_row = 6'b010100;

            {8'h78, 3'h0}: font_row = 6'b000000; // x
            {8'h78, 3'h1}: font_row = 6'b000000;
            {8'h78, 3'h2}: font_row = 6'b100010;
            {8'h78, 3'h3}: font_row = 6'b010100;
            {8'h78, 3'h4}: font_row = 6'b001000;
            {8'h78, 3'h5}: font_row = 6'b001000;
            {8'h78, 3'h6}: font_row = 6'b010100;
            {8'h78, 3'h7}: font_row = 6'b100010;

            {8'h79, 3'h0}: font_row = 6'b000000; // y
            {8'h79, 3'h1}: font_row = 6'b000000;
            {8'h79, 3'h2}: font_row = 6'b100010;
            {8'h79, 3'h3}: font_row = 6'b100010;
            {8'h79, 3'h4}: font_row = 6'b011110;
            {8'h79, 3'h5}: font_row = 6'b000010;
            {8'h79, 3'h6}: font_row = 6'b000010;
            {8'h79, 3'h7}: font_row = 6'b111100;

            {8'h7A, 3'h0}: font_row = 6'b000000; // z
            {8'h7A, 3'h1}: font_row = 6'b000000;
            {8'h7A, 3'h2}: font_row = 6'b111110;
            {8'h7A, 3'h3}: font_row = 6'b000010;
            {8'h7A, 3'h4}: font_row = 6'b000100;
            {8'h7A, 3'h5}: font_row = 6'b001000;
            {8'h7A, 3'h6}: font_row = 6'b010000;
            {8'h7A, 3'h7}: font_row = 6'b111110;

            default: font_row = 6'b000000; // blank for undefined
        endcase
    end

endmodule
