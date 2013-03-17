set(subh_source "${lanl_superbuild_build_dir}/subh")
set(subh_binary "${lanl_superbuild_build_dir}/subh_build")
set(subh_install"${lanl_superbuild_install_dir}")

ExternalProject_Add(subh
  SOURCE_DIR ${subh_source}
  BINARY_DIR ${subh_binary}
  INSTALL_DIR ${subh_install}
  GIT_REPOSITORY git clone git://github.com/patrickoleary/subh.git
  GIT_TAG "master"
  PATCH_COMMAND ""
  CMAKE_ARGS
    ${lanl_superbuild_cmake}
  INSTALL_COMMAND ""
  DEPENDS ParaView
)
