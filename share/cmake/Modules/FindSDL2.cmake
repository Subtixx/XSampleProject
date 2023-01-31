# Create imported target SDL2::SDL2
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_CURRENT_LIST_DIR}/share/cmake/Modules/")

set(SDL_DIR "${NXDK_DIR}/lib/sdl/SDL2")
file(GLOB SDL_SRCS

  # Based on Makefile.minimal (some backends adapted for Xbox
  ${SDL_DIR}/src/*.c
  ${SDL_DIR}/src/audio/*.c
  ${SDL_DIR}/src/audio/xbox/*.c
  ${SDL_DIR}/src/cpuinfo/*.c
  ${SDL_DIR}/src/events/*.c
  ${SDL_DIR}/src/file/*.c
  ${SDL_DIR}/src/haptic/*.c
  ${SDL_DIR}/src/haptic/dummy/*.c
  ${SDL_DIR}/src/joystick/*.c
  ${SDL_DIR}/src/joystick/xbox/*.c
  ${SDL_DIR}/src/loadso/dummy/*.c
  ${SDL_DIR}/src/power/*.c
  ${SDL_DIR}/src/filesystem/dummy/*.c
  ${SDL_DIR}/src/render/*.c
  ${SDL_DIR}/src/render/software/*.c
  ${SDL_DIR}/src/sensor/*.c
  ${SDL_DIR}/src/sensor/dummy/*.c
  ${SDL_DIR}/src/stdlib/*.c
  ${SDL_DIR}/src/thread/*.c
  ${SDL_DIR}/src/thread/windows/*.c
  ${SDL_DIR}/src/timer/*.c
  ${SDL_DIR}/src/timer/windows/*.c
  ${SDL_DIR}/src/video/*.c
  ${SDL_DIR}/src/video/xbox/*.c
  ${SDL_DIR}/src/video/yuv2rgb/*.c

  # Additions for Xbox
  ${SDL_DIR}/src/libm/*.c
  ${SDL_DIR}/src/atomic/*.c
)

add_library(SDL2 STATIC ${SDL_SRCS})
target_compile_definitions(SDL2 PUBLIC -DXBOX=1)
target_include_directories(SDL2 SYSTEM PUBLIC "${SDL_DIR}/include"
        "${NXDK_DIR}/lib/usb/libusbohci/inc"
        "${NXDK_DIR}//lib/usb/libusbohci_xbox"
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

add_library(SDL2::SDL2 INTERFACE IMPORTED)
target_link_libraries(SDL2::SDL2 INTERFACE SDL2)
