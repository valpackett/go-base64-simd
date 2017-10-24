CC=clang-devel
AMD64FLAGS?= -target x86_64-unknown-none -march=sandybridge -mno-red-zone
386FLAGS?= -target i386-unknown-none
ARMFLAGS?= -target armv7-unknown-none-gnueabi -mfpu=neon
ARM64FLAGS?= -target aarch64-unknown-none -march=armv8-a
PPCFLAGS?= -target powerpc-unknown-none
PPC64FLAGS?= -target powerpc64-unknown-none
CFLAGS= -O3 -pipe -fPIC -std=c99 \
				 -mstackrealign -mllvm -inline-threshold=5000 \
				 -fno-asynchronous-unwind-tables -fno-jump-tables \
				 $(EXTRA_CFLAGS)
BASE64_PATH?= $(HOME)/src/github.com/aklomp/base64
BASE64_SRCS!= find $(BASE64_PATH)/lib -type f -name '*.c'

noconfig:
	rm -f $(BASE64_PATH)/lib/config.h

avx2_amd64.syso: ../c/avx2/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(AMD64FLAGS) -mavx2 -I$(BASE64_PATH)/lib -I../c/avx2 -c -o $@ $(BASE64_PATH)/lib/arch/avx2/codec.c

avx2_386.syso: ../c/avx2/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(386FLAGS) -I$(BASE64_PATH)/lib -I../c/generic -c -o $@ $(BASE64_PATH)/lib/arch/avx2/codec.c

avx2_ppc.syso: ../c/avx2/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(ppcFLAGS) -I$(BASE64_PATH)/lib -I../c/generic -c -o $@ $(BASE64_PATH)/lib/arch/avx2/codec.c

avx2_ppc64.syso: ../c/avx2/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(ppc64FLAGS) -I$(BASE64_PATH)/lib -I../c/generic -c -o $@ $(BASE64_PATH)/lib/arch/avx2/codec.c

avx2_arm.syso: ../c/avx2/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(armFLAGS) -I$(BASE64_PATH)/lib -I../c/generic -c -o $@ $(BASE64_PATH)/lib/arch/avx2/codec.c

avx2_arm64.syso: ../c/avx2/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(arm64FLAGS) -I$(BASE64_PATH)/lib -I../c/generic -c -o $@ $(BASE64_PATH)/lib/arch/avx2/codec.c


generic_amd64.syso: ../c/generic/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(AMD64FLAGS) -I$(BASE64_PATH)/lib -I../c/generic -c -o $@ $(BASE64_PATH)/lib/arch/generic/codec.c

generic_386.syso: ../c/generic/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(386FLAGS) -I$(BASE64_PATH)/lib -I../c/generic -c -o $@ $(BASE64_PATH)/lib/arch/generic/codec.c

generic_ppc64.syso: ../c/generic/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(PPC64FLAGS) -I$(BASE64_PATH)/lib -I../c/generic -c -o $@ $(BASE64_PATH)/lib/arch/generic/codec.c

generic_ppc.syso: ../c/generic/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(PPCFLAGS) -I$(BASE64_PATH)/lib -I../c/generic -c -o $@ $(BASE64_PATH)/lib/arch/generic/codec.c

generic_arm.syso: ../c/generic/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(ARMFLAGS) -I$(BASE64_PATH)/lib -I../c/generic -c -o $@ $(BASE64_PATH)/lib/arch/generic/codec.c

generic_arm64.syso: ../c/generic/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(ARM64FLAGS) -I$(BASE64_PATH)/lib -I../c/generic -c -o $@ $(BASE64_PATH)/lib/arch/generic/codec.c


neon32_amd64.syso: ../c/neon32/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(AMD64FLAGS) -I$(BASE64_PATH)/lib -I../c/generic -c -o $@ $(BASE64_PATH)/lib/arch/neon32/codec.c

