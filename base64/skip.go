package base64

import "bytes"

func nextSkippable(s []byte) int {
	return bytes.IndexAny(s, " \t\r\n!")
}

func SkipPrepass(body []byte) []byte {
	remainder := body[:]
	result := make([]byte, len(body))
	nextIdx := nextSkippable(remainder)
	for nextIdx != -1 {
		result = append(result, remainder[:nextIdx]...)
		remainder = remainder[nextIdx+1:]
		nextIdx = nextSkippable(remainder)
	}
	result = append(result, remainder...)
	return result
}
