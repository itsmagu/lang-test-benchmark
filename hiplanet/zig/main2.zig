const std = @import("std");
const win = @cImport(@cInclude("windows.h"));

pub fn main() void {
    const stdout = win.GetStdHandle(win.STD_OUTPUT_HANDLE);

    const hello_string = "Hi Planet\n";
    var write_len :u32= 0;
    _ = win.WriteFile(stdout, @ptrCast(hello_string), @truncate(hello_string.len), &write_len, null);

    const args = std.os.argv;
    if (args.len>1){
        var buf : [32]u8 = undefined;
        const buf2 = std.fmt.bufPrint(&buf, "Also passed with {s}\n\x00", .{args[1]}) catch unreachable;
        _ = win.WriteFile(stdout, &buf, @truncate(buf2.len), &write_len, null);
    }
}
