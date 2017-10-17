	.text
	.intel_syntax noprefix
	.file	"combo.c"
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4               # -- Begin function base64_stream_encode_avx
.LCPI0_0:
	.byte	1                       # 0x1
	.byte	0                       # 0x0
	.byte	2                       # 0x2
	.byte	1                       # 0x1
	.byte	4                       # 0x4
	.byte	3                       # 0x3
	.byte	5                       # 0x5
	.byte	4                       # 0x4
	.byte	7                       # 0x7
	.byte	6                       # 0x6
	.byte	8                       # 0x8
	.byte	7                       # 0x7
	.byte	10                      # 0xa
	.byte	9                       # 0x9
	.byte	11                      # 0xb
	.byte	10                      # 0xa
.LCPI0_1:
	.short	64512                   # 0xfc00
	.short	4032                    # 0xfc0
	.short	64512                   # 0xfc00
	.short	4032                    # 0xfc0
	.short	64512                   # 0xfc00
	.short	4032                    # 0xfc0
	.short	64512                   # 0xfc00
	.short	4032                    # 0xfc0
.LCPI0_2:
	.short	64                      # 0x40
	.short	1024                    # 0x400
	.short	64                      # 0x40
	.short	1024                    # 0x400
	.short	64                      # 0x40
	.short	1024                    # 0x400
	.short	64                      # 0x40
	.short	1024                    # 0x400
.LCPI0_3:
	.short	1008                    # 0x3f0
	.short	63                      # 0x3f
	.short	1008                    # 0x3f0
	.short	63                      # 0x3f
	.short	1008                    # 0x3f0
	.short	63                      # 0x3f
	.short	1008                    # 0x3f0
	.short	63                      # 0x3f
.LCPI0_4:
	.short	16                      # 0x10
	.short	256                     # 0x100
	.short	16                      # 0x10
	.short	256                     # 0x100
	.short	16                      # 0x10
	.short	256                     # 0x100
	.short	16                      # 0x10
	.short	256                     # 0x100
.LCPI0_5:
	.zero	16,51
.LCPI0_6:
	.zero	16,25
.LCPI0_7:
	.byte	65                      # 0x41
	.byte	71                      # 0x47
	.byte	252                     # 0xfc
	.byte	252                     # 0xfc
	.byte	252                     # 0xfc
	.byte	252                     # 0xfc
	.byte	252                     # 0xfc
	.byte	252                     # 0xfc
	.byte	252                     # 0xfc
	.byte	252                     # 0xfc
	.byte	252                     # 0xfc
	.byte	252                     # 0xfc
	.byte	237                     # 0xed
	.byte	240                     # 0xf0
	.byte	0                       # 0x0
	.byte	0                       # 0x0
	.text
	.globl	base64_stream_encode_avx
	.p2align	4, 0x90
	.type	base64_stream_encode_avx,@function
base64_stream_encode_avx:               # @base64_stream_encode_avx
# BB#0:                                 # %entry
	push	rbp
	mov	rbp, rsp
	and	rsp, -8
	mov	r10d, dword ptr [rdi + 4]
	mov	r9b, byte ptr [rdi + 12]
	xor	r11d, r11d
	cmp	r10d, 2
	je	.LBB0_12
# BB#1:                                 # %entry
	cmp	r10d, 1
	je	.LBB0_7
# BB#2:                                 # %entry
	test	r10d, r10d
	jne	.LBB0_14
# BB#3:                                 # %sw.bb
	cmp	rdx, 16
	jb	.LBB0_9
.LBB0_4:                                # %while.body.preheader
	vmovdqa	xmm8, xmmword ptr [rip + .LCPI0_0] # xmm8 = [1,0,2,1,4,3,5,4,7,6,8,7,10,9,11,10]
	vmovdqa	xmm9, xmmword ptr [rip + .LCPI0_1] # xmm9 = [64512,4032,64512,4032,64512,4032,64512,4032]
	vmovdqa	xmm10, xmmword ptr [rip + .LCPI0_2] # xmm10 = [64,1024,64,1024,64,1024,64,1024]
	vmovdqa	xmm3, xmmword ptr [rip + .LCPI0_3] # xmm3 = [1008,63,1008,63,1008,63,1008,63]
	vmovdqa	xmm4, xmmword ptr [rip + .LCPI0_4] # xmm4 = [16,256,16,256,16,256,16,256]
	vmovdqa	xmm5, xmmword ptr [rip + .LCPI0_5] # xmm5 = [51,51,51,51,51,51,51,51,51,51,51,51,51,51,51,51]
	vmovdqa	xmm6, xmmword ptr [rip + .LCPI0_6] # xmm6 = [25,25,25,25,25,25,25,25,25,25,25,25,25,25,25,25]
	vmovdqa	xmm7, xmmword ptr [rip + .LCPI0_7] # xmm7 = [65,71,252,252,252,252,252,252,252,252,252,252,237,240,0,0]
	.p2align	4, 0x90
