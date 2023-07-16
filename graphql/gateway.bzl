load("//:providers.bzl", "SupergraphInfo", "SubgraphInfo")

def _gateway_impl(ctx):
    router = ctx.actions.declare_file("router")
    ctx.actions.run_shell(
        inputs = [
            ctx.toolchains["@com_github_tomsons_rules_graphql//:router_toolchain"].router.bin,
        ],
        outputs = [
            router,
        ],
        command = "cp {tc} {out}".format(
            tc = ctx.toolchains["@com_github_tomsons_rules_graphql//:router_toolchain"].router.bin.path,
            out = router.path,
        ),
    )
    return [
        DefaultInfo (
            files = depset([router]),
            executable = router,
        )
    ]

gateway = rule (
    executable = True,
    implementation = _gateway_impl,
    attrs = {
        "supergraph": attr.label(
            allow_single_file = True,
            providers = [SupergraphInfo]
        ),
        "subgraphs": attr.label_list(
            providers = [SubgraphInfo]
        ),
    },
    toolchains = [
        "@com_github_tomsons_rules_graphql//:router_toolchain",
    ]
)