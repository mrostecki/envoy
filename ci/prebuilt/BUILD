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
