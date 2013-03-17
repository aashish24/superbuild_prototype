# Set minimum version of cmake
#-----------------------------------------------------------------------------
cmake_minimum_required(VERSION 2.8.10)

# Project name
#-----------------------------------------------------------------------------
project(lanl)

# Include necessary modules
#-----------------------------------------------------------------------------
include(ExternalProject)
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/CMake")

# Setup ctest
include(CTest)
enable_testing()
mark_as_advanced(DART_TESTING_TIMEOUT)

# Find necessary packages
#-----------------------------------------------------------------------------
find_package(Git REQUIRED)

# Set lanl superbuild arguments
#-----------------------------------------------------------------------------

# Set superbuild build directory
set(lanl_cmake_dir "${CMAKE_CURRENT_SOURCE_DIR}/CMake")
set(lanl_superbuild_build_dir "${CMAKE_CURRENT_BINARY_DIR}/lanl_build")
set(lanl_superbuild_install_dir "${CMAKE_CURRENT_BINARY_DIR}/lanl_install")

# Set compiler flags
set(lanl_superbuild_compiler
  -DCMAKE_CXX_COMPILER:FILEPATH=${CMAKE_CXX_COMPILER}
  -DCMAKE_C_COMPILER:FILEPATH=${CMAKE_C_COMPILER}
  -DCMAKE_CXX_FLAGS:STRING=${CMAKE_CXX_FLAGS}
  -DCMAKE_CXX_FLAGS_DEBUG:STRING=${CMAKE_CXX_FLAGS_DEBUG}
  -DCMAKE_CXX_FLAGS_MINSIZEREL:STRING=${CMAKE_CXX_FLAGS_MINSIZEREL}
  -DCMAKE_CXX_FLAGS_RELEASE:STRING=${CMAKE_CXX_FLAGS_RELEASE}
  -DCMAKE_CXX_FLAGS_RELWITHDEBINFO:STRING=${CMAKE_CXX_FLAGS_RELWITHDEBINFO}
  -DCMAKE_C_FLAGS:STRING=${CMAKE_C_FLAGS}
  -DCMAKE_C_FLAGS_DEBUG:STRING=${CMAKE_C_FLAGS_DEBUG}
  -DCMAKE_C_FLAGS_MINSIZEREL:STRING=${CMAKE_C_FLAGS_MINSIZEREL}
  -DCMAKE_C_FLAGS_RELEASE:STRING=${CMAKE_C_FLAGS_RELEASE}
  -DCMAKE_C_FLAGS_RELWITHDEBINFO:STRING=${CMAKE_C_FLAGS_RELWITHDEBINFO}
)

# Provide option to build shared or static
option(lanl_superbuild_shared  "Build all components as shared libraries" OFF)

# Composite all options into one variable
set(lanl_superbuild_cmake
  ${lanl_superbuild_compiler}
  -DDBUILD_SHARED_LIBS:BOOL=${lanl_superbuild_shared}
  -DCMAKE_INSTALL_PREFIX:PATH=${lanl_superbuild_install_dir}
)

# Include external projects
#-----------------------------------------------------------------------------
include(external_paraview)
include(external_subh)

