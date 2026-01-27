package main

import "core:fmt"

main :: proc(){

	x: f32
	y: f32
	z: f32
	dim: i32
	offset: i32

	for j in 0..<6 {
		for i in 0..<12{
			x += 1
			y += x
			z *= (x*y)
		}

		dim = i32(x + y)
		offset = i32(x) * dim
		z = f32(dim + (2/dim))

		fmt.printfln("%f %f %f %d %d",x,y,z,dim,offset)
	}
	// Ahhhhh, Odin lang. Paradise on earth! Took about 2 min to make :)
}
