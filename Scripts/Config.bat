cd ..
mkdir Build
cd Build

cmake .. -G "Visual Studio 17 2022" -A x64
cd ..\Scripts

timeout 2
