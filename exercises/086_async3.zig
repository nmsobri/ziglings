//
// Because they can suspend and resume, async Zig functions are
// an example of a more general programming concept called
// "coroutines". One of the neat things about Zig async functions
// is that they retain their state as they are suspended and
// resumed.
//
// See if you can make this program print "5 4 3 2 1".
//
const print = @import("std").debug.print;

pub fn main() void {
    const n = 5;
    var foo_frame = async foo(n); //5
    resume foo_frame; // 4
    resume foo_frame; // 3
    resume foo_frame; // 2
    resume foo_frame; // 1
    resume foo_frame; // 0

    print("\n", .{});
}

fn foo(countdown: u32) void {
    var current = countdown;

    while (current > 0) {
        print("{} ", .{current});
        current -= 1;
        suspend {}
    }
}
