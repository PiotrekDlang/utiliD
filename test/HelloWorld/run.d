import std.file;
import std.process;
import std.stdio;

int main(string[] args)
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
        return 1;
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
        return 1;
    }

    auto run = ["./main"];
    auto runResult = run.execute();

    assert(runResult.status == 0 && runResult.output == "Hello, World!\n");
    return 0;
}
