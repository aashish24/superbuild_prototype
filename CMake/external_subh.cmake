set(subh_source "${lanl_superbuild_build_dir}/subh")
set(subh_binary "${lanl_superbuild_build_dir}/subh_build")
set(subh_install"${lanl_superbuild_install_dir}")
set(subh_depends ParaView)

configure_file("${lanl_cmake_dir}/subh_build_step.cmake.in"
  "${subh_binary}/subh_build_step.cmake"
)

set(subh_bulid_command ${CMAKE_COMMAND} -P "${subh_binary}/subh_build_step.cmake")

ExternalProject_Add(subh
  SOURCE_DIR ${subh_source}
  BINARY_DIR ${subh_binary}
  INSTALL_DIR ${subh_install}
  GIT_REPOSITORY git://github.com/patrickoleary/subh.git
  GIT_TAG "master"
  PATCH_COMMAND ""
  CMAKE_ARGS
    ${lanl_superbuild_cmake}
  CONFIGURE_COMMAND ""
  BUILD_COMMAND ${subh_bulid_command}
  DEPENDS ${subh_depends}
)
