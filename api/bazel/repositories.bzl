BAZEL_SKYLIB_RELEASE = "0.5.0"
BAZEL_SKYLIB_SHA = "b5f6abe419da897b7901f90cbab08af958b97a8f3575b0d3dd062ac7ce78541f"

GOOGLEAPIS_GIT_SHA = "d642131a6e6582fc226caf9893cb7fe7885b3411"  # May 23, 2018
GOOGLEAPIS_SHA = "16f5b2e8bf1e747a32f9a62e211f8f33c94645492e9bbd72458061d9a9de1f63"

GOGOPROTO_GIT_SHA = "1adfc126b41513cc696b209667c8656ea7aac67c"  # v1.0.0
GOGOPROTO_SHA = "c84230a4ec87e1bbb3283d6f5bdd0da7e8f43b2784dec6ab37488f130bdafe37"

PROMETHEUS_GIT_SHA = "99fa1f4be8e564e8a6b613da7fa6f46c9edafc6c"  # Nov 17, 2017
PROMETHEUS_SHA = "783bdaf8ee0464b35ec0c8704871e1e72afa0005c3f3587f65d9d6694bf3911b"

OPENCENSUS_GIT_SHA = "ab82e5fdec8267dc2a726544b10af97675970847"  # May 23, 2018
OPENCENSUS_SHA = "1950f844d9f338ba731897a9bb526f9074c0487b3f274ce2ec3b4feaf0bef7e2"

PGV_GIT_SHA = "30da78c4bcdd477b3c24d13e43cf39361ae3859f"  # Sep 27, 2018
PGV_SHA = "2bc9a34b1c485e73540dc5093d6715ef437294020fa6580f21306aa5e884f511"

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

