# Find assimp
# Copyright � 2017 Tomas Mikalauskas

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
# Locate Freetype
# This module defines
#  ASSIMP_FOUND, if false, do not try to link to ASSIMP
#  FREETYPE_LIBRARIES
#  FREETYPE_INCLUDE_DIR

FIND_PATH(FREETYPE_INCLUDE_DIR ft2build.h
  PATH_SUFFIXES include 
  HINTS ${FREETPYE_PATH}
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
)

FIND_LIBRARY(FREETYPE_LIBRARY_DEBUG
  NAMES freetyped freetype28d
  PATH_SUFFIXES "" debug
  HINTS  ${FREETYPE_LIB_SEARCH_PATH}
  PATHS
  ~/Library/Frameworks
  /Library/Frameworks
  /usr/local
  /usr
  /sw
  /opt/local
  /opt/csw
  /opt
)

FIND_LIBRARY(FREETYPE_LIBRARY_RELEASE
  NAMES freetype freetype28
  PATH_SUFFIXES "" release
  HINTS  ${FREETYPE_LIB_SEARCH_PATH} 
  PATHS
  ~/Library/Frameworks
  /Library/Frameworks
  /usr/local
  /usr
  /sw
  /opt/local
  /opt/csw
  /opt
)

SET(FREETYPE_LIBRARIES
  ${FREETYPE_LIBRARY_RELEASE}
  ${FREETYPE_LIBRARY_DEBUG}
)


INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(FREETYPE_CUSTOM  DEFAULT_MSG  FREETYPE_INCLUDE_DIR FREETYPE_LIBRARY_DEBUG FREETYPE_LIBRARY_RELEASE)

MARK_AS_ADVANCED(FREETYPE_INCLUDE_DIR FREETYPE_LIBRARY_DEBUG FREETYPE_LIBRARY_RELEASE)