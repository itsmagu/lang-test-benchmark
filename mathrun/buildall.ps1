cd .\cs\
dotnet publish
bflat build .\Program.cs -o cs_time.exe -Ot --no-debug-info
bflat build .\Program.cs -o cs_size.exe -Os --no-debug-info
cp .\bin\Release\net8.0\win-x64\native\cs.exe ..\cs_publishAOT.exe
cp cs_time.exe ..\cs_time.exe
cp cs_size.exe ..\cs_size.exe
cd ..
cd .\odin\
odin build . -o:speed -out:odin_speed.exe
odin build . -o:size -out:odin_size.exe
cp odin_speed.exe ..\odin_speed.exe
cp odin_size.exe ..\odin_size.exe
cd ..
cd .\rust\
cargo build --release
cp .\target\release\rust.exe ..\rust.exe
cd ..
cd .\zig\
zig build --release=safe -p .\zig_safe
zig build --release=fast -p .\zig_speed
zig build --release=small -p .\zig_size
cp .\zig_safe\bin\zig.exe ..\zig_safe.exe
cp .\zig_speed\bin\zig.exe ..\zig_speed.exe
cp .\zig_size\bin\zig.exe ..\zig_size.exe
cd ..
