import std.file;
import std.process;
import std.stdio;

void main(string[] args)
{
    immutable objFile = "main.o";
    auto compile = 
    [
        "dmd"
        , "-conf="
        , "-debuglib="
        , "-defaultlib="
        , "-fPIC"
        , "-I=../../src/d"
        , "-c"
        , "-lib"
        , "src/main.d"
        , "-of=" ~ objFile
    ];
    auto compileResult = compile.execute();
    scope(exit)
    {
        objFile.remove();
    }

    immutable exeFile = "main";
    auto link =
    [
        "ld"
        , objFile
        , "-o", exeFile
    ];
    auto linkResult = link.execute();
    scope(exit)
    {
        exeFile.remove();
    }

    auto run = ["./main"];
    auto runResult = run.execute();

    assert(runResult.output == "Hello, World!\n");
}