const std = @import("std");
const zine = @import("zine");

pub fn build(b: *std.Build) void {
    // the site: zig build, in zig-out/public
    const site = zine.website(b, .{
        .output_path = "public",
        .force = true,
    });
    b.getInstallStep().dependOn(&site.step);

    // zig build serve: the live server
    const serve = zine.serve(b, .{});
    b.step("serve", "Start the Zine dev server").dependOn(&serve.step);
}
