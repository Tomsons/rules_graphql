load("//graphql/internal:router.bzl", "ROUTER_REPOSITORY")
load("//shared:toolchains_repo.bzl", "toolchains_repo")

def _router_binary_repo_impl(ctx):
    ctx.download_and_extract(ctx.attr.url.format(
        version = ctx.attr.rust_router_version,
    ), stripPrefix = "dist")

    ctx.file(
        "BUILD.bazel",
        content = """# Autogenerated by graphql/internal:router.bzl
load("@com_github_tomsons_rules_graphql//graphql:toolchains.bzl", "router_toolchain")

router_toolchain(
    name = "toolchain",
    toolchain = ":router",
    version = "{version}",
)
        """.format(
            version = ctx.attr.rust_router_version,
        ),
    )


router_binary_repo = repository_rule (
    implementation = _router_binary_repo_impl,
    attrs = {
        "rust_router_version": attr.string(mandatory = True),
        "url": attr.string(mandatory = True),
    },
)

def graphql_register_toolchains(
    rust_router_version = "1.24.0"
):
    meta = {}
    for key, value in ROUTER_REPOSITORY.items():
        router_binary_repo(
            name = "apollo_router_{}".format(key),
            rust_router_version = rust_router_version,
            url = value['url'],
        )
        meta[key] = value["exec_compatible_with"]

        native.register_toolchains("@apollo_router_toolchains//:{}".format(key))
    toolchains_repo(
        name = "apollo_router_toolchains",
        repository_name = "apollo_router",
        toolchain_name = "toolchain",
        root_repository_name = "com_github_tomsons_rules_graphql",
        toolchain_type_name = "router_toolchain",
        meta = meta,
    )