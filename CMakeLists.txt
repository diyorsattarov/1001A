cmake_minimum_required(VERSION 3.25)
set(PROJECT_NAME microservice)
project(${PROJECT_NAME})

# Specify the C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Add the executable
add_executable(${PROJECT_NAME} src/microservice.cpp)

# Find Boost libraries
find_package(Boost 1.71.0 REQUIRED COMPONENTS system thread)

# Link Boost libraries
target_link_libraries(${PROJECT_NAME} PRIVATE Boost::system Boost::thread)

# Find redis++ and hiredis libraries
find_package(hiredis REQUIRED)
find_package(redis++ REQUIRED)

# Link redis++ and hiredis
target_link_libraries(${PROJECT_NAME} PRIVATE redis++::redis++ hiredis::hiredis)