neon32_386.syso: ../c/neon32/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(386FLAGS) -I$(BASE64_PATH)/lib -I../c/generic -c -o $@ $(BASE64_PATH)/lib/arch/neon32/codec.c

neon32_ppc64.syso: ../c/neon32/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(PPC64FLAGS) -I$(BASE64_PATH)/lib -I../c/generic -c -o $@ $(BASE64_PATH)/lib/arch/neon32/codec.c

neon32_ppc.syso: ../c/neon32/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(PPCFLAGS) -I$(BASE64_PATH)/lib -I../c/generic -c -o $@ $(BASE64_PATH)/lib/arch/neon32/codec.c

neon32_arm64.syso: ../c/neon32/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(ARM64FLAGS) -I$(BASE64_PATH)/lib -I../c/generic -c -o $@ $(BASE64_PATH)/lib/arch/neon32/codec.c

neon32_arm.syso: ../c/neon32/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(ARMFLAGS) -I$(BASE64_PATH)/lib -I../c/neon32 -c -o $@ $(BASE64_PATH)/lib/arch/neon32/codec.c


neon64_amd64.syso: ../c/neon64/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(AMD64FLAGS) -I$(BASE64_PATH)/lib -I../c/generic -c -o $@ $(BASE64_PATH)/lib/arch/neon64/codec.c

neon64_386.syso: ../c/neon64/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(386FLAGS) -I$(BASE64_PATH)/lib -I../c/generic -c -o $@ $(BASE64_PATH)/lib/arch/neon64/codec.c

neon64_ppc64.syso: ../c/neon64/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(PPC64FLAGS) -I$(BASE64_PATH)/lib -I../c/generic -c -o $@ $(BASE64_PATH)/lib/arch/neon64/codec.c

neon64_ppc.syso: ../c/neon64/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(PPCFLAGS) -I$(BASE64_PATH)/lib -I../c/generic -c -o $@ $(BASE64_PATH)/lib/arch/neon64/codec.c

neon64_arm64.syso: ../c/neon64/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(ARM64FLAGS) -I$(BASE64_PATH)/lib -I../c/neon64 -c -o $@ $(BASE64_PATH)/lib/arch/neon64/codec.c

neon64_arm.syso: ../c/neon64/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(ARMFLAGS) -I$(BASE64_PATH)/lib -I../c/generic -c -o $@ $(BASE64_PATH)/lib/arch/neon64/codec.c


ssse3_amd64.syso: ../c/ssse3/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(AMD64FLAGS) -mssse3 -I$(BASE64_PATH)/lib -I../c/ssse3 -c -o $@ $(BASE64_PATH)/lib/arch/ssse3/codec.c

ssse3_386.syso: ../c/ssse3/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(386FLAGS) -I$(BASE64_PATH)/lib -I../c/generic -c -o $@ $(BASE64_PATH)/lib/arch/ssse3/codec.c

ssse3_ppc64.syso: ../c/ssse3/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(PPC64FLAGS) -I$(BASE64_PATH)/lib -I../c/generic -c -o $@ $(BASE64_PATH)/lib/arch/ssse3/codec.c

ssse3_ppc.syso: ../c/ssse3/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(PPCFLAGS) -I$(BASE64_PATH)/lib -I../c/generic -c -o $@ $(BASE64_PATH)/lib/arch/ssse3/codec.c

ssse3_arm.syso: ../c/ssse3/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(ARMFLAGS) -I$(BASE64_PATH)/lib -I../c/generic -c -o $@ $(BASE64_PATH)/lib/arch/ssse3/codec.c

ssse3_arm64.syso: ../c/ssse3/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(ARM64FLAGS) -I$(BASE64_PATH)/lib -I../c/generic -c -o $@ $(BASE64_PATH)/lib/arch/ssse3/codec.c


sse41_amd64.syso: ../c/sse41/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(AMD64FLAGS) -msse4.1 -I$(BASE64_PATH)/lib -I../c/sse41 -c -o $@ $(BASE64_PATH)/lib/arch/sse41/codec.c

