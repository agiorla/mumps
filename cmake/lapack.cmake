# Finds Lapack, tests, and if not found or broken, autobuild Lapack
include(FetchContent)

if(autobuild)
  find_package(LAPACK)
else()
  find_package(LAPACK REQUIRED)
endif()

if(NOT LAPACK_FOUND)
  set(lapack_external true CACHE BOOL "autobuild Lapack")

  FetchContent_Declare(LAPACK
    GIT_REPOSITORY ${lapack_url}
    GIT_TAG ${lapack_tag}
    CMAKE_ARGS "-Darith=${arith}")

  FetchContent_MakeAvailable(LAPACK)

  add_library(LAPACK::LAPACK ALIAS lapack)
  add_library(BLAS::BLAS ALIAS blas)
endif()
