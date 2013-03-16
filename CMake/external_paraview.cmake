set(paraview_source "${lanl_superbuild_build_dir}/paraview")
set(paraview_binary "${lanl_superbuild_build_dir}/paraview_build")
set(paraview_install"${lanl_superbuild_install_dir}")

ExternalProject_Add(ParaView
  SOURCE_DIR ${paraview_source}
  BINARY_DIR ${paraview_binary}
  INSTALL_DIR ${paraview_install}
  GIT_REPOSITORY git://github.com/patrickoleary/ParaView-3.98.0.git
  GIT_TAG "master"
  PATCH_COMMAND ""
  CMAKE_ARGS
    ${lanl_superbuild_cmake}
  INSTALL_COMMAND ""
  DEPENDS ""
)