.LBB0_5:                                # %while.body
                                        # =>This Inner Loop Header: Depth=1
	vmovdqu	xmm0, xmmword ptr [rsi]
	vpshufb	xmm0, xmm0, xmm8
	vpand	xmm1, xmm0, xmm9
	vpmulhuw	xmm1, xmm1, xmm10
	vpand	xmm0, xmm0, xmm3
	vpmullw	xmm0, xmm0, xmm4
	vpor	xmm0, xmm0, xmm1
	vpsubusb	xmm1, xmm0, xmm5
	vpcmpgtb	xmm2, xmm0, xmm6
	vpsubb	xmm1, xmm1, xmm2
	vpshufb	xmm1, xmm7, xmm1
	vpaddb	xmm0, xmm1, xmm0
	vmovdqu	xmmword ptr [rcx], xmm0
	add	rsi, 12
	add	rcx, 16
	add	r11, 16
	add	rdx, -12
	cmp	rdx, 15
	ja	.LBB0_5
.LBB0_6:                                # %if.end
	add	rdx, -1
	mov	al, byte ptr [rsi]
	shr	al, 2
	movzx	eax, al
	mov	al, byte ptr [rax + base64_table_enc]
	mov	byte ptr [rcx], al
	add	rcx, 1
	mov	r9b, byte ptr [rsi]
	add	rsi, 1
	shl	r9b, 4
	and	r9b, 48
	add	r11, 1
.LBB0_7:                                # %sw.bb14
	test	rdx, rdx
	je	.LBB0_8
# BB#11:                                # %if.end19
	add	rdx, -1
	mov	al, byte ptr [rsi]
	shr	al, 4
	or	al, r9b
	movzx	eax, al
	mov	al, byte ptr [rax + base64_table_enc]
	mov	byte ptr [rcx], al
	add	rcx, 1
	mov	r9b, byte ptr [rsi]
	add	rsi, 1
	shl	r9b, 2
	and	r9b, 60
	add	r11, 1
.LBB0_12:                               # %sw.bb36
	test	rdx, rdx
	je	.LBB0_13
# BB#15:                                # %if.end41
	add	rdx, -1
	mov	al, byte ptr [rsi]
	shr	al, 6
	or	al, r9b
	movzx	eax, al
	mov	al, byte ptr [rax + base64_table_enc]
	mov	byte ptr [rcx], al
	movzx	eax, byte ptr [rsi]
	add	rsi, 1
	and	eax, 63
	mov	al, byte ptr [rax + base64_table_enc]
	mov	byte ptr [rcx + 1], al
	add	rcx, 2
	add	r11, 2
	cmp	rdx, 16
	jae	.LBB0_4
.LBB0_9:                                # %while.end
	test	rdx, rdx
	jne	.LBB0_6
# BB#10:
	xor	r10d, r10d
	jmp	.LBB0_14
.LBB0_8:
	mov	r10d, 1
	jmp	.LBB0_14
.LBB0_13:
	mov	r10d, 2
.LBB0_14:                               # %sw.epilog
	mov	dword ptr [rdi + 4], r10d
	mov	byte ptr [rdi + 12], r9b
	mov	qword ptr [r8], r11
	mov	rsp, rbp
	pop	rbp
	ret
.Lfunc_end0:
	.size	base64_stream_encode_avx, .Lfunc_end0-base64_stream_encode_avx
                                        # -- End function
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4               # -- Begin function base64_stream_decode_avx
.LCPI1_0:
	.zero	16,47
