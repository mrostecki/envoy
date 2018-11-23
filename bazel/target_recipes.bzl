# These should reflect //ci/prebuilt/BUILD declared targets. This a map from
# target in //ci/prebuilt/BUILD to the underlying build recipe in
# ci/build_container/build_recipes.
TARGET_RECIPES = {
    "ares": "cares",
    "benchmark": "benchmark",
    "event": "libevent",
    "tcmalloc_and_profiler": "gperftools",
    "luajit": "luajit",
    "nghttp2": "nghttp2",
    "yaml_cpp": "yaml-cpp",
    "zlib": "zlib",
    "ssl": "ssl",
    "jwt_verify_lib": "jwt_verify_lib",
    "openssl": "openssl",
    "abseil_any": "abseil_any",
    "abseil_base": "abseil_base",
    "abseil_strings": "abseil_strings",
    "abseil_int128": "abseil_int128",
    "abseil_optional": "abseil_optional",
    "abseil_synchronization": "abseil_synchronization",
    "abseil_symbolize": "abseil_symbolize",
    "abseil_time": "abseil_time",
    "grpc_transcoding": "grpc_transcoding",
}
