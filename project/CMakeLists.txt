#********** start CmakeLists.txt **********

cmake_minimum_required(VERSION 3.7)

project(PROJECT_ASM)

#set(CMAKE_BUILD_TYPE Debug)
set(CMAKE_BUILD_TYPE Release)

set(MY_PROGRAM myprog)

enable_language(ASM_NASM)

set(CMAKE_ASM_NASM_OBJECT_FORMAT win64)
set(CMAKE_NASM_LINK_EXECUTABLE "ld <LINK_FLAGS> <OBJECTS> -o <TARGET> <LINK_LIBRARIES>")
set(CMAKE_ASM_NASM_COMPILE_OBJECT "<CMAKE_ASM_NASM_COMPILER> -f ${CMAKE_ASM_NASM_OBJECT_FORMAT} -o <OBJECT> <SOURCE>")

set(EXECUTABLE_OUTPUT_PATH ${CMAKE_CURRENT_SOURCE_DIR}/bin)

file(GLOB_RECURSE asm_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/src/*.asm)

ADD_EXECUTABLE(${MY_PROGRAM} ${asm_SRCS})
set_target_properties(${MY_PROGRAM} PROPERTIES LINKER_LANGUAGE NASM)

#********** end CmakeLists.txt **********