package main

import "core:fmt"
import "base:runtime"

main :: proc(){
	fmt.println("Hi Planet")
	args := runtime.args__
	if len(args) > 1 {
		fmt.printfln("Also passed with %s",args[1])
	}
}
