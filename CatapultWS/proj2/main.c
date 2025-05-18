#include <stdint.h>
#include <unistd.h>

// Define VGA peripheral registers (assuming memory-mapped I/O)
#define VGA_BASE        0x80001500
#define VGA_ROW_COL     (*(volatile uint32_t *)(VGA_BASE + 0x00))
#define VGA_DATA        (*(volatile uint32_t *)(VGA_BASE + 0x0C))
#define VGA_CTRL        (*(volatile uint32_t *)(VGA_BASE + 0x10))
#define VGA_COLOR       (*(volatile uint32_t *)(VGA_BASE + 0x14))

//Sleep function
void delay_ms(uint32_t ms) {
    // Adjust this multiplier based on your clock speed (assume ~100 MHz)
    for (volatile uint32_t i = 0; i < ms * 80000; i++);
}


// Function to display a single character at a specific position
void display_char(uint8_t row, uint8_t col, char c, uint16_t fg_color, uint16_t bg_color) {
    // Set position
    VGA_ROW_COL = (row << 10) | col;
    
    // Set colors (red background for this case)
    VGA_COLOR = (fg_color << 12) | bg_color;
    
    // Write character
    VGA_DATA = c;
    
    // Small delay to ensure the character is displayed
    for (volatile int i = 0; i < 100; i++);
}

// Function to convert a digit to ASCII character
char digit_to_char(uint8_t digit) {
    if (digit >= 0 && digit <= 9) {
        return '0' + digit;
    }
    return '?'; // Fallback for invalid digits
}

// Function to display an unsigned integer with fixed width
void display_number(uint8_t row, uint8_t col, uint32_t num, uint8_t width, uint16_t fg_color, uint16_t bg_color) {
    char buffer[10]; // Enough for 32-bit numbers
    uint8_t digits = 0;
    uint32_t temp = num;
    
    // Handle 0 case
    if (temp == 0) {
        buffer[digits++] = '0';
    }
    
    // Extract digits (reverse order)
    while (temp > 0) {
        uint8_t digit = temp % 10;
        // For even numbers, display as '0'
        buffer[digits++] = (digit % 2 == 0) ? '0' : digit_to_char(digit);
        temp /= 10;
    }
    
    // Pad with leading spaces to maintain fixed width
    for (uint8_t i = digits; i < width; i++) {
        buffer[i] = ' ';
    }
    
    // Display digits from left to right
    for (int8_t i = width - 1; i >= 0; i--) {
        display_char(row, col + (width - 1 - i), buffer[i], fg_color, bg_color);
    }
}

int main() {
    // Example array of unsigned integers
    uint32_t numbers[] = {12345, 67890, 24680, 13579, 98765, 43210};
    uint8_t num_count = sizeof(numbers) / sizeof(numbers[0]);
    
    // Initialize VGA display
    VGA_CTRL = 0x1; // Enable display
    
    // Set colors: white text on red background
    uint16_t fg_color = 0xFFF; // White (RGB 4-4-4)
    uint16_t bg_color = 0xF00; // Red (RGB 4-0-0)
    
    // Display each number with 1-second delay
    for (uint8_t i = 0; i < num_count; i++) {
        // Display number at row i, column 0 with width 5
        display_number(i, 0, numbers[i], 5, fg_color, bg_color);
        
        // Approximately 1-second delay
        delay_ms(1); // Using standard unix delay_ms function
        

    }
    
    return 0;
}
