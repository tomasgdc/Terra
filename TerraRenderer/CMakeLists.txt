CMAKE_MINIMUM_REQUIRED(VERSION 3.12)

PROJECT(TerraRenderer)

FILE(GLOB SRC_FILES 
	${PROJECT_SOURCE_DIR}/*.cpp
	${PROJECT_SOURCE_DIR}/*.h
)

ADD_LIBRARY(${PROJECT_NAME} STATIC
	${SRC_FILES}
)

TARGET_LINK_LIBRARIES(${PROJECT_NAME} PUBLIC
	d3d12.lib
    dxgi.lib
    dxguid.lib
	D3DCompiler.lib
	${FREETYPE_LIBRARY}
	#debug ${FREETYPE_LIBRARY_DEBUG}
	debug ${ASSIMP_LIBRARY_DEBUG}
	debug ${ZLIB_LIBRARY_DEBUG}
	debug ${DirectXTK_LIBRARY_DEBUG}
	#optimized ${FREETYPE_LIBRARY_RELEASE}
	optimized ${ASSIMP_LIBRARY_RELEASE}
	optimized ${ZLIB_LIBRARY_RELEASE}
	optimized ${DirectXTK_LIBRARY_RELEASE}
	)



TARGET_INCLUDE_DIRECTORIES(${PROJECT_NAME} PUBLIC
	${CMAKE_CURRENT_SOURCE_DIR}
	${CMAKE_SOURCE_DIR}
	)