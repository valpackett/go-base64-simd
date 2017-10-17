CC=clang-devel
EXTRA_CFLAGS?= -march=sandybridge
CFLAGS= -O3 -pipe -fPIC -std=c99 \
				 -mno-red-zone -mstackrealign -mllvm -inline-threshold=5000 \
				 -fno-asynchronous-unwind-tables -fno-jump-tables \
				 $(EXTRA_CFLAGS) \
				 -msse3 -msse4.1 -msse4.2 -mavx -mavx2
BASE64_PATH?= $(HOME)/src/github.com/aklomp/base64
BASE64_SRCS!= find $(BASE64_PATH)/lib -type f -name '*.c'

base64_amd64.syso: ../c/combo.c ../c/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) -I$(BASE64_PATH)/lib -I../c -c -o $@ ../c/combo.c
