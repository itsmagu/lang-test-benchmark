package main

import "base:runtime"
// import win "core:sys/windows"
import os "core:os/os2"

main :: proc(){
	// stdout := win.GetStdHandle(win.STD_OUTPUT_HANDLE)
	// str : string = "Hi Planet\n"
	// data := transmute([]u8)str
	// write_len : u32 = 0
	// _ = win.WriteFile(stdout,&data,cast(u32)len(data),&write_len,nil)
	os.write_string(os.stdout,"Hi Planet\n")

	args := runtime.args__
	if len(args) > 1 {
		// win.WriteFile(stdout,&arg,cast(u32)len(arg),&write_len,nil)
		os.write_string(os.stdout,"Also passed with ")
		os.write_string(os.stdout,string(args[1]))
	}
}
