project(XSampleProject)

cmake_minimum_required(VERSION 3.0)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_CURRENT_LIST_DIR}/share/cmake/Modules/")

# Add all *.cpp files in the src directory to the project
file(GLOB_RECURSE SRC_FILES
        src/*.cpp
        src/*.c
        )

# Add all *.h files in the src directory to the project
file(GLOB_RECURSE HEADER_FILES
        src/*.h
        src/*.hpp
        )

find_package(NXDK REQUIRED)
find_package(SDL2 REQUIRED)

add_executable(${PROJECT_NAME} ${SRC_FILES} ${HEADER_FILES})
target_link_libraries(${PROJECT_NAME} SDL2::SDL2 NXDK::NXDK)

#$(NXDK_DIR)/tools/cxbe/cxbe
#$(VE)$(CXBE) -OUT:$@ -TITLE:$(XBE_TITLE) $< $(QUIET)
add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD 
        COMMAND mkdir -p ${CMAKE_BINARY_DIR}/bin
        COMMAND ${NXDK_DIR}/tools/cxbe/cxbe -OUT:${CMAKE_BINARY_DIR}/bin/default.xbe -TITLE:${PROJECT_NAME} ${CMAKE_BINARY_DIR}/${PROJECT_NAME}.exe
        COMMAND ${NXDK_DIR}/tools/extract-xiso/build/extract-xiso -c ${CMAKE_BINARY_DIR}/bin ${CMAKE_BINARY_DIR}/${PROJECT_NAME}.iso
        )
