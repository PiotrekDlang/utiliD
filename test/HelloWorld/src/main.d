module main;

import d;
import d.types;

private extern(C) void __d_sys_exit(int64 arg1)
{
    asm
    {
        mov RAX, 60;
        mov RDI, arg1;
        syscall;
    }
}

private int64 __d_sys_write(int64 arg1, in void* arg2, int64 arg3)
{
    int64 result;

    asm
    {
        mov RAX, 1;
        mov RDI, arg1;
        mov RSI, arg2;
        mov RDX, arg3;
        syscall;
    }

    return result;
}

void write(string text)
{
    __d_sys_write(2, text.ptr, text.length);
}

private extern(C) void _start()
{
    main();
    __d_sys_exit(0);
}

void main()
{
    write("Hello, World!\n");
}
