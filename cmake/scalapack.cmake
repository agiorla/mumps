# Finds Scalapack, tests, and if not found or broken, autobuild scalapack

if(autobuild)
  find_package(SCALAPACK COMPONENTS ${arith})
else()
  find_package(SCALAPACK REQUIRED COMPONENTS ${arith})
endif()

if(NOT SCALAPACK_FOUND)
  set(scalapack_external true CACHE BOOL "autobuild ScaLapack")

  include(FetchContent)

  FetchContent_Declare(scalapack_proj
    GIT_REPOSITORY https://github.com/scivision/scalapack.git
    GIT_TAG v2.1.0.10
    CMAKE_ARGS "-Darith=${arith}"
  )

  FetchContent_MakeAvailable(scalapack_proj)
endif()

target_link_libraries(SCALAPACK::SCALAPACK INTERFACE LAPACK::LAPACK)
