package base64

// #include <stdlib.h>
// size_t next_skippable(const char *s, size_t len);
import "C"
import "unsafe"

func nextSkippable(s []byte) int {
	return (int)(C.next_skippable(
		((*C.char)(unsafe.Pointer(&s[0]))),
		C.size_t(len(s)),
	))
}
