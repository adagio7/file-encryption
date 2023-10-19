cmake_minimum_required(VERSION 3.10)
project(FileEncryptor VERSION 1.0)

set(CMAKE_CXX_STANDARD 14)

file(GLOB_RECURSE SOURCES "src/*.cpp")
file(GLOB TEST_FILES "test/*.cpp")

include_directories(include)
Include(FetchContent)

FetchContent_Declare(
  Catch2
  GIT_REPOSITORY https://github.com/catchorg/Catch2.git
  GIT_TAG        v3.0.1
)

FetchContent_MakeAvailable(Catch2)

add_executable(testSuite ${TEST_FILES})
target_link_libraries(testSuite PRIVATE Catch2::Catch2WithMain)

add_executable(fileEncryptor ${SOURCES})