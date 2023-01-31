file(GLOB NXDK_SRCS
        ${NXDK_DIR}/lib/nxdk/*.cpp
        ${NXDK_DIR}/lib/nxdk/*.c
        )
file(GLOB NXDK_HDRS ${NXDK_DIR}/lib/nxdk/*.h)

add_library(NXDK STATIC ${NXDK_SRCS})
target_include_directories(NXDK SYSTEM PUBLIC
        "${NXDK_DIR}/lib/usb/libusbohci/inc"
        "${NXDK_DIR}/lib/net/lwip/src/include/lwip"
        "${NXDK_DIR}/lib/net/lwip/src/include"
        "${NXDK_DIR}/lib/net/nforceif/include"
        "${NXDK_DIR}/lib/nxdk"
        "${NXDK_DIR}/lib/hal"
        "${NXDK_DIR}/lib/libcxx"
        "${NXDK_DIR}/lib/libjpeg"
        "${NXDK_DIR}/lib/libpng"
        "${NXDK_DIR}/lib/pbkit"
        "${NXDK_DIR}/lib/pdclib"
        "${NXDK_DIR}/lib/pkgconfig"
        "${NXDK_DIR}/lib/usb"
        "${NXDK_DIR}/lib/usb/libusbohci/inc"
        "${NXDK_DIR}/lib/winapi"
        "${NXDK_DIR}/lib/xboxkrnl"
        "${NXDK_DIR}/lib/xboxrt"
        "${NXDK_DIR}/lib/zlib"
        "${NXDK_DIR}/lib"
        "${NXDK_DIR}/lib/net/nvnetdrv"
        )

add_library(NXDK::NXDK INTERFACE IMPORTED)
target_link_libraries(NXDK::NXDK INTERFACE NXDK)