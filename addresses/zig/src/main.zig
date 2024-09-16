const std = @import("std");
const print = std.debug.print;

pub fn main() !void {
    nice();
    cool();
    moveMe();

    print("{}",.{calcPtrDist(moveMe,nice)});
}

fn moveMe() void {
    print("moveMe\n",.{});
}

fn nice() void {
    print("nice\n",.{});
}

fn cool() void {
    print("cool\n",.{});
}

fn calcPtrDist(a: *const fn()void,b: *const fn()void) usize {
    const aint = @intFromPtr(a);
    const bint = @intFromPtr(b);
    if (aint > bint) {return aint - bint;}
    else {return bint - aint;}
}
