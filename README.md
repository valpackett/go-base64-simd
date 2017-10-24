# go-base64-simd

A nearly drop-in replacement for [Go's slow-ass base64 implementation](https://github.com/golang/go/issues/19636), using [aklomp/base64, an awesome SIMD-accelerated library](https://github.com/aklomp/base64).

```
AMD Ryzen 7 1700 @ 3.9 GHz (AVX2)
go 1.9.1, FreeBSD 12-CURRENT
BenchmarkEncodeSIMD-16           2000000               911 ns/op        2246.98 MB/s
BenchmarkEncodeStdlib-16         1000000              2217 ns/op         923.47 MB/s
BenchmarkDecodeSIMD-16           1000000              1031 ns/op        1984.91 MB/s
BenchmarkDecodeStdlib-16          200000              6687 ns/op         306.24 MB/s
```

```
Intel Xeon E3-1220 @ 3.10GHz (AVX)
go 1.8.3, Linux 3.10.0
BenchmarkEncodeSIMD-4             500000              2480 ns/op         825.75 MB/s
BenchmarkEncodeStdlib-4           200000              6693 ns/op         305.97 MB/s
BenchmarkDecodeSIMD-4             500000              2541 ns/op         805.91 MB/s
BenchmarkDecodeStdlib-4            50000             31478 ns/op          65.06 MB/s
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
