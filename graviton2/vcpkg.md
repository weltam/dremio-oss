
The package abseil provides CMake targets:

    find_package(absl CONFIG REQUIRED)
    # Note: 124 target(s) were omitted.
    target_link_libraries(main PRIVATE absl::any absl::base absl::bits absl::city)

The package zlib is compatible with built-in CMake targets:

    find_package(ZLIB REQUIRED)
    target_link_libraries(main PRIVATE ZLIB::ZLIB)

The package openssl is compatible with built-in CMake targets:

    find_package(OpenSSL REQUIRED)
    target_link_libraries(main PRIVATE OpenSSL::SSL OpenSSL::Crypto)

The package curl provides CMake targets:

    find_package(CURL CONFIG REQUIRED)
    target_link_libraries(main PRIVATE CURL::libcurl)

The package aws-sdk-cpp:arm64-linux provides CMake targets:

    find_package(AWSSDK CONFIG COMPONENTS core dynamodb kinesis s3 REQUIRED)
    target_include_directories(main PRIVATE ${AWSSDK_INCLUDE_DIRS})
    target_link_libraries(main PRIVATE ${AWSSDK_LIBRARIES})

The package benchmark provides CMake targets:

    find_package(benchmark CONFIG REQUIRED)
    target_link_libraries(main PRIVATE benchmark::benchmark benchmark::benchmark_main)

The package bzip2 is compatible with built-in CMake targets:

    find_package(BZip2 REQUIRED)
    target_link_libraries(main PRIVATE BZip2::BZip2)

The package zstd provides CMake targets:

    find_package(zstd CONFIG REQUIRED)
    target_link_libraries(main PRIVATE zstd::libzstd_static)

The package brotli provides CMake targets:

    find_package(unofficial-brotli CONFIG REQUIRED)
    target_link_libraries(main PRIVATE unofficial::brotli::brotlidec-static unofficial::brotli::brotlienc-static unofficial::brotli::brotlicommon-static)

The package c-ares provides CMake targets:

    find_package(c-ares CONFIG REQUIRED)
    target_link_libraries(main PRIVATE c-ares::cares c-ares::cares_shared c-ares::cares_static)

The package flatbuffers provides CMake targets:

    find_package(Flatbuffers CONFIG REQUIRED)
    target_link_libraries(main PRIVATE flatbuffers::flatbuffers)

The package gflags provides CMake targets:

    find_package(gflags CONFIG REQUIRED)
    target_link_libraries(main PRIVATE gflags::gflags)

The package glog provides CMake targets:

    find_package(glog CONFIG REQUIRED)
    target_link_libraries(main PRIVATE glog::glog)

The package re2 provides CMake targets:

    find_package(re2 CONFIG REQUIRED)
    target_link_libraries(main PRIVATE re2::re2)

The package protobuf provides CMake targets:

    find_package(protobuf CONFIG REQUIRED)
    target_link_libraries(main PRIVATE protobuf::libprotoc protobuf::libprotobuf protobuf::libprotobuf-lite)

The package grpc provides CMake targets:

    find_package(gRPC CONFIG REQUIRED)
    # Note: 8 target(s) were omitted.
    target_link_libraries(main PRIVATE gRPC::gpr gRPC::upb gRPC::grpc gRPC::grpc++)

    find_package(modules CONFIG REQUIRED)
    target_link_libraries(main PRIVATE re2::re2 c-ares::cares)

The package gtest provides CMake targets:

    find_package(GTest CONFIG REQUIRED)
    target_link_libraries(main PRIVATE GTest::gmock GTest::gtest GTest::gmock_main GTest::gtest_main)

The package lz4 provides CMake targets:

    find_package(lz4 CONFIG REQUIRED)
    target_link_libraries(main PRIVATE lz4::lz4)

The package snappy provides CMake targets:

    find_package(Snappy CONFIG REQUIRED)
    target_link_libraries(main PRIVATE Snappy::snappy)

The package orc does not provide CMake targets:

    find_package(protobuf CONFIG REQUIRED)
    find_package(ZLIB REQUIRED)
    find_package(Snappy CONFIG REQUIRED)

    find_library(LZ4_LIBRARY NAMES lz4d lz4)
    find_library(ZSTD_LIBRARY NAMES zstd)
    find_library(ORC_LIBRARY NAMES orc)

    target_link_libraries(main PRIVATE ${ORC_LIBRARY} protobuf::libprotoc protobuf::libprotobuf Snappy::snappy ${LZ4_LIBRARY} ${ZSTD_LIBRARY} ZLIB::ZLIB)

The package rapidjson provides CMake targets:

    find_package(RapidJSON CONFIG REQUIRED)
    target_link_libraries(main PRIVATE rapidjson)

The package thrift provides CMake targets:

    find_package(Thrift CONFIG REQUIRED)
    target_link_libraries(main PRIVATE thrift::thrift thriftz::thriftz thriftnb::thriftnb)

The package utf8proc provides CMake targets:

    find_package(unofficial-utf8proc CONFIG REQUIRED)
    target_link_libraries(main PRIVATE utf8proc)