.LCPI1_1:
	.byte	16                      # 0x10
	.byte	16                      # 0x10
	.byte	1                       # 0x1
	.byte	2                       # 0x2
	.byte	4                       # 0x4
	.byte	8                       # 0x8
	.byte	4                       # 0x4
	.byte	8                       # 0x8
	.byte	16                      # 0x10
	.byte	16                      # 0x10
	.byte	16                      # 0x10
	.byte	16                      # 0x10
	.byte	16                      # 0x10
	.byte	16                      # 0x10
	.byte	16                      # 0x10
	.byte	16                      # 0x10
.LCPI1_2:
	.byte	21                      # 0x15
	.byte	17                      # 0x11
	.byte	17                      # 0x11
	.byte	17                      # 0x11
	.byte	17                      # 0x11
	.byte	17                      # 0x11
	.byte	17                      # 0x11
	.byte	17                      # 0x11
	.byte	17                      # 0x11
	.byte	17                      # 0x11
	.byte	19                      # 0x13
	.byte	26                      # 0x1a
	.byte	27                      # 0x1b
	.byte	27                      # 0x1b
	.byte	27                      # 0x1b
	.byte	26                      # 0x1a
.LCPI1_3:
	.byte	0                       # 0x0
	.byte	16                      # 0x10
	.byte	19                      # 0x13
	.byte	4                       # 0x4
	.byte	191                     # 0xbf
	.byte	191                     # 0xbf
	.byte	185                     # 0xb9
	.byte	185                     # 0xb9
	.byte	0                       # 0x0
	.byte	0                       # 0x0
	.byte	0                       # 0x0
	.byte	0                       # 0x0
	.byte	0                       # 0x0
	.byte	0                       # 0x0
	.byte	0                       # 0x0
	.byte	0                       # 0x0
.LCPI1_4:
	.byte	64                      # 0x40
	.byte	1                       # 0x1
	.byte	64                      # 0x40
	.byte	1                       # 0x1
	.byte	64                      # 0x40
	.byte	1                       # 0x1
	.byte	64                      # 0x40
	.byte	1                       # 0x1
	.byte	64                      # 0x40
	.byte	1                       # 0x1
	.byte	64                      # 0x40
	.byte	1                       # 0x1
	.byte	64                      # 0x40
	.byte	1                       # 0x1
	.byte	64                      # 0x40
	.byte	1                       # 0x1
.LCPI1_5:
	.short	4096                    # 0x1000
	.short	1                       # 0x1
	.short	4096                    # 0x1000
	.short	1                       # 0x1
	.short	4096                    # 0x1000
	.short	1                       # 0x1
	.short	4096                    # 0x1000
	.short	1                       # 0x1
.LCPI1_6:
	.byte	2                       # 0x2
	.byte	1                       # 0x1
	.byte	0                       # 0x0
	.byte	6                       # 0x6
	.byte	5                       # 0x5
	.byte	4                       # 0x4
	.byte	10                      # 0xa
	.byte	9                       # 0x9
	.byte	8                       # 0x8
	.byte	14                      # 0xe
	.byte	13                      # 0xd
	.byte	12                      # 0xc
	.byte	128                     # 0x80
	.byte	128                     # 0x80
	.byte	128                     # 0x80
	.byte	128                     # 0x80
	.text
	.globl	base64_stream_decode_avx
	.p2align	4, 0x90
	.type	base64_stream_decode_avx,@function
base64_stream_decode_avx:               # @base64_stream_decode_avx
# BB#0:                                 # %entry
	push	rbp
	mov	rbp, rsp
	push	r15
	push	r14
	push	rbx
	and	rsp, -8
	mov	eax, dword ptr [rdi]
	test	eax, eax
	je	.LBB1_4
# BB#1:                                 # %if.then
	mov	qword ptr [r8], 0
	xor	ebx, ebx
	test	rdx, rdx
	je	.LBB1_43
# BB#2:                                 # %if.then
	cmp	eax, 1
	jne	.LBB1_43
# BB#3:                                 # %if.then7
	mov	qword ptr [rdi], 2
	movzx	eax, byte ptr [rsi]
	cmp	byte ptr [rax + base64_table_dec], -2
	sete	al
	cmp	rdx, 1
	sete	bl
	and	bl, al
	jmp	.LBB1_43
.LBB1_4:                                # %if.end14
	mov	r11d, dword ptr [rdi + 4]
	mov	r9b, byte ptr [rdi + 12]
	xor	r10d, r10d
	cmp	r11d, 1
	jg	.LBB1_14