def api_dependencies():
    native.http_archive(
        name = "bazel_skylib",
        url = "https://github.com/bazelbuild/bazel-skylib/archive/" + BAZEL_SKYLIB_RELEASE + ".tar.gz",
        sha256 = BAZEL_SKYLIB_SHA,
        strip_prefix = "bazel-skylib-" + BAZEL_SKYLIB_RELEASE,
    )
    native.http_archive(
        name = "com_lyft_protoc_gen_validate",
        url = "https://github.com/lyft/protoc-gen-validate/archive/" + PGV_GIT_SHA + ".tar.gz",
        sha256 = PGV_SHA,
        strip_prefix = "protoc-gen-validate-" + PGV_GIT_SHA,
    )
    native.new_http_archive(
        name = "googleapis",
        strip_prefix = "googleapis-" + GOOGLEAPIS_GIT_SHA,
        url = "https://github.com/googleapis/googleapis/archive/" + GOOGLEAPIS_GIT_SHA + ".tar.gz",
        # TODO(dio): Consider writing a Skylark macro for importing Google API proto.
        sha256 = GOOGLEAPIS_SHA,
        build_file_content = """
load("@com_google_protobuf//:protobuf.bzl", "cc_proto_library", "py_proto_library")
load("@io_bazel_rules_go//proto:def.bzl", "go_proto_library")

filegroup(
    name = "api_httpbody_protos_src",
    srcs = [
        "google/api/httpbody.proto",
    ],
    visibility = ["//visibility:public"],
)

proto_library(
    name = "api_httpbody_protos_proto",
    srcs = [":api_httpbody_protos_src"],
    deps = ["@com_google_protobuf//:descriptor_proto"],
    visibility = ["//visibility:public"],
)

cc_proto_library(
    name = "api_httpbody_protos",
    srcs = [
        "google/api/httpbody.proto",
    ],
    default_runtime = "@com_google_protobuf//:protobuf",
    protoc = "@com_google_protobuf//:protoc",
    deps = ["@com_google_protobuf//:cc_wkt_protos"],
    visibility = ["//visibility:public"],
)

py_proto_library(
    name = "api_httpbody_protos_py",
    srcs = [
        "google/api/httpbody.proto",
    ],
    include = ".",
    default_runtime = "@com_google_protobuf//:protobuf_python",
    protoc = "@com_google_protobuf//:protoc",
    visibility = ["//visibility:public"],
    deps = ["@com_google_protobuf//:protobuf_python"],
)

go_proto_library(
    name = "api_httpbody_go_proto",
    importpath = "google.golang.org/genproto/googleapis/api/httpbody",
    proto = ":api_httpbody_protos_proto",
    visibility = ["//visibility:public"],
    deps = [
      ":descriptor_go_proto",
    ],
)

filegroup(
    name = "http_api_protos_src",
    srcs = [
        "google/api/annotations.proto",
        "google/api/http.proto",
    ],
    visibility = ["//visibility:public"],
)

go_proto_library(
    name = "descriptor_go_proto",
    importpath = "github.com/golang/protobuf/protoc-gen-go/descriptor",
    proto = "@com_google_protobuf//:descriptor_proto",
    visibility = ["//visibility:public"],
)

proto_library(
    name = "http_api_protos_proto",
    srcs = [":http_api_protos_src"],
    deps = ["@com_google_protobuf//:descriptor_proto"],
    visibility = ["//visibility:public"],
)

cc_proto_library(
    name = "http_api_protos",
    srcs = [
        "google/api/annotations.proto",
        "google/api/http.proto",
    ],
    default_runtime = "@com_google_protobuf//:protobuf",
    protoc = "@com_google_protobuf//:protoc",
    deps = ["@com_google_protobuf//:cc_wkt_protos"],
    visibility = ["//visibility:public"],
)

py_proto_library(
    name = "http_api_protos_py",
    srcs = [
        "google/api/annotations.proto",
        "google/api/http.proto",
    ],
    include = ".",
    default_runtime = "@com_google_protobuf//:protobuf_python",
    protoc = "@com_google_protobuf//:protoc",
    visibility = ["//visibility:public"],
    deps = ["@com_google_protobuf//:protobuf_python"],
)

go_proto_library(
    name = "http_api_go_proto",
    importpath = "google.golang.org/genproto/googleapis/api/annotations",
    proto = ":http_api_protos_proto",
    visibility = ["//visibility:public"],
    deps = [
      ":descriptor_go_proto",
    ],
)

filegroup(
     name = "rpc_status_protos_src",
     srcs = [
         "google/rpc/status.proto",
     ],
     visibility = ["//visibility:public"],
)

proto_library(
     name = "rpc_status_protos_lib",
     srcs = [":rpc_status_protos_src"],
     deps = ["@com_google_protobuf//:any_proto"],
     visibility = ["//visibility:public"],
)

cc_proto_library(
     name = "rpc_status_protos",
     srcs = ["google/rpc/status.proto"],
     default_runtime = "@com_google_protobuf//:protobuf",
     protoc = "@com_google_protobuf//:protoc",
     deps = [
         "@com_google_protobuf//:cc_wkt_protos"
     ],
     visibility = ["//visibility:public"],
)

go_proto_library(
    name = "rpc_status_go_proto",
    importpath = "google.golang.org/genproto/googleapis/rpc/status",
    proto = ":rpc_status_protos_lib",
    visibility = ["//visibility:public"],
    deps = [
      "@com_github_golang_protobuf//ptypes/any:go_default_library",
    ],
)

py_proto_library(
     name = "rpc_status_protos_py",
     srcs = [
         "google/rpc/status.proto",
     ],
     include = ".",
     default_runtime = "@com_google_protobuf//:protobuf_python",
     protoc = "@com_google_protobuf//:protoc",
     visibility = ["//visibility:public"],
     deps = ["@com_google_protobuf//:protobuf_python"],
)
""",
    )

    native.new_http_archive(
        name = "com_github_gogo_protobuf",
        strip_prefix = "protobuf-" + GOGOPROTO_GIT_SHA,
        url = "https://github.com/gogo/protobuf/archive/" + GOGOPROTO_GIT_SHA + ".tar.gz",
        sha256 = GOGOPROTO_SHA,
        build_file_content = """
load("@com_google_protobuf//:protobuf.bzl", "cc_proto_library", "py_proto_library")
load("@io_bazel_rules_go//proto:def.bzl", "go_proto_library")

proto_library(
    name = "gogo_proto",
    srcs = [
        "gogoproto/gogo.proto",
    ],
    deps = [
        "@com_google_protobuf//:descriptor_proto",
    ],
    visibility = ["//visibility:public"],
)

go_proto_library(
    name = "descriptor_go_proto",
    importpath = "github.com/golang/protobuf/protoc-gen-go/descriptor",
    proto = "@com_google_protobuf//:descriptor_proto",
    visibility = ["//visibility:public"],
)

cc_proto_library(
    name = "gogo_proto_cc",
    srcs = [
        "gogoproto/gogo.proto",
    ],
    default_runtime = "@com_google_protobuf//:protobuf",
    protoc = "@com_google_protobuf//:protoc",
    deps = ["@com_google_protobuf//:cc_wkt_protos"],
    visibility = ["//visibility:public"],
)

go_proto_library(
    name = "gogo_proto_go",
    importpath = "gogoproto",
    proto = ":gogo_proto",
    visibility = ["//visibility:public"],
    deps = [
        ":descriptor_go_proto",
    ],
)

py_proto_library(
    name = "gogo_proto_py",
    srcs = [
        "gogoproto/gogo.proto",
    ],
    default_runtime = "@com_google_protobuf//:protobuf_python",
    protoc = "@com_google_protobuf//:protoc",
    visibility = ["//visibility:public"],
    deps = ["@com_google_protobuf//:protobuf_python"],
)
        """,
    )

    native.new_http_archive(
        name = "prometheus_metrics_model",
        strip_prefix = "client_model-" + PROMETHEUS_GIT_SHA,
        url = "https://github.com/prometheus/client_model/archive/" + PROMETHEUS_GIT_SHA + ".tar.gz",
        sha256 = PROMETHEUS_SHA,
        build_file_content = """
load("@envoy_api//bazel:api_build_system.bzl", "api_proto_library")
load("@io_bazel_rules_go//proto:def.bzl", "go_proto_library")

api_proto_library(
    name = "client_model",
    srcs = [
        "metrics.proto",
    ],
    visibility = ["//visibility:public"],
)

go_proto_library(
    name = "client_model_go_proto",
    importpath = "client_model",
    proto = ":client_model",
    visibility = ["//visibility:public"],
)
        """,
    )

    native.new_http_archive(
        name = "io_opencensus_trace",
        strip_prefix = "opencensus-proto-" + OPENCENSUS_GIT_SHA + "/opencensus/proto/trace",
        url = "https://github.com/census-instrumentation/opencensus-proto/archive/" + OPENCENSUS_GIT_SHA + ".tar.gz",
        sha256 = OPENCENSUS_SHA,
        build_file_content = """
load("@envoy_api//bazel:api_build_system.bzl", "api_proto_library")
load("@io_bazel_rules_go//proto:def.bzl", "go_proto_library")

api_proto_library(
    name = "trace_model",
    srcs = [
        "trace.proto",
    ],
    visibility = ["//visibility:public"],
)

go_proto_library(
    name = "trace_model_go_proto",
    importpath = "trace_model",
    proto = ":trace_model",
    visibility = ["//visibility:public"],
)
        """,
    )
