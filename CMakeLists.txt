cmake_minimum_required(VERSION 3.10)
project(FileEncryptor VERSION 1.0)

set(CMAKE_CXX_STANDARD 14)
set(OPENSSL_ROOT_DIR /opt/homebrew/Cellar/openssl@3/3.1.3)
set(OPENSSL_INCLUDE_DIR /opt/homebrew/Cellar/openssl@3/3.1.3/include/)
set(OPENSSL_CRYPTO_LIBRARY /opt/homebrew/Cellar/openssl@3/3.1.3/lib/libcrypto.dylib)

file(GLOB_RECURSE SOURCES "src/*.cpp")
file(GLOB TEST_FILES "test/*.cpp")

include_directories(include)
include_directories(${OPENSSL_INCLUDE_DIR})
Include(FetchContent)

FetchContent_Declare(
  Catch2
  GIT_REPOSITORY https://github.com/catchorg/Catch2.git
  GIT_TAG        v3.0.1
)
  
FetchContent_MakeAvailable(Catch2)
  
find_package(OpenSSL REQUIRED)
  
add_executable(testSuite ${TEST_FILES})
add_executable(fileEncryptor ${SOURCES})
  
link_directories(${OPENSSL_LIBRARIES})
target_link_libraries(testSuite PRIVATE Catch2::Catch2WithMain)
target_link_libraries(fileEncryptor PRIVATE OpenSSL::SSL OpenSSL::Crypto)