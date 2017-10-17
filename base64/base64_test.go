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

func BenchmarkEncodeSIMD(b *testing.B) {
	randomCrap := make([]byte, 2048)
	_, err := rand.Read(randomCrap)
	if err != nil {
		b.Fatal(err)
	}
	for i := 0; i < b.N; i++ {
		StdEncoding.EncodeToString(randomCrap)
		b.SetBytes(2048)
	}
}

func BenchmarkEncodeStdlib(b *testing.B) {
	randomCrap := make([]byte, 2048)
	_, err := rand.Read(randomCrap)
	if err != nil {
		b.Fatal(err)
	}
	for i := 0; i < b.N; i++ {
		base64.StdEncoding.EncodeToString(randomCrap)
		b.SetBytes(2048)
	}
}

func BenchmarkDecodeSIMD(b *testing.B) {
	randomCrap := make([]byte, 2048)
	_, err := rand.Read(randomCrap)
	if err != nil {
		b.Fatal(err)
	}
	randomCrapBase := base64.StdEncoding.EncodeToString(randomCrap)
	for i := 0; i < b.N; i++ {
		StdEncoding.DecodeString(randomCrapBase)
		b.SetBytes(2048)
	}
}

func BenchmarkDecodeStdlib(b *testing.B) {
	randomCrap := make([]byte, 2048)
	_, err := rand.Read(randomCrap)
	if err != nil {
		b.Fatal(err)
	}
	randomCrapBase := StdEncoding.EncodeToString(randomCrap)
	for i := 0; i < b.N; i++ {
		base64.StdEncoding.DecodeString(randomCrapBase)
		b.SetBytes(2048)
	}
}
