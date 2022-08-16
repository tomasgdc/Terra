cd ..
mkdir App

::GET ASSIMP
copy ThirdParty\\assimp\build\code\Debug\\assimp-vc140-mt.dll App\\assimp-vc140-mt.dll

::GET FREETYPE
copy "ThirdParty\\freetype\\builds\\vc2017\\x64\\freetype.dll" App\\freetype.dll

cd Scripts
timeout 2
