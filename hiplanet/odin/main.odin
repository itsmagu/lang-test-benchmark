package main

import "core:fmt"
import "core:os"

main :: proc(){
	fmt.println("Hi Planet")
	if len(os.args) > 1 do fmt.printfln("Also passed with %s",os.args[1])
}
