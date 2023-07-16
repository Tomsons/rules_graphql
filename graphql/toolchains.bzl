load("//:providers.bzl", "RouterInfo")

def _router_toolchain_impl(ctx):
    return [
        platform_common.ToolchainInfo(
            router = RouterInfo (
                path = ctx.attr.toolchain,
                version = ctx.attr.version,
            )
        )
    ]

router_toolchain = rule (
    implementation = _router_toolchain_impl,
    attrs = {
        "toolchain": attr.label(allow_single_file = True),
        "version": attr.string(mandatory = True),
    },
    doc = "Create a toolchain for a router",
)