load("//:providers.bzl", "SupergraphInfo", "SubgraphInfo")

def _supergraph_impl(ctx):
    return [
        SupergraphInfo (
            file = ctx.file.subgraph,
        )
    ]

supergraph = rule (
    implementation = _supergraph_impl,
    attrs = {
        "deps": attr.label_list(
            mandatory = True,
            providers = [SubgraphInfo],
        ),
    },
)