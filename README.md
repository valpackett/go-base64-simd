# go-base64-simd

A nearly drop-in replacement for [Go's slow-ass base64 implementation](https://github.com/golang/go/issues/19636), using [aklomp/base64, an awesome SIMD-accelerated library](https://github.com/aklomp/base64).

However, it does not skip whitespace and other junk characters!
`SkipPrepass` is provided to deal with that, but it slows everything down.
(Still up to 2x as fast as the standard library.)

```
AMD Ryzen 7 1700 @ 3.9 GHz (AVX2)
go 1.9.1, FreeBSD 12-CURRENT
BenchmarkEncodeStdlib-16                           1000000  1600 ns/op  1279.65 MB/s
BenchmarkEncodeSIMD-16                             5000000   321 ns/op  6361.63 MB/s
BenchmarkDecodeStdlib-16                            200000  6499 ns/op   315.10 MB/s
BenchmarkDecodeSIMD-16                             3000000   455 ns/op  4500.07 MB/s
BenchmarkDecodeSIMDWithSkipPrepassNoSpace-16        500000  2850 ns/op   718.45 MB/s
BenchmarkDecodeSIMDWithSkipPrepassLineWrapped-16    300000  5432 ns/op   509.20 MB/s
```

```
Intel Xeon E3-1220 @ 3.10GHz (AVX)
go 1.8.3, Linux 3.10.0
BenchmarkEncodeStdlib-4                             500000  2474 ns/op   827.64 MB/s
BenchmarkEncodeSIMD-4                              3000000   481 ns/op  4257.22 MB/s
BenchmarkDecodeStdlib-4                             100000 13995 ns/op   146.33 MB/s
BenchmarkDecodeSIMD-4                              3000000   531 ns/op  3851.89 MB/s
BenchmarkDecodeSIMDWithSkipPrepassNoSpace-4         200000  6913 ns/op   296.23 MB/s
BenchmarkDecodeSIMDWithSkipPrepassLineWrapped-4     200000  9869 ns/op   280.26 MB/s
```

## Internals

This should use assembly but currently uses cgo.

Initially I attempted to use the terrible yet amazing [c2goasm](https://github.com/minio/c2goasm) hack.
It does not support global array constants.
I've tried to bolt that on, but couldn't figure out how to express addressing like `mov al, byte ptr [rax + base64_table_enc]` in Go's horrific assembly syntax.

Then I've discovered the `.syso` thing where you can link to objects assembled by a reasonable assembler.
Gave up fighting the crashes that came with that approach, using cgo for now, but still with the `.syso` file.

## License

BSD, like the original aklomp/base64 C library.
