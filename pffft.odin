package pffft


when ODIN_OS == .Darwin || ODIN_OS == .Linux {
	// Building pffft on MacOS:
	//    clang pffft.c pffft.h -c -O2 -Os -fPIC
	//    ar rcs pffft.a pffft.o
	foreign import lib "pffft.a"

} else when ODIN_OS == .Windows {
	// Building on Windows with MSVC:
	//  cl /c /O2 /Fo:pffft.obj pffft.c
	//  lib /OUT:pffft.lib pffft.obj
	foreign import lib "pffft.lib"
}

Direction :: enum {
	FORWARD,
	BACKWARD,
}

Transform :: enum {
	REAL,
	COMPLEX,
}

@(default_calling_convention = "c", link_prefix = "pffft_")
foreign lib {
	new_setup :: proc(N: int, transform: Transform) -> rawptr ---
	destroy_setup :: proc(setup: rawptr) ---
	transform :: proc(setup: rawptr, input: [^]f32, output: [^]f32, work: [^]f32, direction: Direction) ---
	transform_ordered :: proc(setup: rawptr, input: [^]f32, output: [^]f32, work: [^]f32, direction: Direction) ---
	zreorder :: proc(setup: rawptr, input: [^]f32, output: [^]f32, direction: Direction) ---
	zconvolve_accumulate :: proc(setup: rawptr, dft_a: [^]f32, dft_b: [^]f32, dft_ab: [^]f32, scaling: f32) ---
	aligned_malloc :: proc(nb_bytes: uint) -> rawptr ---
	aligned_free :: proc(setup: rawptr) ---
	simd_size :: proc() -> int ---
}