# BB#5:                                 # %if.end14
	test	r11d, r11d
	je	.LBB1_6
# BB#13:                                # %if.end14
	mov	eax, 0
	cmp	r11d, 1
	jne	.LBB1_17
# BB#23:                                # %sw.bb68
	mov	r11d, 1
	test	rdx, rdx
	je	.LBB1_24
.LBB1_25:                               # %if.end73
	movzx	ebx, byte ptr [rsi]
	mov	r14b, byte ptr [rbx + base64_table_dec]
	cmp	r14b, -3
	ja	.LBB1_26
# BB#27:                                # %if.end82
	add	rdx, -1
	mov	ebx, r14d
	shr	bl, 4
	or	bl, r9b
	mov	byte ptr [rcx], bl
	add	rsi, 1
	add	rcx, 1
	shl	r14b, 4
	add	rax, 1
	mov	r9d, r14d
	mov	r14, rdx
	mov	bl, 1
	test	r14, r14
	jne	.LBB1_30
.LBB1_29:
	mov	r11d, 2
	jmp	.LBB1_42
.LBB1_14:                               # %if.end14
	cmp	r11d, 2
	je	.LBB1_15
# BB#16:                                # %if.end14
	mov	eax, 0
	cmp	r11d, 3
	jne	.LBB1_17
# BB#37:                                # %sw.bb148
	test	rdx, rdx
	je	.LBB1_38
.LBB1_39:                               # %if.end153
	add	rdx, -1
	movzx	ebx, byte ptr [rsi]
	mov	bl, byte ptr [rbx + base64_table_dec]
	cmp	bl, -2
	jb	.LBB1_44
# BB#40:                                # %if.then160
	sete	cl
	test	rdx, rdx
	jmp	.LBB1_41
.LBB1_6:
	xor	eax, eax
	cmp	rdx, 24
	jae	.LBB1_8
	jmp	.LBB1_11
.LBB1_15:
	xor	eax, eax
	mov	r14, rdx
	mov	bl, 1
	test	r14, r14
	je	.LBB1_29
.LBB1_30:                               # %if.end100
	lea	rdx, [r14 - 1]
	movzx	r11d, byte ptr [rsi]
	add	rsi, 1
	mov	r15b, byte ptr [r11 + base64_table_dec]
	cmp	r15b, -2
	jb	.LBB1_36
# BB#31:                                # %if.then107
	mov	r11d, 3
	xor	r10d, r10d
	cmp	r15b, -2
	jne	.LBB1_32
# BB#33:                                # %if.then113
	test	rdx, rdx
	je	.LBB1_34
# BB#35:                                # %if.then117
	movzx	ecx, byte ptr [rsi]
	cmp	byte ptr [rcx + base64_table_dec], -2
	sete	cl
	cmp	r14, 2
.LBB1_41:                               # %sw.epilog
	sete	bl
	and	bl, cl
	xor	r11d, r11d
	mov	r10d, 2
	jmp	.LBB1_42
.LBB1_17:
	xor	eax, eax
	xor	ebx, ebx
	jmp	.LBB1_42
.LBB1_44:                               # %if.end171
	or	bl, r9b
	mov	byte ptr [rcx], bl
	add	rsi, 1
	add	rcx, 1
	add	rax, 1
	xor	r9d, r9d
	cmp	rdx, 24
	jb	.LBB1_11
.LBB1_8:                                # %while.body.preheader
	vmovdqa	xmm0, xmmword ptr [rip + .LCPI1_0] # xmm0 = [47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47]
	vmovdqa	xmm8, xmmword ptr [rip + .LCPI1_1] # xmm8 = [16,16,1,2,4,8,4,8,16,16,16,16,16,16,16,16]
	vmovdqa	xmm10, xmmword ptr [rip + .LCPI1_2] # xmm10 = [21,17,17,17,17,17,17,17,17,17,19,26,27,27,27,26]
	vpxor	xmm12, xmm12, xmm12
	vmovdqa	xmm9, xmmword ptr [rip + .LCPI1_0] # xmm9 = [47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47]
	vmovdqa	xmm11, xmmword ptr [rip + .LCPI1_3] # xmm11 = [0,16,19,4,191,191,185,185,0,0,0,0,0,0,0,0]
	vmovdqa	xmm6, xmmword ptr [rip + .LCPI1_4] # xmm6 = [64,1,64,1,64,1,64,1,64,1,64,1,64,1,64,1]
	vmovdqa	xmm7, xmmword ptr [rip + .LCPI1_5] # xmm7 = [4096,1,4096,1,4096,1,4096,1]
	vmovdqa	xmm1, xmmword ptr [rip + .LCPI1_6] # xmm1 = [2,1,0,6,5,4,10,9,8,14,13,12,128,128,128,128]
	.p2align	4, 0x90
