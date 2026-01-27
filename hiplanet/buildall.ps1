# This is complient to bash too so just switch the postfix on linux

echo "Building C# with dotnet runtime and dotnet nativeAOT"
cd .\cs\
dotnet publish
dotnet build -c Release
# bflat build .\Program.cs -o cs_time.exe -Ot --no-debug-info
# bflat build .\Program.cs -o cs_size.exe -Os --no-debug-info
cp .\bin\Release\net8.0\win-x64\native\cs.exe ..\cs_publishAOT.exe
# cp cs_time.exe ..\cs_time.exe
# cp cs_size.exe ..\cs_size.exe
cd ..
echo "Building Odin <3"
cd .\odin\
odin build . -o:speed -out:odin_speed.exe
odin build . -o:size -out:odin_size.exe
odin build . -o:aggressive -out:odin_aggressive.exe
cp odin_speed.exe ..\odin_speed.exe
cp odin_size.exe ..\odin_size.exe
cp odin_aggressive.exe ..\odin_aggressive.exe
cd ..
echo "Building Rust"
cd .\rust\
cargo build --release
cp .\target\release\rust.exe ..\rust.exe
cd ..
echo "Building Zig"
cd .\zig\
zig build-exe .\main.zig -O ReleaseFast -femit-bin="../zig_speed.exe" -fstrip
zig build-exe .\main.zig -O ReleaseSmall -femit-bin="../zig_size.exe" -fstrip
zig build-exe .\main.zig -O ReleaseSafe -femit-bin="../zig_safe.exe" -fstrip
cd ..
echo "Building C++ with clang++ and zig c++"
cd .\cpp\
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
echo "Building C++ with MSVC"
cl /c .\cpp\main.cpp /O1
link .\main.obj
mv .\main.exe msvc_cpp_Os.exe -Force
rm .\main.obj
cl /c .\cpp\main.cpp /O2
link .\main.obj
mv .\main.exe msvc_cpp_O3.exe -Force
rm .\main.obj
hyperfine --warmup 200 --runs 500 .\zig_safe.exe .\zig_speed.exe .\zig_size.exe .\rust.exe .\cpp_O2.exe .\cpp_O3.exe .\cpp_Os.exe .\odin_aggressive.exe .\odin_size.exe .\odin_speed.exe .\zig_cpp_O2.exe .\zig_cpp_O3.exe .\zig_cpp_Os.exe .\cs_publishAOT.exe .\cs\bin\Release\net8.0\cs.exe .\msvc_cpp_O2.exe .\msvc_cpp_O3.exe
