## Info
A few examples made in a selection of languages to analyze their use and how fun they are to write in.
I am heavly biased towards Odin and C#. But I respect and consider the performance gain in Zig and Rust.
I have 6+ years experiance with C# and have pressed it for everything it got, I need something new.
I Love Odin but glare at the speed and comptime of Zig.
I enjoy Rust's shadowing, I do not enjoy the bloat.
I think Zig is promising and a great option, but I hate the error handling and random complexity.

Overall, I think C# is a great scripting langauge but I don't want to use unsafe anymore,
Odin should not feature freeze yet,
Rust should have feature freezed years ago,
Zig needs time...

From my recent addition of cpp into the examples, 
i have deducted that odin can mostly compete with cpp.
They get very close results beat eachother from time to time.
The cool thin with zig is that I could still use c/cpp which is cool.
I don't really have anything against cpp, it's close to my beloved c#.

### However

zig do be consistantly hitting that top spot in **my tests**
while odin and rust runs at x1.20 to x1.80 times that of zig..
Still, syntactically I am in love with Odin. Odin lang <3

#### My inaccruate evaluation of Zig

Also, recently learned about comptime. This sounded like a dream come true!
It would allow me to do implement magic.
But, I watched talks about it and how it works, it can't do IO... And might 
be **atm** slower then python... The fuq? The what is the point? Even the
built-in #load() in Odin might be a better option for reaching wizard rank!
I don't care for generics, what would I even do at compile time if not IO?? :/
In my eyes, comptime would be for zig what LINQ is for C#. The secret suace.
But instead, from what I can see atm, it's just a manual way of doing generics
and passing types and maybe generate a few consts here and there..

#### Rust

I have trust issues and thus believe the compiler is lying to me.
I might also be a bit egotisic and like to alloc and free myself.
Otherwise, I like. Shadowing should be added to all languages to
stop me from re-using "dead" variables. The borrow checker makes
sense but is annoying. Over-all It's a bit too high level for me.

#### My unbiased opinion of Odin lang

Odin <3

# Building and Running

Feel free to use whatever compiler + link you want.
If you want to use the same as me please read BuildAll.ps1 powershell script (They are bash compliant).
My tests are done with hyperfine.
```
hyperfine --warmup 9 --runs 3 '.\cs_publishAOT.exe' '.\cs_size.exe' '.\cs_time.exe' '.\odin_size.exe' '.\odin_speed.exe' '.\rust.exe' '.\zig_safe.exe' '.\zig_size.exe' '.\zig_speed.exe' '.\cs\bin\Release\net8.0\cs.exe' '.\cpp_os.exe' '.\cpp_o2.exe' '.\cpp_o3.exe' '.\odin_aggressive.exe' '.\zig_cpp_Os.exe' '.\zig_cpp_O3.exe' '.\zig_cpp_O2.exe'
```

## Depends
```
clang++
odin
zig
rust cargo
bflat
dotnet 8.0
hyperfine
```
## Configurations
```
-- C# --
cs_size 			is bflat optimized for size
cs_time 			is bflat optimized for speed
cs_publishAOT		is dotnet 8.0 compiled to native
cs					is the dotnet runtime and dll (This should always be the slowest)
-- Odin --
odin_size			is odin optimized for size
odin_speed			is odin optimized for speed
odin_aggressive		is odin optimized to not comply with the language standard (might be unstable)
-- Zig --
zig_speed			is zig optimized for speed
zig_size 			is zig optimized for size
zig_safe 			is zig with safty checks
-- Rust --
rust 				is rust :)
-- C++ --
cpp_O2 				is clang++ with O2
cpp_O3 				is clang++ with O3
cpp_Os 				is clang++ with Os
zig_cpp_O2 			is zig c++ with O2 (cpp code)
zig_cpp_O3 			is zig c++ with O3 (cpp code)
zig_cpp_Os 			is zig c++ with Os (cpp code)
```
