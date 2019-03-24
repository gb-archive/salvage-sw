#include <gb/gb.h>
#include <stdio.h>

void main(){
    unsigned char last_byte;
    puts("Hello World!");

    /* Receive 1 byte */
    receive_byte();

    for(;;){
        /* Wait for IO completion... */
        while(_io_status == IO_RECEIVING);
        if(_io_status == IO_IDLE)
            last_byte = _io_in;
        else
            last_byte = 0;

        /* Receive 1 byte */
        receive_byte();
        putchar(last_byte);
    }
}