sse41_386.syso: ../c/sse41/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(386FLAGS) -I$(BASE64_PATH)/lib -I../c/generic -c -o $@ $(BASE64_PATH)/lib/arch/sse41/codec.c

sse41_ppc64.syso: ../c/sse41/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(ppc64FLAGS) -I$(BASE64_PATH)/lib -I../c/generic -c -o $@ $(BASE64_PATH)/lib/arch/sse41/codec.c

sse41_ppc.syso: ../c/sse41/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(ppcFLAGS) -I$(BASE64_PATH)/lib -I../c/generic -c -o $@ $(BASE64_PATH)/lib/arch/sse41/codec.c

sse41_arm64.syso: ../c/sse41/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(arm64FLAGS) -I$(BASE64_PATH)/lib -I../c/generic -c -o $@ $(BASE64_PATH)/lib/arch/sse41/codec.c

sse41_arm.syso: ../c/sse41/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(armFLAGS) -I$(BASE64_PATH)/lib -I../c/generic -c -o $@ $(BASE64_PATH)/lib/arch/sse41/codec.c


sse42_amd64.syso: ../c/sse42/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(AMD64FLAGS) -msse4.2 -I$(BASE64_PATH)/lib -I../c/sse42 -c -o $@ $(BASE64_PATH)/lib/arch/sse42/codec.c

sse42_386.syso: ../c/sse42/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(386FLAGS) -I$(BASE64_PATH)/lib -I../c/generic -c -o $@ $(BASE64_PATH)/lib/arch/sse42/codec.c

sse42_ppc64.syso: ../c/sse42/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(PPC64FLAGS) -I$(BASE64_PATH)/lib -I../c/generic -c -o $@ $(BASE64_PATH)/lib/arch/sse42/codec.c

sse42_ppc.syso: ../c/sse42/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(PPCFLAGS) -I$(BASE64_PATH)/lib -I../c/generic -c -o $@ $(BASE64_PATH)/lib/arch/sse42/codec.c

sse42_arm64.syso: ../c/sse42/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(ARM64FLAGS) -I$(BASE64_PATH)/lib -I../c/generic -c -o $@ $(BASE64_PATH)/lib/arch/sse42/codec.c

sse42_arm.syso: ../c/sse42/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(ARMFLAGS) -I$(BASE64_PATH)/lib -I../c/generic -c -o $@ $(BASE64_PATH)/lib/arch/sse42/codec.c


avx_amd64.syso: ../c/avx/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(AMD64FLAGS) -mavx -I$(BASE64_PATH)/lib -I../c/avx -c -o $@ $(BASE64_PATH)/lib/arch/avx/codec.c

avx_386.syso: ../c/avx/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(386FLAGS) -I$(BASE64_PATH)/lib -I../c/generic -c -o $@ $(BASE64_PATH)/lib/arch/avx/codec.c

avx_ppc64.syso: ../c/avx/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(PPC64FLAGS) -I$(BASE64_PATH)/lib -I../c/generic -c -o $@ $(BASE64_PATH)/lib/arch/avx/codec.c

avx_ppc.syso: ../c/avx/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(PPCFLAGS) -I$(BASE64_PATH)/lib -I../c/generic -c -o $@ $(BASE64_PATH)/lib/arch/avx/codec.c

avx_arm64.syso: ../c/avx/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(ARM64FLAGS) -I$(BASE64_PATH)/lib -I../c/generic -c -o $@ $(BASE64_PATH)/lib/arch/avx/codec.c

avx_arm.syso: ../c/avx/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(ARMFLAGS) -I$(BASE64_PATH)/lib -I../c/generic -c -o $@ $(BASE64_PATH)/lib/arch/avx/codec.c


lib_amd64.syso: ../c/amd64_all/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(AMD64FLAGS) -I$(BASE64_PATH)/lib -I../c/amd64_all -c -o $@ $(BASE64_PATH)/lib/lib.c

