volatile unsigned *vga_addr = (volatile unsigned *) 0x00004000; /* VGA adapter base address */

void vga_plot(unsigned x, unsigned y, unsigned colour)
{
    *vga_addr = (y << 24) + (x << 16) + colour;
}

// ~~~ Notes and Instructions ~~~

/*
  The write request consists of a single 32-bit word with address offset 0, with the following bit encoding:

  word	bits	meaning
  0	    30..24	y coordinate (7 bits)
  0	    23..16	x coordinate (8 bits)
  0	    7..0	brightness (0=black, 255=white)
*/