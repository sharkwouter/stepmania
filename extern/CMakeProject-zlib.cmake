if(WITH_SYSTEM_ZLIB AND WITH_SYSTEM_PNG)
  find_package(ZLIB REQUIRED)
else()
  set(ZLIB_BUILD_EXAMPLES OFF)
  set(ZLIB_BUILD_SHARED OFF)
  set(SKIP_INSTALL_ALL ON)
  include(FetchContent)
  FetchContent_Declare(ZLIB
    GIT_REPOSITORY https://github.com/madler/zlib.git
    GIT_TAG v1.3.1
    GIT_SHALLOW TRUE
    PATCH_COMMAND git apply ${CMAKE_CURRENT_SOURCE_DIR}/zlib.patch
    UPDATE_DISCONNECTED 1
  )
  FetchContent_MakeAvailable(ZLIB)
  get_cmake_property(_variableNames VARIABLES)
  list (SORT _variableNames)
  foreach (_variableName ${_variableNames})
      string(FIND "${_variableName}" "ZLIB" out)
      if ("${out}" EQUAL 0)
          message(STATUS "vriables => ${_variableName}=${${_variableName}}")
      endif()
  endforeach()
endif()