# Locate SDL2
# This module defines
#  SDL2_FOUND, if false, do not try to link to SDL2
#  SDL2_LIBRARIES
#  SDL2_INCLUDE_DIR

FIND_PATH(SDL2_INCLUDE_DIR SDL.h
  PATH_SUFFIXES include SDL2
  PATHS
  ~/Library/Frameworks
  /Library/Frameworks
  /usr/local/include
  /usr/local
  /usr
  /sw # Fink
  /opt/local # DarwinPorts
  /opt/csw # Blastwave
  /opt
  ${CMAKE_SOURCE_DIR}/ThirdParty/sdl
)

if (CMAKE_SIZEOF_VOID_P EQUAL 8)
    set(_sdl_lib_suffix lib/x64)
else()
    set(_sdl_lib_suffix lib/x86)
endif()

FIND_LIBRARY(SDL2_LIBRARY 
  NAMES SDL2
  PATH_SUFFIXES lib64 lib ${_sdl_lib_suffix}
  PATHS
  ~/Library/Frameworks
  /Library/Frameworks
  /usr/local
  /usr
  /sw
  /opt/local
  /opt/csw
  /opt
  ${CMAKE_SOURCE_DIR}/ThirdParty/sdl/build
  ${CMAKE_SOURCE_DIR}/ThirdParty/sdl/build/Release
)

FIND_LIBRARY(SDL2_LIBRARY_SDL2MAIN 
  NAMES SDL2main
  PATH_SUFFIXES lib64 lib ${_sdl_lib_suffix}
  PATHS
  ~/Library/Frameworks
  /Library/Frameworks
  /usr/local
  /usr
  /sw
  /opt/local
  /opt/csw
  /opt
  ${CMAKE_SOURCE_DIR}/ThirdParty/sdl/build
  ${CMAKE_SOURCE_DIR}/ThirdParty/sdl/build/Release
)

SET(SDL2_LIBRARIES
  ${SDL2_LIBRARY}
  ${SDL2_LIBRARY_SDL2MAIN}
)

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(SDL2  DEFAULT_MSG  SDL2_INCLUDE_DIR SDL2_LIBRARY SDL2_LIBRARY_SDL2MAIN)

MARK_AS_ADVANCED(SDL2_INCLUDE_DIR SDL2_LIBRARY SDL2_LIBRARY_SDL2MAIN)
