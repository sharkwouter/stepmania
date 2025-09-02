if(WITH_SYSTEM_PNG)
  find_package(PNG REQUIRED)
  set(PNG_LIBRARIES ${PNG_LIBRARIES} PARENT_SCOPE)
else()
  set(PNG_TOOLS OFF)
  set(PNG_SHARED OFF)
  set(PNG_FRAMEWORK OFF)
  set(PNG_TESTS OFF)
  set(SKIP_INSTALL_ALL ON)
  include(FetchContent)
  FetchContent_Declare(PNG
    GIT_REPOSITORY https://github.com/pnggroup/libpng.git
    GIT_TAG v1.6.50
    GIT_SHALLOW TRUE
    # PATCH_COMMAND git apply ${CMAKE_CURRENT_SOURCE_DIR}/png.patch
    # UPDATE_DISCONNECTED 1
  )
  FetchContent_MakeAvailable(PNG)
endif()
