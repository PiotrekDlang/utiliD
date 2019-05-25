import std.file;
import std.process;
import std.stdio;

int main(string[] args)
{
    auto cmd =
    [
        "rdmd"
        , "run.d"
    ];
    write("HelloWorld...");
    immutable result = cmd.execute(null, Config.none, size_t.max, "HelloWorld");
    if (result.status != 0)
    {
        writeln(result.output);
        return 1;
    }
    writeln("Passed");
    return 0;
}
