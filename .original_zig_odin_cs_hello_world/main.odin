package main

import "core:fmt"
import "base:runtime"

main :: proc() {
    args := runtime.args__
    name := len(args) > 1 ? args[1] : ""
	fmt.printf("Hello world %s!\n", name)
}
