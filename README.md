[Pffft](https://bitbucket.org/jpommier/pffft/) bindings for [Odin](https://odin-lang.org/).

Example:

```odin

import "./odin-pffft"

fft: []complex64
samples: []f32

pffft_setup := pffft.new_setup(fft_size, pffft.Transform.REAL)
defer pffft.destroy_setup(pffft_setup)

pffft.transform_ordered(
    pffft_setup,
    raw_data(samples),
    raw_data(mem.slice_data_cast([]f32, fft)),
    nil,
    pffft.Direction.FORWARD
)

```