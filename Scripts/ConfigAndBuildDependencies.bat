::BUILD ASSIMP
cd ../ThirdParty/assimp
mkdir build
cd build

cmake .. -G "Visual Studio 17 2022" -A x64 -DASSIMP_BUILD_ASSIMP_TOOLS=off -DASSIMP_BUILD_SAMPLES=off -DASSIMP_BUILD_TESTS=off -DBUILD_SHARED_LIBS=off
call cmake --build . --config Release
call cmake --build . --config Debug
cd ..\..\..\Scripts

::Build DirectTex
cd ../ThirdParty/directXTex

mkdir build
cd build
cmake .. -G "Visual Studio 17 2022" -A x64
call cmake --build . --config Release
call cmake --build . --config Debug

cd ..\..\..\Scripts

timeout 2
