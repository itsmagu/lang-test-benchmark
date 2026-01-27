const std = @import("std");

pub fn main() !void {
    const stdout_file = std.io.getStdOut().writer();
    var bw = std.io.bufferedWriter(stdout_file);
    const stdout = bw.writer();

    var x: f32 = 0;
    var y: f32 = 0;
    var z: f32 = 0;
    var dim: i32 = 0;
    var offset: i32 = 0;

    for (0..6) |_| {
        for (0..12) |_| {
            x += 1;
            y += x;
            z *= (x*y);
        }

        // This casting took me 2 hours to figure out and is ugly as fuq
        dim = @intFromFloat(x+y);
        offset = @as(i32,@intFromFloat(x)) * dim;
        z = @floatFromInt(dim + @divFloor(2,dim));
        try stdout.print("{d} {d} {d} {d} {d}\n", .{x,y,z,dim,offset});
    }

    try bw.flush(); // Don't forget to flush!
}
