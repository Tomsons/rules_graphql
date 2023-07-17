load("//:providers.bzl", "SupergraphInfo", "SubgraphInfo")

def _copy_router(ctx):
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
    return router

def _create_runner(ctx, router):
    runner = ctx.actions.declare_file("runner.sh")
    ctx.actions.write(
        output = runner,
        content = """#!/bin/bash
{router}
""".format(
            router = router.short_path,
        ),
        is_executable = True,
    )
    return runner

def _gateway_impl(ctx):
    router = _copy_router(ctx)
    runner = _create_runner(ctx, router)
    return [
        DefaultInfo (
            files = depset([router, runner]),
            executable = runner,
            runfiles = ctx.runfiles([router]),
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
        "@com_github_tomsons_rules_graphql//:rover_toolchain",
    ]
)