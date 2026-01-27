# This is complient to bash too so just switch the name on linux

cd .\cs\
echo "Building C# with bflat, dotnet runtime and dotnet nativeAOT"
dotnet publish
dotnet build -c Release
bflat build .\Program.cs -o cs_time.exe -Ot --no-debug-info
bflat build .\Program.cs -o cs_size.exe -Os --no-debug-info
cp .\bin\Release\net8.0\win-x64\native\cs.exe ..\cs_publishAOT.exe
cp cs_time.exe ..\cs_time.exe
cp cs_size.exe ..\cs_size.exe
cd ..
cd .\odin\
echo "Building Odin <3"
odin build . -o:speed -out:odin_speed.exe
odin build . -o:size -out:odin_size.exe
odin build . -o:aggressive -out:odin_aggressive.exe
cp odin_speed.exe ..\odin_speed.exe
cp odin_size.exe ..\odin_size.exe
cp odin_aggressive.exe ..\odin_aggressive.exe
cd ..
cd .\rust\
echo "Building Rust"
cargo build --release
cp .\target\release\rust.exe ..\rust.exe
cd ..
cd .\zig\
echo "Building Zig"
zig build --release=safe -p .\zig_safe
zig build --release=fast -p .\zig_speed
zig build --release=small -p .\zig_size
cp .\zig_safe\bin\zig.exe ..\zig_safe.exe
cp .\zig_speed\bin\zig.exe ..\zig_speed.exe
cp .\zig_size\bin\zig.exe ..\zig_size.exe
cd ..
cd .\cpp\
echo "Building C++ with clang++ and zig c++"
clang++ main.cpp -O3 -o cpp_O3.exe
clang++ main.cpp -O2 -o cpp_O2.exe
clang++ main.cpp -Os -o cpp_Os.exe
zig c++ .\main.cpp -O3 -o zig_cpp_O3.exe
zig c++ .\main.cpp -O2 -o zig_cpp_O2.exe
zig c++ .\main.cpp -Os -o zig_cpp_Os.exe
cp cpp_O3.exe ../
cp cpp_O2.exe ../
cp cpp_Os.exe ../
cp zig_cpp_O3.exe ../
cp zig_cpp_O2.exe ../
cp zig_cpp_Os.exe ../
cd ..
