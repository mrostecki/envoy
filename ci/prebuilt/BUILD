licenses(["notice"])  # Apache 2

package(default_visibility = ["//visibility:public"])

cc_library(
    name = "ares",
    hdrs = glob(["thirdparty_build/include/ares*.h"]),
    copts = [],
    linkopts = ["-lcares"],
)

cc_library(
    name = "benchmark",
    hdrs = glob(["thirdparty_build/include/benchmark/benchmark.h"]),
    copts = [],
    linkopts = [],
)

cc_library(
    name = "event",
    hdrs = glob(["thirdparty_build/include/event2/**/*.h"]),
    copts = ["-pthread"],
    linkopts = ["-levent_pthreads", "-levent"],
)

cc_library(
    name = "luajit",
    hdrs = glob(["thirdparty_build/include/luajit-5_1-2.1/*"]),
    # TODO(mattklein123): We should strip luajit-2.0 here for consumers. However, if we do that
    # the headers get included using -I vs. -isystem which then causes old-style-cast warnings.
    copts = ["-I/usr/include/luajit-5_1-2.1"],
    linkopts = ["-lluajit-5.1"],
)

cc_library(
    name = "nghttp2",
    hdrs = glob(["thirdparty_build/include/nghttp2/**/*.h"]),
    copts = [],
    linkopts = ["-lnghttp2"],
)

cc_library(
    name = "tcmalloc_and_profiler",
    hdrs = glob(["thirdparty_build/include/gperftools/**/*.h"]),
    copts = [],
    linkopts = ["-ltcmalloc", "-lprofiler"],
)

cc_library(
    name = "yaml_cpp",
    hdrs = glob(["thirdparty_build/include/yaml-cpp/**/*.h"]),
    copts = [],
    linkopts = ["-lyaml-cpp"],
)

cc_library(
    name = "zlib",
    hdrs = glob([
        "thirdparty_build/include/zconf.h",
        "thirdparty_build/include/zlib.h",
    ]),
    copts = [],
    linkopts = ["-lz"],
)

cc_library(
    name = "ssl",
    hdrs = glob([
        "thirdparty_build/include/boringssl/**/*.h",
    ]),
    copts = ["-I/usr/include/boringssl"],
    linkopts = ["-lboringssl_crypto", "-lboringssl_decrepit", "-lboringssl_ssl"],
)

cc_library(
    name = "jwt_verify_lib",
    hdrs = glob(["thirdparty_build/include/jwt_verify_lib/**/*.h"]),
    copts = ["-I/usr/include/jwt_verify_lib"],
    linkopts = ["-ljwt_verify_lib"],
)

cc_library(
    name = "openssl",
    hdrs = glob(["thirdparty_build/include/openssl/**/+.h"]),
    copts = ["-DOPENSSL_LOAD_CONF"],
    linkopts = ["-lssl", "-lcrypto"],
)

cc_library(
    name = "abseil_any",
    hdrs = glob(["thirdparty_build/include/absl/**/*.h"]),
    copts = ["-I/usr/include/absl"],
    linkopts = [
        "-labsl_bad_any_cast",
        "-labsl_bad_optional_access",
        "-labsl_optional",
        "-labsl_variant"
    ],
)

cc_library(
    name = "abseil_base",
    hdrs = glob(["thirdparty_build/include/absl/**/*.h"]),
    copts = ["-I/usr/include/absl"],
    linkopts = [],
)

cc_library(
    name = "abseil_strings",
    hdrs = glob(["thirdparty_build/include/absl/**/*.h"]),
    copts = ["-I/usr/include/absl"],
    linkopts = ["-labsl_strings"],
)

cc_library(
    name = "abseil_int128",
    hdrs = glob(["thirdparty_build/include/absl/**/*.h"]),
    copts = ["-I/usr/include/absl"],
    linkopts = ["-labsl_int128"],
)

cc_library(
    name = "abseil_optional",
    hdrs = glob(["thirdparty_build/include/absl/**/*.h"]),
    copts = ["-I/usr/include/absl"],
    linkopts = ["-labsl_optional"],
)

cc_library(
    name = "abseil_synchronization",
    hdrs = glob(["thirdparty_build/include/absl/**/*.h"]),
    copts = ["-I/usr/include/absl"],
    linkopts = ["-labsl_synchronization"],
)

cc_library(
    name = "abseil_symbolize",
    hdrs = glob(["thirdparty_build/include/absl/**/*.h"]),
    copts = ["-I/usr/include/absl"],
    linkopts = ["-labsl_symbolize"],
)

cc_library(
    name = "abseil_time",
    hdrs = glob(["thirdparty_build/include/absl/**/*.h"]),
    copts = ["-I/usr/include/absl"],
    linkopts = ["-labsl_time"],
)

cc_library(
    name = "grpc_transcoding",
    hdrs = glob(["thirdparty_build/include/grpc_transcoding/**/*.h"]),
    copts = ["-I/usr/include/grpc_transcoding"],
    linkopts = [
        "-lhttp_template",
        "-ljson_request_translator",
        "-lmessage_reader",
        "-lmessage_stream",
        "-lpath_matcher",
        "-lprefix_writer",
        "-lrequest_message_translator",
        "-lrequest_stream_translator",
        "-lrequest_weaver",
        "-lresponse_to_json_translator",
        "-ltype_helper",
    ],
)
