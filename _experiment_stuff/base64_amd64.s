//+build !noasm !appengine

TEXT ·_base64_stream_encode_init(SB), $0-12
    MOVQ base64_state+0(FP), DI
    MOVD flags+8(FP), SI
    MOVQ SP, BX
    MOVQ base64_stream_encode_init(SB), AX
    CALL AX
    //JMP base64_stream_encode_init(SB)
    MOVQ BX, SP
    RET

TEXT ·_base64_stream_encode(SB), $0-40
    MOVQ base64_state+0(FP), DI
    MOVQ src+8(FP), SI
    MOVQ srclen+16(FP), DX
    MOVQ out+24(FP), CX
    MOVQ outlen+32(FP), R8

    /* MOVQ SP, BX */
    /* MOVQ base64_stream_encode(SB), AX */
    /* CALL AX */
    /* MOVQ BX, SP */
    /* RET */
    JMP base64_stream_encode(SB)

//TEXT ·_base64_stream_decode_avx(SB), $0-40
//    JMP base64_stream_decode_avx(SB)
