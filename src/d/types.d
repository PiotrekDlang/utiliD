/**
This module implements any types that are not explicitly defined by the D compiler, but are considered
standard D types.  See https://dlang.org/spec/type.html
*/
module d.types;

alias string  = immutable(char)[];
alias wstring = immutable(wchar)[];
alias dstring = immutable(dchar)[];

// QUESTION:  Do we really want to use the `size_t` convention?  It's a carry-over from C and the `_t` convention
// is not idiomatic-D.  I'd prefer to come up with something else.

// The following code section is a proposal for meaningful/readable integer aliases 

version(proposalA)
{
	
alias u8   = ubyte;
alias u16  = ushort;
alias u32  = uint;
alias u64  = ulong;
alias u128 = ucent;

alias i8   = byte;
alias i16  = short;
alias i32  = int;
alias i64  = long;
alias i128 = cent;

alias isize = typeof(int.sizeof);
alias usize = typeof(cast(void*)0 - cast(void*)0);


// simple example for a visualization
isize fun1(i32 a, i8 * b, usize index);

}


version(proposalB)
{
	
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

// simple example for a visualization
intx fun1(uint32 a, int8 * b, uintx index);

}
