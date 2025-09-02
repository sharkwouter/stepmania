if(WITH_SYSTEM_ZLIB)
  find_package(ZLIB REQUIRED)
else()
  set(ZLIB_BUILD_EXAMPLES OFF)
  set(ZLIB_BUILD_SHARED OFF)
  set(SKIP_INSTALL_ALL ON)
  # set(BUILD_SHARED_LIBS OFF)
  include(FetchContent)
  FetchContent_Declare(ZLIB
    GIT_REPOSITORY https://github.com/madler/zlib.git
    GIT_TAG v1.3.1
    GIT_SHALLOW TRUE
    # PATCH_COMMAND git apply ${CMAKE_CURRENT_SOURCE_DIR}/zlib.patch
    # UPDATE_DISCONNECTED 1
    FIND_PACKAGE_ARGS NAMES ZLIB::ZLIB zlibstatic
  )
  FetchContent_MakeAvailable(ZLIB)
endif()
