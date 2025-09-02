if(WITH_SYSTEM_PNG OR WITH_SYSTEM_ZLIB)
  find_package(ZLIB REQUIRED)
  find_package(PNG REQUIRED)
  set(PNG_LIBRARIES ${PNG_LIBRARIES} PARENT_SCOPE)
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
    OVERRIDE_FIND_PACKAGE
  )
  set(PNG_TOOLS OFF)
  set(PNG_SHARED OFF)
  set(PNG_FRAMEWORK OFF)
  set(PNG_TESTS OFF)
  set(SKIP_INSTALL_ALL ON)
  FetchContent_Declare(PNG
    GIT_REPOSITORY https://github.com/pnggroup/libpng.git
    GIT_TAG v1.6.50
    GIT_SHALLOW TRUE
    # PATCH_COMMAND git apply ${CMAKE_CURRENT_SOURCE_DIR}/png.patch
    # UPDATE_DISCONNECTED 1
    
  )
  FetchContent_MakeAvailable(ZLIB PNG)
endif()
