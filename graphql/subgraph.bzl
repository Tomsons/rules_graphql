load("//:providers.bzl", "SubgraphInfo")

def _subgraph_impl(ctx):
    return [
        SubgraphInfo (
            src = ctx.file.src,
        )
    ]

subgraph = rule (
    implementation = _subgraph_impl,
    attrs = {
        "src": attr.label(
            mandatory = True,
            allow_single_file = [".graphql", ".graphqls"],
        ),
    },
)