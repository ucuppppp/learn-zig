const std = @import("std");
const Fmt = std.fmt;
const FormatIntOptions = Fmt.FormatIntOptions;
const print = std.debug.print;

pub fn main() !void {
    var a: i8 = 20;
    const b = false;
    const c = 10.2;
    if(b) a = 1 else a = 0;
    print("Hello {}!\n", .{a});

    var i: u8 = 0;
    while (i < 5) : (i += 1) {
        var iBuffer: [20]u8 = undefined;
        var aBuffer: [20]u8 = undefined;
        var cBuffer: [20]u8 = undefined;
        const iStr = try Fmt.bufPrint(&iBuffer, "{x}", .{i});
        const aStr = try Fmt.bufPrint(&aBuffer, "{x}", .{a}); 
        const cStr = try Fmt.bufPrint(&cBuffer, "{d:.1}", .{c}); 
        print("concatenate baby := a:{s} i:{s} c:{s}\n", .{aStr, iStr, cStr});
    }
    const fibo = fibonacci(10);
    print("fibonacci = {}\n", .{fibo});
    var bla: i8 = 10;
    bla = switch (bla) {
        -1...1 => -bla,
        10, 100 => @divExact(bla, 10),
        else => bla,
    };
    print("switch pattern bla = {}\n", .{bla});
}


fn fibonacci(n: u16) u16 {
    if(n == 0 or n == 1) return n;
    return fibonacci(n - 1) + fibonacci(n - 2); 
}
