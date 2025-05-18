#include <stdint.h>

#define VGA_BASE     0x80001500
#define VGA_ROW_COL  (*(volatile uint32_t*)(VGA_BASE + 0x04))
#define VGA_DATA     (*(volatile uint32_t*)(VGA_BASE + 0x0C))
#define VGA_CTRL     (*(volatile uint32_t*)(VGA_BASE + 0x10))
#define VGA_COLOR    (*(volatile uint32_t*)(VGA_BASE + 0x14))

int main() {
    // Set colors: white on yellow
    VGA_COLOR = (0xFFF << 12) | 0x0F0;


    // Set position to center-ish
    VGA_ROW_COL = (30 << 10) | 50;

    // Write lowercase 'a'
    VGA_DATA = 'a';

    // Enable display
    VGA_CTRL = 1;

    while (1);
}
