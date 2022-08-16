# Find assimp
# Copyright © 2017 Tomas Mikalauskas

# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the "Software"),
# to deal in the Software without restriction, including without limitation
# the rights to use, copy, modify, merge, publish, distribute, sublicense,
# and/or sell copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included
# in all copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
# OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
# DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
# TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
# OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#
# Locate ASSIMP
# This module defines
#  ASSIMP_FOUND, if false, do not try to link to ASSIMP
#  ASSIMP_LIBRARIES
#  ASSIMP_INCLUDE_DIR

FIND_PATH(ASSIMP_INCLUDE_DIR mesh.h
  PATH_SUFFIXES include/assimp assimp
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
  ${CMAKE_SOURCE_DIR}/ThirdParty/assimp
)

if (CMAKE_SIZEOF_VOID_P EQUAL 8)
    set(_sdl_lib_suffix lib/x64)
else()
    set(_sdl_lib_suffix lib/x86)
endif()

FIND_LIBRARY(ASSIMP_LIBRARY_RELEASE
  NAMES assimp-vc140-mt
  PATHS
  ~/Library/Frameworks
  /Library/Frameworks
  /usr/local
  /usr
  /sw
  /opt/local
  /opt/csw
  /opt
  ${CMAKE_SOURCE_DIR}/ThirdParty/assimp/build/code/Release
)

FIND_LIBRARY(ASSIMP_LIBRARY_DEBUG
  NAMES assimp-vc140-mt
  PATHS
  ~/Library/Frameworks
  /Library/Frameworks
  /usr/local
  /usr
  /sw
  /opt/local
  /opt/csw
  /opt
  ${CMAKE_SOURCE_DIR}/ThirdParty/assimp/build/code/Debug
)

SET(ASSIMP_LIBRARIES
  ${ASSIMP_LIBRARY_RELEASE}
  ${ASSIMP_LIBRARY_DEBUG}
)


INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(ASSIMP  DEFAULT_MSG  ASSIMP_INCLUDE_DIR ASSIMP_LIBRARY_DEBUG ASSIMP_LIBRARY_RELEASE)

MARK_AS_ADVANCED(ASSIMP_INCLUDE_DIR ASSIMP_LIBRARY_DEBUG ASSIMP_LIBRARY_RELEASE)
