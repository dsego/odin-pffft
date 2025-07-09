[PFFFT, a pretty fast Fourier Transform](https://bitbucket.org/jpommier/pffft/) bindings for [Odin](https://odin-lang.org/).

### Example:

```odin

import "./odin-pffft"

fft: []complex64
samples: []f32

pffft_setup := pffft.new_setup(fft_size, pffft.Transform.REAL)
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
