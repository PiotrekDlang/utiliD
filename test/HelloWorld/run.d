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
        , "-I=./src"
        , "-I=../../src/"
        , "-c"
        , "-lib"
        , "src/main.d"
        , "-of=" ~ objFile
    ];
    auto compileResult = compile.execute();
    scope(exit)
    {
        if (objFile.exists())
            objFile.remove();
    }
    if (compileResult.status != 0)
    {
        writeln(compileResult.output);
        return;
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
        if (exeFile.exists())
            exeFile.remove();
    }
    if (linkResult.status != 0)
    {
        writeln(compileResult.output);
        return;
    }

    auto run = ["./main"];
    auto runResult = run.execute();

    assert(runResult.status == 0 && runResult.output == "Hello, World!\n");
}