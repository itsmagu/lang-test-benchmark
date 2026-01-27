const std = @import("std");

pub fn main() !void {
    std.debug.print("Hellow Planet", .{});
    const allocator = std.heap.page_allocator;
    const args = try std.process.argsAlloc(allocator);
    defer std.process.argsFree(allocator,args);

    if (args.len > 1){
        std.debug.print("Also passed with {s}",.{args[1]});
    }
}
