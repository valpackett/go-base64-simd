// Based on https://github.com/WojciechMula/simd-string/blob/master/strchr.cpp
// for some reason plain C says _mm_cmpistrc complains about mode not being const int when it IS const int
extern "C" {

#include <stdint.h>
#include <smmintrin.h>
#include <nmmintrin.h>

size_t next_skippable(const char *s, size_t len) {
   const int mode = _SIDD_UBYTE_OPS | _SIDD_CMP_EQUAL_ANY | _SIDD_LEAST_SIGNIFICANT;
   const __m128i set = _mm_setr_epi8('\n', '\r', ' ', '	', '!', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
   const __m128i *mem = reinterpret_cast<__m128i*>(const_cast<char*>(s));
   for (size_t i = 0; i < len; i++) {
      const __m128i chunk = _mm_loadu_si128(++mem);
      if (_mm_cmpistrc(set, chunk, mode)) {
         return _mm_cmpistri(set, chunk, mode);
      }
   }
   return -1;
}

}