lib_386.syso: ../c/generic/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(386FLAGS) -I$(BASE64_PATH)/lib -I../c/generic -c -o $@ $(BASE64_PATH)/lib/lib.c

lib_ppc64.syso: ../c/generic/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(PPC64FLAGS) -I$(BASE64_PATH)/lib -I../c/generic -c -o $@ $(BASE64_PATH)/lib/lib.c

lib_ppc.syso: ../c/generic/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(PPCFLAGS) -I$(BASE64_PATH)/lib -I../c/generic -c -o $@ $(BASE64_PATH)/lib/lib.c

lib_arm.syso: ../c/neon32/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(ARMFLAGS) -I$(BASE64_PATH)/lib -I../c/neon32 -c -o $@ $(BASE64_PATH)/lib/lib.c

lib_arm64.syso: ../c/neon64/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(ARM64FLAGS) -I$(BASE64_PATH)/lib -I../c/neon64 -c -o $@ $(BASE64_PATH)/lib/lib.c


codec_choose_amd64.syso: ../c/amd64_all/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(AMD64FLAGS) -I$(BASE64_PATH)/lib -I../c/amd64_all -c -o $@ $(BASE64_PATH)/lib/codec_choose.c

codec_choose_386.syso: ../c/generic/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(386FLAGS) -I$(BASE64_PATH)/lib -I../c/generic -c -o $@ $(BASE64_PATH)/lib/codec_choose.c

codec_choose_ppc64.syso: ../c/generic/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(PPC64FLAGS) -I$(BASE64_PATH)/lib -I../c/generic -c -o $@ $(BASE64_PATH)/lib/codec_choose.c

codec_choose_ppc.syso: ../c/generic/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(PPCFLAGS) -I$(BASE64_PATH)/lib -I../c/generic -c -o $@ $(BASE64_PATH)/lib/codec_choose.c

codec_choose_arm.syso: ../c/neon32/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(ARMFLAGS) -I$(BASE64_PATH)/lib -I../c/neon32 -c -o $@ $(BASE64_PATH)/lib/codec_choose.c

codec_choose_arm64.syso: ../c/neon64/config.h Makefile $(BASE64_SRCS)
	$(CC) $(CFLAGS) $(ARM64FLAGS) -I$(BASE64_PATH)/lib -I../c/neon64 -c -o $@ $(BASE64_PATH)/lib/codec_choose.c

.PHONY: noconfig

all: noconfig \
	avx2_amd64.syso avx2_386.syso avx2_ppc64.syso avx2_ppc.syso avx2_arm64.syso avx2_arm.syso \
	generic_amd64.syso generic_386.syso generic_ppc64.syso generic_ppc.syso generic_arm64.syso generic_arm.syso \
	neon32_amd64.syso neon32_386.syso neon32_ppc64.syso neon32_ppc.syso neon32_arm64.syso neon32_arm.syso \
	neon64_amd64.syso neon64_386.syso neon64_ppc64.syso neon64_ppc.syso neon64_arm64.syso neon64_arm.syso \
	ssse3_amd64.syso ssse3_386.syso ssse3_ppc64.syso ssse3_ppc.syso ssse3_arm64.syso ssse3_arm.syso \
	sse41_amd64.syso sse41_386.syso sse41_ppc64.syso sse41_ppc.syso sse41_arm64.syso sse41_arm.syso \
	sse42_amd64.syso sse42_386.syso sse42_ppc64.syso sse42_ppc.syso sse42_arm64.syso sse42_arm.syso \
	avx_amd64.syso avx_386.syso avx_ppc64.syso avx_ppc.syso avx_arm64.syso avx_arm.syso \
	lib_amd64.syso lib_386.syso lib_ppc64.syso lib_ppc.syso lib_arm64.syso lib_arm.syso \
	codec_choose_amd64.syso codec_choose_386.syso codec_choose_ppc64.syso codec_choose_ppc.syso codec_choose_arm64.syso codec_choose_arm.syso
