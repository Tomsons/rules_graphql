ROUTER_REPOSITORY = {
    "linux_aarch64": {
        "url": "https://github.com/apollographql/router/releases/download/v{version}/router-v{version}-aarch64-unknown-linux-gnu.tar.gz",
        "exec_compatible_with": [
            "@platforms//os:linux",
            "@platforms//cpu:arm64",
        ],
        "target_compatible_with": [
            "@platforms//os:linux",
            "@platforms//cpu:arm64",
        ]
    },
    "darwin": {
        "url": "https://github.com/apollographql/router/releases/download/v{version}/router-v{version}-x86_64-apple-darwin.tar.gz",
        "exec_compatible_with": [
            "@platforms//os:macos",
        ],
        "target_compatible_with": [
            "@platforms//os:macos",
        ]
    },
    "linux_x86_64": {
        "url": "https://github.com/apollographql/router/releases/download/v{version}/router-v{version}-x86_64-unknown-linux-gnu.tar.gz",
        "exec_compatible_with": [
            "@platforms//os:linux",
            "@platforms//cpu:x86_64"
        ],
        "target_compatible_with": [
            "@platforms//os:linux",
            "@platforms//cpu:x86_64"
        ]
    },
}
