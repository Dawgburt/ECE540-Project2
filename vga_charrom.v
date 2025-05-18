// vga.v - VGA Display Controller Peripheral with Wishbone + Character Display (Project 2 Spec)

module vga_controller (
    input  wire         clock,
    input  wire         reset,
    output reg  [3:0]   VGA_R,
    output reg  [3:0]   VGA_G,
    output reg  [3:0]   VGA_B,
    output wire         VGA_HS,
    output wire         VGA_VS,
    input  wire         wb_clk,
    input  wire         wb_rst,
    input  wire [5:0]   i_wb_adr,
    input  wire [31:0]  i_wb_dat,
    input  wire [3:0]   i_wb_sel,
    input  wire         i_wb_we,
    input  wire         i_wb_cyc,
    input  wire         i_wb_stb,
    output reg  [31:0]  o_wb_rdt,
    output reg          o_wb_ack
);

    // Character memory (simple 2D framebuffer for 640x480 / 6x8)
    reg [7:0] char_mem [0:59][0:105];

    // Control registers
    reg [9:0] write_row;
    reg [9:0] write_col;
    reg [7:0] write_data;
    reg       display_enable;
    reg [11:0] fg_color = 12'hFFF; // white
    reg [11:0] bg_color = 12'h00F; // blue

    // VGA Timing
    wire [11:0] pixel_row;
    wire [11:0] pixel_column;
    wire [31:0] pixel_num;
    wire video_on;

    dtg vga_dtg (
        .clock(clock),
        .rst(1'b0),
        .horiz_sync(VGA_HS),
        .vert_sync(VGA_VS),
        .video_on(video_on),
        .pixel_row(pixel_row),
        .pixel_column(pixel_column),
        .pix_num(pixel_num)
    );

    // Character display logic
    localparam CHAR_W = 6;
    localparam CHAR_H = 8;

    wire [6:0] char_x = pixel_column / CHAR_W;
    wire [5:0] char_y = pixel_row / CHAR_H;
    wire [2:0] font_row = pixel_row % CHAR_H;
    wire [2:0] font_col = pixel_column % CHAR_W;

    wire [7:0] current_char = char_mem[char_y][char_x];
    wire [5:0] font_bits;

    char_rom font_rom (
        .char_code(current_char),
        .row_addr(font_row),
        .font_row(font_bits)
    );

    //wire pixel_on = font_bits[CHAR_W - 1 - font_col];
    wire pixel_on = 1'b1; // force all pixels ON - TEST CASE
    //wire active_char = display_enable && current_char != 8'h00;
    wire active_char = 1'b1; // Force active for testing _ TEST CASE

    wire [11:0] pixel_color = (pixel_on && active_char) ? fg_color : bg_color;

    // Output RGB values
    always @(posedge clock) begin
        if (video_on) begin
            VGA_R <= pixel_color[11:8];
            VGA_G <= pixel_color[7:4];
            VGA_B <= pixel_color[3:0];
        end else begin
            VGA_R <= 0;
            VGA_G <= 0;
            VGA_B <= 0;
        end
    end

    // Wishbone interface
    always @(posedge wb_clk) begin
        o_wb_ack <= 1'b0;
        if (i_wb_stb && i_wb_cyc && !o_wb_ack) begin
            o_wb_ack <= 1'b1;
            if (i_wb_we) begin
                case (i_wb_adr[5:2])
                    4'h1: begin
                        write_row <= i_wb_dat[19:10];
                        write_col <= i_wb_dat[9:0];
                    end
                    4'h3: begin
                        write_data <= i_wb_dat[7:0];
                        char_mem[write_row][write_col] <= i_wb_dat[7:0];
                    end
                    4'h4: display_enable <= i_wb_dat[0];
                    4'h5: begin
                        fg_color <= i_wb_dat[23:12];
                        bg_color <= i_wb_dat[11:0];
                    end
                endcase
            end else begin
                case (i_wb_adr[5:2])
                    4'h1: o_wb_rdt <= {write_row, write_col};
                    4'h3: o_wb_rdt <= {24'h0, char_mem[write_row][write_col]};
                    4'h4: o_wb_rdt <= {31'b0, display_enable};
                    4'h5: o_wb_rdt <= {8'h0, fg_color, bg_color};
                    default: o_wb_rdt <= 32'h0;
                endcase
            end
        end
    end

endmodule
