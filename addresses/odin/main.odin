package main

import "core:fmt"

main::proc(){
	nice()
	cool()
	moveMe()
	
	fmt.printf("main %p \n\t%d from cool\n",cast(rawptr)main,calcPtrDist(cast(rawptr)main,cast(rawptr)cool))
	fmt.printf("cool %p \n\t%d from nice\n",cast(rawptr)cool,calcPtrDist(cast(rawptr)cool,cast(rawptr)nice))
	fmt.printf("nice %p \n\t%d from main\n",cast(rawptr)nice,calcPtrDist(cast(rawptr)nice,cast(rawptr)main))
}

moveMe::proc(){
	fmt.print("moveMe\n")
}

nice::proc(){
	fmt.print("nice\n")
}

cool::proc(){
	fmt.print("cool\n")
}

calcPtrDist::proc(a: rawptr, b: rawptr) -> int{
	a := cast(int)cast(uintptr)a
	b := cast(int)cast(uintptr)b

	if a > b do return a - b
	else do return b - a
}