.LBB1_9:                                # %while.body
                                        # =>This Inner Loop Header: Depth=1
	vmovdqu	xmm4, xmmword ptr [rsi]
	vpsrld	xmm2, xmm4, 4
	vpand	xmm2, xmm2, xmm0
	vpshufb	xmm5, xmm8, xmm2
	vpand	xmm3, xmm4, xmm0
	vpshufb	xmm3, xmm10, xmm3
	vpand	xmm3, xmm3, xmm5
	vpcmpgtb	xmm3, xmm3, xmm12
	vpmovmskb	ebx, xmm3
	test	ebx, ebx
	jne	.LBB1_19
# BB#10:                                # %cleanup.cont
                                        #   in Loop: Header=BB1_9 Depth=1
	vpcmpeqb	xmm3, xmm4, xmm9
	vpaddb	xmm2, xmm2, xmm3
	vpshufb	xmm2, xmm11, xmm2
	vpaddb	xmm2, xmm2, xmm4
	vpmaddubsw	xmm2, xmm2, xmm6
	vpmaddwd	xmm2, xmm2, xmm7
	vpshufb	xmm2, xmm2, xmm1
	vmovdqu	xmmword ptr [rcx], xmm2
	add	rsi, 16
	add	rcx, 12
	add	rax, 12
	add	rdx, -16
	cmp	rdx, 23
	ja	.LBB1_9
.LBB1_11:                               # %while.end
	test	rdx, rdx
	je	.LBB1_12
# BB#18:                                # %while.end.if.end54_crit_edge
	mov	bl, byte ptr [rsi]
	movzx	ebx, bl
	mov	bl, byte ptr [rbx + base64_table_dec]
	cmp	bl, -3
	jbe	.LBB1_22
.LBB1_21:
	xor	r11d, r11d
.LBB1_26:
	mov	r10d, 2
	xor	ebx, ebx
	jmp	.LBB1_42
.LBB1_36:                               # %if.end133
	mov	ebx, r15d
	shr	bl, 2
	or	bl, r9b
	mov	byte ptr [rcx], bl
	add	rcx, 1
	shl	r15b, 6
	add	rax, 1
	mov	r9d, r15d
	test	rdx, rdx
	jne	.LBB1_39
.LBB1_38:
	mov	bl, 1
	mov	r11d, 3
	jmp	.LBB1_42
.LBB1_12:
	mov	bl, 1
	xor	r10d, r10d
	xor	r11d, r11d
	jmp	.LBB1_42
.LBB1_19:                               # %if.end54.loopexit
	vpextrb	ebx, xmm4, 0
	movzx	ebx, bl
	mov	bl, byte ptr [rbx + base64_table_dec]
	cmp	bl, -3
	ja	.LBB1_21
.LBB1_22:                               # %if.end63
	add	rdx, -1
	add	rsi, 1
	shl	bl, 2
	mov	r9d, ebx
	mov	r11d, 1
	test	rdx, rdx
	jne	.LBB1_25
.LBB1_24:
	mov	bl, 1
	jmp	.LBB1_42
.LBB1_32:
	xor	ebx, ebx
	jmp	.LBB1_42
.LBB1_34:
	mov	r10d, 1
.LBB1_42:                               # %sw.epilog
	mov	dword ptr [rdi], r10d
	mov	dword ptr [rdi + 4], r11d
	mov	byte ptr [rdi + 12], r9b
	mov	qword ptr [r8], rax
.LBB1_43:                               # %cleanup187
	movzx	eax, bl
	lea	rsp, [rbp - 24]
	pop	rbx
	pop	r14
	pop	r15
	pop	rbp
	ret
.Lfunc_end1:
	.size	base64_stream_decode_avx, .Lfunc_end1-base64_stream_decode_avx
                                        # -- End function

	.ident	"clang version 6.0.0 "
	.section	".note.GNU-stack","",@progbits
