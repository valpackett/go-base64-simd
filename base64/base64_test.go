package base64

import (
	"crypto/rand"
	"encoding/base64"
	"reflect"
	"testing"
)

func sameEncode(data []byte, t *testing.T) {
	ours := StdEncoding.EncodeToString(data)
	theirs := base64.StdEncoding.EncodeToString(data)
	if ours != theirs {
		t.Fatalf("our %s != their %s\n", ours, theirs)
	}
}

func TestEncode(t *testing.T) {
	sameEncode([]byte{}, t)
	sameEncode([]byte{0}, t)
	sameEncode([]byte{0, 1}, t)
	sameEncode([]byte{0, 1, 2}, t)
	sameEncode([]byte{0, 1, 2, 3}, t)
	sameEncode([]byte{0, 1, 2, 3, 4}, t)
	sameEncode([]byte{0, 1, 2, 3, 4, 5}, t)
	sameEncode([]byte{0, 1, 2, 3, 4, 5, 6}, t)
	sameEncode([]byte{0, 1, 2, 3, 4, 5, 6, 7}, t)
}

func sameDecode(data string, t *testing.T) {
	ours, err := StdEncoding.DecodeString(data)
	if err != nil {
		t.Fatal(err)
	}
	theirs, err := base64.StdEncoding.DecodeString(data)
	if err != nil {
		t.Fatal(err)
	}
	if !reflect.DeepEqual(ours, theirs) {
		t.Fatalf("our %s != their %s\n", ours, theirs)
	}
}

func TestDecode(t *testing.T) {
	sameDecode("", t)
	sameDecode("Zg==", t)
	sameDecode("Zm8=", t)
	sameDecode("Zm9v", t)
	sameDecode("Zm9vYg==", t)
	sameDecode("Zm9vYmE=", t)
	sameDecode("Zm9vYmFy", t)
}

func BenchmarkEncodeStdlib(b *testing.B) {
	randomCrap := make([]byte, 2048)
	_, err := rand.Read(randomCrap)
	if err != nil {
		b.Fatal(err)
	}
	randomCrapBase := make([]byte, base64.StdEncoding.EncodedLen(len(randomCrap)))
	for i := 0; i < b.N; i++ {
		base64.StdEncoding.Encode(randomCrapBase, randomCrap)
		b.SetBytes(2048)
	}
}

func BenchmarkEncodeSIMD(b *testing.B) {
	randomCrap := make([]byte, 2048)
	_, err := rand.Read(randomCrap)
	if err != nil {
		b.Fatal(err)
	}
	randomCrapBase := make([]byte, base64.StdEncoding.EncodedLen(len(randomCrap)))
	for i := 0; i < b.N; i++ {
		StdEncoding.Encode(randomCrapBase, randomCrap)
		b.SetBytes(2048)
	}
}

func BenchmarkDecodeStdlib(b *testing.B) {
	randomCrap := make([]byte, 2048)
	_, err := rand.Read(randomCrap)
	if err != nil {
		b.Fatal(err)
	}
	randomCrapBase := make([]byte, base64.StdEncoding.EncodedLen(len(randomCrap)))
	StdEncoding.Encode(randomCrapBase, randomCrap)
	randomCrap2 := make([]byte, base64.StdEncoding.DecodedLen(len(randomCrapBase)))
	for i := 0; i < b.N; i++ {
		base64.StdEncoding.Decode(randomCrap2, randomCrapBase)
		b.SetBytes(2048)
	}
}

func BenchmarkDecodeSIMD(b *testing.B) {
	randomCrap := make([]byte, 2048)
	_, err := rand.Read(randomCrap)
	if err != nil {
		b.Fatal(err)
	}
	randomCrapBase := make([]byte, base64.StdEncoding.EncodedLen(len(randomCrap)))
	StdEncoding.Encode(randomCrapBase, randomCrap)
	randomCrap2 := make([]byte, base64.StdEncoding.DecodedLen(len(randomCrapBase)))
	for i := 0; i < b.N; i++ {
		StdEncoding.Decode(randomCrap2, randomCrapBase)
		b.SetBytes(2048)
	}
}

func BenchmarkDecodeSIMDWithSkipPrepassNoSpace(b *testing.B) {
	randomCrap := make([]byte, 2048)
	_, err := rand.Read(randomCrap)
	if err != nil {
		b.Fatal(err)
	}
	randomCrapBase := make([]byte, base64.StdEncoding.EncodedLen(len(randomCrap)))
	base64.StdEncoding.Encode(randomCrapBase, randomCrap)
	randomCrap2 := make([]byte, base64.StdEncoding.DecodedLen(len(randomCrapBase)))
	for i := 0; i < b.N; i++ {
		StdEncoding.Decode(randomCrap2, SkipPrepass(randomCrapBase))
		b.SetBytes(2048)
	}
}

func BenchmarkDecodeSIMDWithSkipPrepassLineWrapped(b *testing.B) {
	randomCrap := make([]byte, 2048)
	_, err := rand.Read(randomCrap)
	if err != nil {
		b.Fatal(err)
	}
	randomCrapBasePre := make([]byte, base64.StdEncoding.EncodedLen(len(randomCrap)))
	base64.StdEncoding.Encode(randomCrapBasePre, randomCrap)
	randomCrapBase := make([]byte, 0)
	for k := len(randomCrapBasePre); k >= 80; k -= 80 {
		randomCrapBase = append(randomCrapBase, randomCrapBasePre[:80]...)
		randomCrapBase = append(randomCrapBase, '\n')
		randomCrapBasePre = randomCrapBasePre[80:]
	}
	randomCrapBase = append(randomCrapBase, randomCrapBasePre...)
	rcbLen := int64(len(randomCrapBase))
	randomCrap2 := make([]byte, base64.StdEncoding.DecodedLen(len(randomCrapBase)))
	for i := 0; i < b.N; i++ {
		StdEncoding.Decode(randomCrap2, SkipPrepass(randomCrapBase))
		b.SetBytes(rcbLen)
	}
}
