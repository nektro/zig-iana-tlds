const std = @import("std");

const tlds = @import("iana-tlds").tlds;

pub fn main() anyerror!void {
    std.log.info("All your codebase are belong to us.", .{});
    for (tlds) |t| {
        std.log.info("{s}", .{t});
    }
}
