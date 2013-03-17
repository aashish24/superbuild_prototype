set(paraview_source "${lanl_superbuild_build_dir}/paraview")
set(paraview_binary "${lanl_superbuild_build_dir}/paraview_build")
set(paraview_install"${lanl_superbuild_install_dir}")
set(paraview_depends "")

ExternalProject_Add(ParaView
  SOURCE_DIR ${paraview_source}
  BINARY_DIR ${paraview_binary}
  INSTALL_DIR ${paraview_install}
  GIT_REPOSITORY git://github.com/patrickoleary/ParaView-3.98.0.git
  GIT_TAG "master"
  PATCH_COMMAND ""
  CMAKE_ARGS
    ${lanl_superbuild_cmake}
    -DPARAVIEW_BUILD_QT_GUI:BOOL=OFF
    -DPARAVIEW_ENABLE_PYTHON:BOOL=ON
    -DPARAVIEW_USE_MPI:BOOL=ON
    -DVTK_USE_X:BOOL=OFF
    -DOSMESA_INCLUDE_DIR:PATH=${OSMESA_INCLUDE_DIR}
    -DOSMESA_LIBRARY:FILEPATH=${OSMESA_LIBRARY}
    -DBUILD_FORTRAN_COPROCESSING_ADAPTORS:BOOL=ON
  DEPENDS ${paraview_depends}
)
