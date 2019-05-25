/**
This module implements any types that are not explicitly defined by the D compiler, but are considered
standard D types.  See https://dlang.org/spec/type.html
*/
module d.types;

alias string  = immutable(char)[];
alias wstring = immutable(wchar)[];
alias dstring = immutable(dchar)[];

alias uint8   = ubyte;
alias uint16  = ushort;
alias uint32  = uint;
alias uint64  = ulong;
alias uint128 = ucent;

alias int8   = byte;
alias int16  = short;
alias int32  = int;
alias int64  = long;
alias int128 = cent;

alias uintx = typeof(int.sizeof);
alias intx = typeof(cast(void*)0 - cast(void*)0);
