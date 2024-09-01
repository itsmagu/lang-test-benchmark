const std = @import("std");

pub fn main() !void {
    const stdout_file = std.io.getStdOut().writer();
    var bw = std.io.bufferedWriter(stdout_file);
    const stdout = bw.writer();

    try stdout.print("Hi Planet\n", .{});
    
    const allocator = std.heap.page_allocator;

    const args = try std.process.argsAlloc(allocator);
    defer std.process.argsFree(allocator,args);

    if (args.len > 1){
        try stdout.print("Also passed with {s}",.{args[1]});
    }

    try bw.flush(); // Don't forget to flush!
}
