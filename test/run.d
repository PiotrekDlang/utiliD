import std.file;
import std.process;
import std.stdio;

void main(string[] args)
{
    auto cmd =
    [
        "rdmd"
        , "run.d"
    ];
    write("HelloWorld...");
    immutable result = cmd.execute(null, Config.none, size_t.max, "HelloWorld");
    assert(result.status == 0);
    writeln("Passed");
}
