REPOSITORY_LOCATIONS = dict(
    bazel_gazelle = dict(
        sha256 = "3c681998538231a2d24d0c07ed5a7658cb72bfb5fd4bf9911157c0e9ac6a2687",
        urls = ["https://github.com/bazelbuild/bazel-gazelle/releases/download/0.17.0/bazel-gazelle-0.17.0.tar.gz"],
    ),
    boringssl = dict(
        # Use commits from branch "chromium-stable-with-bazel"
        sha256 = "448773376d063b1e9a19e4fd41002d1a31a968a13be20b3b66ecd4aab9cf14a8",
        strip_prefix = "boringssl-e534d74f5732e1aeebd514f05271d089c530c2f9",
        # chromium-75.0.3770.80
        urls = ["https://github.com/google/boringssl/archive/e534d74f5732e1aeebd514f05271d089c530c2f9.tar.gz"],
    ),
    boringssl_fips = dict(
        sha256 = "b12ad676ee533824f698741bd127f6fbc82c46344398a6d78d25e62c6c418c73",
        # fips-20180730
        urls = ["https://commondatastorage.googleapis.com/chromium-boringssl-docs/fips/boringssl-66005f41fbc3529ffe8d007708756720529da20d.tar.xz"],
    ),
    com_google_absl = dict(
        sha256 = "7ddf863ddced6fa5bf7304103f9c7aa619c20a2fcf84475512c8d3834b9d14fa",
        strip_prefix = "abseil-cpp-61c9bf3e3e1c28a4aa6d7f1be4b37fd473bb5529",
        # 2019-06-05
        urls = ["https://github.com/abseil/abseil-cpp/archive/61c9bf3e3e1c28a4aa6d7f1be4b37fd473bb5529.tar.gz"],
    ),
    com_github_apache_thrift = dict(
        sha256 = "7d59ac4fdcb2c58037ebd4a9da5f9a49e3e034bf75b3f26d9fe48ba3d8806e6b",
        strip_prefix = "thrift-0.11.0",
        urls = ["https://files.pythonhosted.org/packages/c6/b4/510617906f8e0c5660e7d96fbc5585113f83ad547a3989b80297ac72a74c/thrift-0.11.0.tar.gz"],
    ),
    com_github_c_ares_c_ares = dict(
        sha256 = "bbaab13d6ad399a278d476f533e4d88a7ec7d729507348bb9c2e3b207ba4c606",
        strip_prefix = "c-ares-d7e070e7283f822b1d2787903cce3615536c5610",
        # 2019-06-19
        # 27 new commits from release-1.15.0. Upgrade for commit 7d3591ee8a1a63e7748e68e6d880bd1763a32885 "getaddrinfo enhancements" and follow up fixes.
        # Use getaddrinfo to query DNS record and TTL.
        # TODO(crazyxy): Update to release-1.16.0 when it is released.
        urls = ["https://github.com/c-ares/c-ares/archive/d7e070e7283f822b1d2787903cce3615536c5610.tar.gz"],
    ),
    com_github_circonus_labs_libcircllhist = dict(
        sha256 = "8165aa25e529d7d4b9ae849d3bf30371255a99d6db0421516abcff23214cdc2c",
        strip_prefix = "libcircllhist-63a16dd6f2fc7bc841bb17ff92be8318df60e2e1",
        # 2019-02-11
        urls = ["https://github.com/circonus-labs/libcircllhist/archive/63a16dd6f2fc7bc841bb17ff92be8318df60e2e1.tar.gz"],
    ),
    com_github_cyan4973_xxhash = dict(
        sha256 = "b34792646d5e19964bb7bba24f06cb13aecaac623ab91a54da08aa19d3686d7e",
        strip_prefix = "xxHash-0.7.0",
        urls = ["https://github.com/Cyan4973/xxHash/archive/v0.7.0.tar.gz"],
    ),
    com_github_envoyproxy_sqlparser = dict(
        sha256 = "425dfee0c4fe9aff8acf2365cde3dd2ba7fb878d2ba37562d33920e34c40c05e",
        strip_prefix = "sql-parser-5f50c68bdf5f107692bb027d1c568f67597f4d7f",
        urls = ["https://github.com/envoyproxy/sql-parser/archive/5f50c68bdf5f107692bb027d1c568f67597f4d7f.tar.gz"],
    ),
    com_github_eile_tclap = dict(
        sha256 = "f0ede0721dddbb5eba3a47385a6e8681b14f155e1129dd39d1a959411935098f",
        strip_prefix = "tclap-tclap-1-2-1-release-final",
        urls = ["https://github.com/eile/tclap/archive/tclap-1-2-1-release-final.tar.gz"],
    ),
    com_github_fmtlib_fmt = dict(
        sha256 = "4c0741e10183f75d7d6f730b8708a99b329b2f942dad5a9da3385ab92bb4a15c",
        strip_prefix = "fmt-5.3.0",
        urls = ["https://github.com/fmtlib/fmt/releases/download/5.3.0/fmt-5.3.0.zip"],
    ),
    com_github_gabime_spdlog = dict(
        sha256 = "160845266e94db1d4922ef755637f6901266731c4cb3b30b45bf41efa0e6ab70",
        strip_prefix = "spdlog-1.3.1",
        urls = ["https://github.com/gabime/spdlog/archive/v1.3.1.tar.gz"],
    ),
    com_github_gcovr_gcovr = dict(
        sha256 = "1c52a71f245adfe1b45e30fbe5015337fe66546f17f40038b3969b7b42acceed",
        strip_prefix = "gcovr-3.4",
        urls = ["https://github.com/gcovr/gcovr/archive/3.4.tar.gz"],
    ),
    com_github_google_libprotobuf_mutator = dict(
        sha256 = "97b3639630040f41c45f45838ab00b78909e6b4cb69c8028e01302bea5b79495",
        strip_prefix = "libprotobuf-mutator-c3d2faf04a1070b0b852b0efdef81e1a81ba925e",
        # 2018-03-06
        urls = ["https://github.com/google/libprotobuf-mutator/archive/c3d2faf04a1070b0b852b0efdef81e1a81ba925e.tar.gz"],
    ),
    com_github_gperftools_gperftools = dict(
        # TODO(cmluciano): Bump to release 2.8
        # This sha is specifically chosen to fix ppc64le builds that require inclusion
        # of asm/ptrace.h
        sha256 = "18574813a062eee487bc1b761e8024a346075a7cb93da19607af362dc09565ef",
        strip_prefix = "gperftools-fc00474ddc21fff618fc3f009b46590e241e425e",
        urls = ["https://github.com/gperftools/gperftools/archive/fc00474ddc21fff618fc3f009b46590e241e425e.tar.gz"],
    ),
    com_github_grpc_grpc = dict(
        sha256 = "f56ced18740895b943418fa29575a65cc2396ccfa3159fa40d318ef5f59471f9",
        strip_prefix = "grpc-1.23.0",
        urls = ["https://github.com/grpc/grpc/archive/v1.23.0.tar.gz"],
    ),
    com_github_luajit_luajit = dict(
        sha256 = "409f7fe570d3c16558e594421c47bdd130238323c9d6fd6c83dedd2aaeb082a8",
        strip_prefix = "LuaJIT-2.1.0-beta3",
        urls = ["https://github.com/LuaJIT/LuaJIT/archive/v2.1.0-beta3.tar.gz"],
    ),
    com_github_nanopb_nanopb = dict(
        sha256 = "5fb4dab0b7f6a239908407fe07c9d03877cd0502abb637e38c41091cb9c1d438",
        strip_prefix = "nanopb-0.3.9.3",
        urls = ["https://github.com/nanopb/nanopb/archive/0.3.9.3.tar.gz"],
    ),
    com_github_nghttp2_nghttp2 = dict(
        sha256 = "fe9a75ec44e3a2e8f7f0cb83ad91e663bbc4c5085baf37b57ee2610846d7cf5d",
        strip_prefix = "nghttp2-1.38.0",
        urls = ["https://github.com/nghttp2/nghttp2/releases/download/v1.38.0/nghttp2-1.38.0.tar.gz"],
    ),
    io_opentracing_cpp = dict(
        sha256 = "015c4187f7a6426a2b5196f0ccd982aa87f010cf61f507ae3ce5c90523f92301",
        strip_prefix = "opentracing-cpp-1.5.1",
        urls = ["https://github.com/opentracing/opentracing-cpp/archive/v1.5.1.tar.gz"],
    ),
    com_lightstep_tracer_cpp = dict(
        sha256 = "defbf471facfebde6523ca1177529b63784893662d4ef2c60db074be8aef0634",
        strip_prefix = "lightstep-tracer-cpp-0.8.0",
        urls = ["https://github.com/lightstep/lightstep-tracer-cpp/archive/v0.8.0.tar.gz"],
    ),
    com_github_datadog_dd_opentracing_cpp = dict(
        sha256 = "a3d1c03e7af570fa64c01df259e6e9bb78637a6bd9c65c6bf7e8703e466dc22f",
        strip_prefix = "dd-opentracing-cpp-0.4.2",
        urls = ["https://github.com/DataDog/dd-opentracing-cpp/archive/v0.4.2.tar.gz"],
    ),
    com_github_google_benchmark = dict(
        sha256 = "3c6a165b6ecc948967a1ead710d4a181d7b0fbcaa183ef7ea84604994966221a",
        strip_prefix = "benchmark-1.5.0",
        urls = ["https://github.com/google/benchmark/archive/v1.5.0.tar.gz"],
    ),
    com_github_libevent_libevent = dict(
        sha256 = "549d34065eb2485dfad6c8de638caaa6616ed130eec36dd978f73b6bdd5af113",
        # This SHA includes the new "prepare" and "check" watchers, used for event loop performance
        # stats (see https://github.com/libevent/libevent/pull/793) and the fix for a race condition
        # in the watchers (see https://github.com/libevent/libevent/pull/802).
        # This also includes the fixes for https://github.com/libevent/libevent/issues/806
        # and https://github.com/lyft/envoy-mobile/issues/215.
        # TODO(mergeconflict): Update to v2.2 when it is released.
        strip_prefix = "libevent-0d7d85c2083f7a4c9efe01c061486f332b576d28",
        # 2019-07-02
        urls = ["https://github.com/libevent/libevent/archive/0d7d85c2083f7a4c9efe01c061486f332b576d28.tar.gz"],
    ),
    net_zlib = dict(
        # TODO(moderation): revert to com_github_madler_zlib name pending resolution of workaround
        # in rules_go https://github.com/bazelbuild/rules_go/blob/master/go/private/repositories.bzl#L87-L101
        # for issue in protocolbuffers/protobuf https://github.com/protocolbuffers/protobuf/issues/5472
        sha256 = "629380c90a77b964d896ed37163f5c3a34f6e6d897311f1df2a7016355c45eff",
        strip_prefix = "zlib-1.2.11",
        urls = ["https://github.com/madler/zlib/archive/v1.2.11.tar.gz"],
    ),
    com_github_jbeder_yaml_cpp = dict(
        sha256 = "53dcffd55f3433b379fcc694f45c54898711c0e29159a7bd02e82a3e0253bac3",
        strip_prefix = "yaml-cpp-0f9a586ca1dc29c2ecb8dd715a315b93e3f40f79",
        urls = ["https://github.com/jbeder/yaml-cpp/archive/0f9a586ca1dc29c2ecb8dd715a315b93e3f40f79.tar.gz"],
    ),
    com_github_msgpack_msgpack_c = dict(
        sha256 = "bda49f996a73d2c6080ff0523e7b535917cd28c8a79c3a5da54fc29332d61d1e",
        strip_prefix = "msgpack-c-cpp-3.1.1",
        urls = ["https://github.com/msgpack/msgpack-c/archive/cpp-3.1.1.tar.gz"],
    ),
    com_github_google_jwt_verify = dict(
        sha256 = "8ab9a0b3f8b7eab5f1cd059920e81fdc138cd4ee657c1412af891652929885c5",
        strip_prefix = "jwt_verify_lib-6356535ae83a3f1820b6b06dae80cd6a0a03e7f2",
        # 2019-07-01
        urls = ["https://github.com/google/jwt_verify_lib/archive/6356535ae83a3f1820b6b06dae80cd6a0a03e7f2.tar.gz"],
    ),
    com_github_nodejs_http_parser = dict(
        sha256 = "ef26268c54c8084d17654ba2ed5140bffeffd2a040a895ffb22a6cca3f6c613f",
        strip_prefix = "http-parser-2.9.0",
        urls = ["https://github.com/nodejs/http-parser/archive/v2.9.0.tar.gz"],
    ),
    com_github_pallets_jinja = dict(
        sha256 = "e9baab084b8d84b511c75aca98bba8585041dbe971d5476ee53d9c6eea1b58b3",
        strip_prefix = "jinja-2.10.1",
        urls = ["https://github.com/pallets/jinja/archive/2.10.1.tar.gz"],
    ),
    com_github_pallets_markupsafe = dict(
        sha256 = "222a10e3237d92a9cd45ed5ea882626bc72bc5e0264d3ed0f2c9129fa69fc167",
        strip_prefix = "markupsafe-1.1.1/src",
        urls = ["https://github.com/pallets/markupsafe/archive/1.1.1.tar.gz"],
    ),
    com_github_tencent_rapidjson = dict(
        sha256 = "bf7ced29704a1e696fbccf2a2b4ea068e7774fa37f6d7dd4039d0787f8bed98e",
        strip_prefix = "rapidjson-1.1.0",
        urls = ["https://github.com/Tencent/rapidjson/archive/v1.1.0.tar.gz"],
    ),
    com_github_twitter_common_lang = dict(
        sha256 = "56d1d266fd4767941d11c27061a57bc1266a3342e551bde3780f9e9eb5ad0ed1",
        strip_prefix = "twitter.common.lang-0.3.9/src",
        urls = ["https://files.pythonhosted.org/packages/08/bc/d6409a813a9dccd4920a6262eb6e5889e90381453a5f58938ba4cf1d9420/twitter.common.lang-0.3.9.tar.gz"],
    ),
    com_github_twitter_common_rpc = dict(
        sha256 = "0792b63fb2fb32d970c2e9a409d3d00633190a22eb185145fe3d9067fdaa4514",
        strip_prefix = "twitter.common.rpc-0.3.9/src",
        urls = ["https://files.pythonhosted.org/packages/be/97/f5f701b703d0f25fbf148992cd58d55b4d08d3db785aad209255ee67e2d0/twitter.common.rpc-0.3.9.tar.gz"],
    ),
    com_github_twitter_common_finagle_thrift = dict(
        sha256 = "1e3a57d11f94f58745e6b83348ecd4fa74194618704f45444a15bc391fde497a",
        strip_prefix = "twitter.common.finagle-thrift-0.3.9/src",
        urls = ["https://files.pythonhosted.org/packages/f9/e7/4f80d582578f8489226370762d2cf6bc9381175d1929eba1754e03f70708/twitter.common.finagle-thrift-0.3.9.tar.gz"],
    ),
    com_google_googletest = dict(
        sha256 = "cbd251a40485fddd44cdf641af6df2953d45695853af6d68aeb11c7efcde6771",
        strip_prefix = "googletest-d7003576dd133856432e2e07340f45926242cc3a",
        # TODO(akonradi): Switch this back to a released version later than 1.8.1 once there is
        # one available.
        urls = ["https://github.com/google/googletest/archive/d7003576dd133856432e2e07340f45926242cc3a.tar.gz"],
    ),
    com_google_protobuf = dict(
        sha256 = "3040a5b946d9df7aa89c0bf6981330bf92b7844fd90e71b61da0c721e421a421",
        strip_prefix = "protobuf-3.9.1",
        urls = ["https://github.com/protocolbuffers/protobuf/releases/download/v3.9.1/protobuf-all-3.9.1.tar.gz"],
    ),
    grpc_httpjson_transcoding = dict(
        sha256 = "dedd76b0169eb8c72e479529301a1d9b914a4ccb4d2b5ddb4ebe92d63a7b2152",
        strip_prefix = "grpc-httpjson-transcoding-64d6ac985360b624d8e95105701b64a3814794cd",
        # 2018-12-19
        urls = ["https://github.com/grpc-ecosystem/grpc-httpjson-transcoding/archive/64d6ac985360b624d8e95105701b64a3814794cd.tar.gz"],
    ),
    io_bazel_rules_go = dict(
        sha256 = "a82a352bffae6bee4e95f68a8d80a70e87f42c4741e6a448bec11998fcc82329",
        urls = ["https://github.com/bazelbuild/rules_go/releases/download/0.18.5/rules_go-0.18.5.tar.gz"],
    ),
    rules_foreign_cc = dict(
        sha256 = "980c1b74f5c18ea099889b0fb0479ee34b8a02845d3d302ecb16b15d73d624c8",
        strip_prefix = "rules_foreign_cc-a0dc109915cea85909bef586e2b2a9bbdc6c8ff5",
        # 2019-06-04
        urls = ["https://github.com/bazelbuild/rules_foreign_cc/archive/a0dc109915cea85909bef586e2b2a9bbdc6c8ff5.tar.gz"],
    ),
    rules_cc = dict(
        sha256 = "bb8320b0bc1d8d01dc8c8e8c50edced8553655c03776960c1287d03dfbcac3e5",
        strip_prefix = "rules_cc-401380cd2279b83da0dcb86ecbac04a04805405b",
        # 2019-08-09
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/rules_cc/archive/401380cd2279b83da0dcb86ecbac04a04805405b.tar.gz",
            "https://github.com/bazelbuild/rules_cc/archive/401380cd2279b83da0dcb86ecbac04a04805405b.tar.gz",
        ],
    ),
    rules_java = dict(
        sha256 = "4e2f33528a66e3a9909910eaa5a562fb22f5b422513cdc3816fd01fbb6e2d08d",
        strip_prefix = "rules_java-166a046a27e118d578127759b413ee0b06aca3cd",
        # 2019-08-07
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/rules_java/archive/166a046a27e118d578127759b413ee0b06aca3cd.tar.gz",
            "https://github.com/bazelbuild/rules_java/archive/166a046a27e118d578127759b413ee0b06aca3cd.tar.gz",
        ],
    ),
    rules_proto = dict(
        sha256 = "602e7161d9195e50246177e7c55b2f39950a9cf7366f74ed5f22fd45750cd208",
        strip_prefix = "rules_proto-97d8af4dc474595af3900dd85cb3a29ad28cc313",
        # 2019-08-02
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/rules_proto/archive/97d8af4dc474595af3900dd85cb3a29ad28cc313.tar.gz",
            "https://github.com/bazelbuild/rules_proto/archive/97d8af4dc474595af3900dd85cb3a29ad28cc313.tar.gz",
        ],
    ),
    six_archive = dict(
        sha256 = "105f8d68616f8248e24bf0e9372ef04d3cc10104f1980f54d57b2ce73a5ad56a",
        urls = ["https://pypi.python.org/packages/source/s/six/six-1.10.0.tar.gz#md5=34eed507548117b2ab523ab14b2f8b55"],
    ),
    # I'd love to name this `com_github_google_subpar`, but something in the Subpar
    # code assumes its repository name is just `subpar`.
    subpar = dict(
        sha256 = "b80297a1b8d38027a86836dbadc22f55dc3ecad56728175381aa6330705ac10f",
        strip_prefix = "subpar-2.0.0",
        urls = ["https://github.com/google/subpar/archive/2.0.0.tar.gz"],
    ),
    io_opencensus_cpp = dict(
        sha256 = "93a187065da4db8fdfd9f5c7b29f60c6d6830bb002590f14fd350d490234d134",
        strip_prefix = "opencensus-cpp-0.4.0",
        urls = ["https://github.com/census-instrumentation/opencensus-cpp/archive/v0.4.0.tar.gz"],
    ),
    com_github_curl = dict(
        sha256 = "821aeb78421375f70e55381c9ad2474bf279fc454b791b7e95fc83562951c690",
        strip_prefix = "curl-7.65.1",
        urls = ["https://github.com/curl/curl/releases/download/curl-7_65_1/curl-7.65.1.tar.gz"],
    ),
    com_googlesource_quiche = dict(
        # Static snapshot of https://quiche.googlesource.com/quiche/+archive/2a930469533c3b541443488a629fe25cd8ff53d0.tar.gz
        sha256 = "fcdebf54c89d839ffa7eefae166c8e4b551c765559db13ff15bff98047f344fb",
        urls = ["https://storage.googleapis.com/quiche-envoy-integration/2a930469533c3b541443488a629fe25cd8ff53d0.tar.gz"],
    ),
    upb = dict(
        sha256 = "61d0417abd60e65ed589c9deee7c124fe76a4106831f6ad39464e1525cef1454",
        strip_prefix = "upb-9effcbcb27f0a665f9f345030188c0b291e32482",
        urls = ["https://github.com/protocolbuffers/upb/archive/9effcbcb27f0a665f9f345030188c0b291e32482.tar.gz"],
    ),
    build_bazel_rules_apple = dict(
        sha256 = "bdc8e66e70b8a75da23b79f1f8c6207356df07d041d96d2189add7ee0780cf4e",
        strip_prefix = "rules_apple-b869b0d3868d78a1d4ffd866ccb304fb68aa12c3",
        urls = ["https://github.com/bazelbuild/rules_apple/archive/b869b0d3868d78a1d4ffd866ccb304fb68aa12c3.tar.gz"],
    ),
    build_bazel_apple_support = dict(
        sha256 = "140fa73e1c712900097aabdb846172ffa0a5e9523b87d6c564c13116a6180a62",
        strip_prefix = "apple_support-0.7.1",
        urls = ["https://github.com/bazelbuild/apple_support/archive/0.7.1.tar.gz"],
    ),
)
