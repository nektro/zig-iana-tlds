const std = @import("std");
const tlds = @import("iana-tlds");

test {
    _ = &tlds.tlds.len;
}
