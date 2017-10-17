package base64

import (
	"unsafe"
)

//go:noescape
func _base64_stream_encode_avx(base64_state, src unsafe.Pointer, srclen uint64, out, outlen unsafe.Pointer)

//go:noescape
func _base64_stream_decode_avx(base64_state, src unsafe.Pointer, srclen uint64, out, outlen unsafe.Pointer)
