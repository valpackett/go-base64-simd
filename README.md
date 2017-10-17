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

## Internals

The C library [was modified to allow unity builds](https://github.com/myfreeweb/base64).

This should use assembly but currently uses cgo.

Initially I attempted to use the terrible yet amazing [c2goasm](https://github.com/minio/c2goasm) hack.
It does not support global array constants.
I've tried to bolt that on, but couldn't figure out how to express addressing like `mov al, byte ptr [rax + base64_table_enc]` in Go's horrific assembly syntax.

Then I've discovered the `.syso` thing where you can link to objects assembled by a reasonable assembler.
Gave up fighting the crashes that came with that approach, using cgo for now, but still with the `.syso` file.

## License

BSD, like the original aklomp/base64 C library.
