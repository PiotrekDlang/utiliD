module main;

private extern(C) void __d_sys_exit(long arg1)
{
    asm
    {
        mov RAX, 60;
        mov RDI, arg1;
        syscall;
    }
}

private long __d_sys_write(long arg1, in void* arg2, long arg3)
{
    long result;

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
