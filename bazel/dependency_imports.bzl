load("@rules_foreign_cc//:workspace_definitions.bzl", "rules_foreign_cc_dependencies")
load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")

# go version for rules_go
GO_VERSION = "1.12.5"

def envoy_dependency_imports(go_version = GO_VERSION):
    rules_foreign_cc_dependencies()
    go_rules_dependencies()
    go_register_toolchains(go_version)
