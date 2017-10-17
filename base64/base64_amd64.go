package base64

import (
	"errors"
	"unsafe"
)

// #include <stdlib.h>
// struct base64_state;
// void base64_encode(const char *src, size_t srclen, char *out, size_t *outlen, int flags);
//  int base64_decode(const char *src, size_t srclen, char *out, size_t *outlen, int flags);
import "C"

type Encoding struct{}

var StdEncoding = &Encoding{}
var DecodeError = errors.New("could not decode base64")

func (_ *Encoding) Encode(dst, src []byte) {
	if len(src) < 1 {
		return
	}
	dstlen := C.size_t(0)
	C.base64_encode(
		((*C.char)(unsafe.Pointer(&src[0]))),
		C.size_t(len(src)),
		((*C.char)(unsafe.Pointer(&dst[0]))),
		&dstlen,
		0,
	)
}

func (enc *Encoding) EncodeToString(src []byte) string {
	buf := make([]byte, enc.EncodedLen(len(src)))
	enc.Encode(buf, src)
	return string(buf)
}

func (_ *Encoding) EncodedLen(n int) int {
	return (n + 2) / 3 * 4
}

func (_ *Encoding) Decode(dst, src []byte) (n int, err error) {
	if len(src) < 1 {
		return 0, nil
	}
	dstlen := C.size_t(0)
	result := C.base64_decode(
		((*C.char)(unsafe.Pointer(&src[0]))),
		C.size_t(len(src)),
		((*C.char)(unsafe.Pointer(&dst[0]))),
		&dstlen,
		0,
	)
	if result != 1 {
		return int(dstlen), DecodeError
	}
	return int(dstlen), nil
}

func (enc *Encoding) DecodeString(s string) ([]byte, error) {
	dbuf := make([]byte, enc.DecodedLen(len(s)))
	n, err := enc.Decode(dbuf, []byte(s))
	return dbuf[:n], err
}

func (_ *Encoding) DecodedLen(n int) int {
	return n / 4 * 3
}
