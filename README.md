[PFFFT, a pretty fast Fourier Transform](https://bitbucket.org/jpommier/pffft/) bindings for [Odin](https://odin-lang.org/).

### Example:

```odin

import "core:c"
import "./odin-pffft"

fft: []complex64
samples: []f32

pffft_setup := pffft.new_setup(c.int(fft_size), pffft.Transform.REAL)
assert(pffft_setup != nil) // fft_size a multiple of 32, factors of 2, 3 and 5 only
defer pffft.destroy_setup(pffft_setup)

pffft.transform_ordered(
    pffft_setup,
    raw_data(samples),
    cast(^f32) raw_data(fft),
    nil,
    pffft.Direction.FORWARD
)

```

### Building pffft on MacOS/Linux:
```sh
clang pffft.c pffft.h -c -O2 -Os -fPIC
ar rcs pffft.a pffft.o
```


### Building pffft on Windows with MSVC:

```sh
cl /c /O2 /Fo:pffft.obj pffft.c
lib /OUT:pffft.lib pffft.obj
```
