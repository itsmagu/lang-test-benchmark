> BEWARE! UNINFORMED OPINIONS AHEAD! I DO NOT HAVE 100% CORRECT UNDERSTANDING OF ALL THESE LANGUAGES! IF I DID I WOULD NOT NEED TO TEST THEM!
> ALSO BEWARE! BENCHMARKS ARE NOT THE END ALL BE ALL SOLUTION TO WHAT LANGUAGE IS THE FASTEST. IT COMES DOWN TO THE COMPILER AND ALSO HOW MATURE THE COMPILER IS. AND ATM THAT OFTEN COMES DOWN TO HOW ALIKE C SOMETHING IS TO PLEASE THE LLVM BACKEND WHICH MOST LANGUAGES USE FOR IT'S OPTIMIZATIONS, SINCE LLVM WAS MADE WITH C IN MIND! THESE BENCHMARKS ARE MOSTLY JUST FOR ME TO THINK ABOUT HOW JUSTIFYABLE SOMETHING IS TO WRITE OVER HOW FAST IT RUNS.

# Info

The root contains different projects like "Hi Planet" which is a Hello World project.
Inside of Hi Planet you will find respective subdirectories for each language.
The BuildAll.ps1 (which is also bash complient if you rename it)
will build each project variant inside of their own subdirectories.
It will then **copy** each resulting binary (except for the C# runtime dll/exe) into the Hi Planet directory. You are then free to run hyperfine for benchmarks!

# Building and Running

Feel free to use whatever compiler + linker you want.
If you want to use the same builds as me please read the BuildAll.ps1 powershell script (They are bash compliant if you rename the file).
My tests are done with hyperfine:
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
.Net 8.0 / dotnet 8.0
hyperfine
```
## Configurations
```
-- C# --
cs_size 		is bflat optimized for size
cs_time 		is bflat optimized for speed
cs_publishAOT 		is dotnet 8.0 compiled to native
cs 			is the dotnet runtime and dll (This should always be the slowest)
-- Odin --
odin_size 		is odin optimized for size
odin_speed 		is odin optimized for speed
odin_aggressive 	is odin optimized to not comply with the language standard (might be unstable)
-- Zig --
zig_speed 		is zig optimized for speed
zig_size 		is zig optimized for size
zig_safe 		is zig with safty checks
-- Rust --
rust 			is rust :)
-- C++ --
cpp_O2 			is clang++ with O2
cpp_O3 			is clang++ with O3
cpp_Os 			is clang++ with Os
zig_cpp_O2 		is zig c++ with O2 (cpp code)
zig_cpp_O3 		is zig c++ with O3 (cpp code)
zig_cpp_Os 		is zig c++ with Os (cpp code)
```
## General Opinion / Blog
A few examples made in a selection of languages to analyze their use and how fun they are to write in.
I am heavly biased towards Odin and C#. But I respect and consider the performance gain in Zig and Rust.
I have 6+ years experiance with C# and have pressed it for everything it got, I need something new.
I Love Odin but glare at the speed and comptime of Zig.
I enjoy Rust's shadowing, but I do not enjoy the "bloat" feel and lifetime/async complexity.
I think Zig is promising and a great option, but I hate the error handling and random complexity.

Overall, I think C# is a great scripting language but I don't want to use unsafe anymore,
Odin should not feature freeze yet,
Rust should have feature freezed years ago,
Zig have a bright future but blury present...

Zig do be consistantly hitting that top spot in **my tests**
while odin and rust runs at x1.20 to x1.80 times that of zig..
Still, syntactically I am in love with Odin.

From my recent addition of cpp into the examples, 
i have deducted that odin can mostly compete with cpp.
They get very close results and beat eachother from time to time.
The cool thing with zig's build system is that I could still use c/cpp which is cool.
I don't really have anything against cpp, it's close to my beloved c#.

### My inaccruate evaluation of Zig

Also, recently learned about comptime. This sounded like a dream come true!
It would allow me to do magic.
But, I watched talks about it and how it works, it can't do IO... And might 
be **atm** slower then python... The fuq? Then what is the point? Even the
built-in #load() in Odin might be a better option for reaching wizard status!
I don't care for generics, what would I even do at compile time if not IO?? :/
In my eyes, comptime would be for zig what LINQ is for C#. The secret suace.
But instead, from what I can see atm, it's just a manual way of doing generics
and passing types and maybe generate a few consts here and there for performance gain
and massive compile time costs.

(Update)
I have now started to do some small testing in zig. It has the @embedFile macro/thing
that can compile files into the binary so that is cool. I have recently looked into 
zig thanks to it's C compiler witch is easier to install then normal c compilers and 
very convenient.

### My mixed feelings with Rust

Programming gives me trust issues and thus I believe the compiler is lying to me.
I might also be a bit egotisic and like to alloc and free myself.
Otherwise, I like Rust. Shadowing should be added to all languages to
stop me from 3 variables with "dead" data in them. The borrow checker makes
sense but is annoying. Over-all It's a bit too high level for me.

I think my issues with Rust stems from the fact that It's not really GC and not really manual memory management.
I enjoy breaking encapsulation by reaching out into main memory from time to time. 
In Rust data does not feel presistent to me, it's much more scope focused. 
Still, Rust is one of the 3 languages I know the least about, a common trend with these 3
languages (Cpp, Zig, Rust) is that they have a bloated feature set.
Not that I have a problem with that, I love C#. But compared to Odin that 
has a quite medium sized overview file with every and all features you will ever use as their home page,
Rust feels monolitic with no other entry then from the top.
This may all change, whether that be me or Rust.

### My unbiased opinion of Odin lang

Odin <3

### Update about my unbiased opinion of Odin lang

I have now spent a good chunk of 6 months only using Odin. I still think it's great!
I have lurked in the Odin discord and even asked the creator ginger bill for clarification of design decisions.
If you want to know anything about the language the home page is just a large overview listing every feature of the language.
This approach to documentation has been Odin's strongest favor for me. CTRL+F anything from that page and you will see what, how and why.
The syntax is great, the speed is fair and the tooling works...
One perk of Odin that suprised me is that since there is often only one way to do a primitive thing, it is really easy 
to read other peoples code. Since thier code will most likely end up looking like you own code in some strange ways.
It's hard to explain but something like the fact that "while" is removed in favor of a empty "for" loop means that 
all loops follow the same syntax and style. Instead of the brain-gymnastic syntax of "do {} while ()" loops from C-like 
languages that you might be unfortunate enought to find sometimes.

However, it's the least popular of the languages that I use and have tested, and that is a noticeable fact 
while programming since premade solutions to something often ends up being me translating C examples.
And one thing I miss from my poor primitive Odin is a way to make complex types, like C#'s interfaces or Rust's traits which I like a lot.
