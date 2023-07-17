ROVER_REPOSITORY = {
    "linux_aarch64": {
        "url": "https://github.com/apollographql/rover/releases/download/v{version}/rover-v{version}-aarch64-unknown-linux-gnu.tar.gz",
        "exec_compatible_with": [
            "@platforms//os:linux",
            "@platforms//cpu:arm64",
        ],
        "target_compatible_with": [
            "@platforms//os:linux",
            "@platforms//cpu:arm64",
        ]
    },
    "darwin_arm64": {
        "url": "https://github.com/apollographql/rover/releases/download/v{version}/rover-v{version}-aarch64-apple-darwin.tar.gz",
        "exec_compatible_with": [
            "@platforms//cpu:arm64",
            "@platforms//os:macos",
        ],
        "target_compatible_with": [
            "@platforms//cpu:arm64",
            "@platforms//os:macos",
        ]
    },
    "darwin_x86_64": {
        "url": "https://github.com/apollographql/rover/releases/download/v{version}/rover-v{version}-x86_64-apple-darwin.tar.gz",
        "exec_compatible_with": [
            "@platforms//os:macos",
            "@platforms//cpu:x86_64"
        ],
        "target_compatible_with": [
            "@platforms//os:macos",
            "@platforms//cpu:x86_64"
        ]
    },
    "linux_x86_64": {
        "url": "https://github.com/apollographql/rover/releases/download/v{version}/rover-v{version}-x86_64-unknown-linux-gnu.tar.gz",
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
