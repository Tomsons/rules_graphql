load("//:providers.bzl", "RouterInfo")

def _router_toolchain_impl(ctx):
    toolchain_info = platform_common.ToolchainInfo(
         router = RouterInfo (
             bin = ctx.file.toolchain,
             version = ctx.attr.version,
         )
     )
    return [toolchain_info]

router_toolchain = rule (
    implementation = _router_toolchain_impl,
    attrs = {
        "toolchain": attr.label(allow_single_file = True, executable = True, mandatory = True, cfg = "host"),
        "version": attr.string(mandatory = True),
    },
    doc = "Create a toolchain for a router",
)