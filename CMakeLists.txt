cmake_minimum_required(VERSION 3.7.1)

project(FreeRTOS-POSIX)

aux_source_directory(${CMAKE_ROOT_DIR}/Source SOURCE_FILES)

set(PORTABLE_FILES 
    Source/portable/MemMang/heap_3.c 
    Source/portable/GCC/POSIX/port.c
    Demo/main.c)
set(SOURCE_FILES
    Source/croutine.c
    Source/event_groups.c
    Source/list.c
    Source/queue.c
    Source/tasks.c
    Source/timers.c)

include_directories(Source/include Source/portable/GCC/POSIX Demo)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -W -Wall -Werror -Wextra -Wformat -Wmissing-braces -Wno-cast-align")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wparentheses -Wshadow -Wno-sign-compare -Wswitch -Wuninitialized")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wunknown-pragmas -Wunused-function -Wunused-label -Wmissing-prototypes -Wno-unused-parameter")

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DDEBUG=1 -g -UUSE_STDIO -D__GCC_POSIX__=1 -DMAX_NUMBER_OF_TASKS=300 -O2")

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -pthread")

MESSAGE( STATUS "CMAKE_C_FLAGS: " ${CMAKE_C_FLAGS} )

add_executable(FreeRTOS-POSIX ${SOURCE_FILES} ${PORTABLE_FILES})
