if(WITH_SYSTEM_PNG)
  find_package(PNG REQUIRED)
  set(PNG_LIBRARIES ${PNG_LIBRARIES} PARENT_SCOPE)
else()
  include(FetchContent)
  FetchContent_Declare(PNG
    GIT_REPOSITORY https://github.com/pnggroup/libpng.git
    GIT_TAG v1.6.50
    GIT_SHALLOW TRUE
  )
  FetchContent_MakeAvailable(PNG)
endif()
