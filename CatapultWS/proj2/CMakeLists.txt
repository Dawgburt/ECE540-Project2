cmake_minimum_required(VERSION 3.5)
project(project2 VERSION 0.1.0)

include(CTest)
enable_testing()

add_executable(project2 main.c)

target_compile_options(project2 PRIVATE -march=rv32im -mabi=ilp32 -mcmodel=medany)
target_link_options(project2 PRIVATE -march=rv32im -mabi=ilp32 -mcmodel=medany)



set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
