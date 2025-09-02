if(WITH_SYSTEM_ZLIB)
  find_package(ZLIB REQUIRED)
else()
  include(FetchContent)
  FetchContent_Declare(zlib
    GIT_REPOSITORY https://github.com/madler/zlib.git
    GIT_TAG v1.3.1
    GIT_SHALLOW TRUE
  )
  FetchContent_MakeAvailable(zlib)
endif()
