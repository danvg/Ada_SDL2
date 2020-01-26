package SDL.Stdinc is

   function SDL_malloc (size : size_t) return System.Address
     with Import, Convention => C, External_Name => "SDL_malloc";

   function SDL_calloc (nmemb : size_t; size : size_t) return System.Address
     with Import, Convention => C, External_Name => "SDL_calloc";

   function SDL_realloc
     (mem : System.Address; size : size_t) return System.Address
     with Import, Convention => C, External_Name => "SDL_realloc";

   procedure SDL_free (mem : System.Address)
     with Import, Convention => C, External_Name => "SDL_free";

   type SDL_malloc_func is access
     function (arg1 : size_t) return System.Address
     with Convention => C;

   type SDL_calloc_func is access function
     (arg1 : size_t; arg2 : size_t) return System.Address
     with Convention => C;

   type SDL_realloc_func is access function
     (arg1 : System.Address; arg2 : size_t) return System.Address
     with Convention => C;

   type SDL_free_func is access procedure (arg1 : System.Address)
     with Convention => C;

   procedure SDL_GetMemoryFunctions
     (malloc_func  : System.Address;
      calloc_func  : System.Address;
      realloc_func : System.Address;
      free_func    : System.Address)
     with Import, Convention => C, External_Name => "SDL_GetMemoryFunctions";

   function SDL_SetMemoryFunctions
     (malloc_func  : SDL_malloc_func;
      calloc_func  : SDL_calloc_func;
      realloc_func : SDL_realloc_func;
      free_func    : SDL_free_func) return int
     with Import, Convention => C, External_Name => "SDL_SetMemoryFunctions";

   function SDL_GetNumAllocations return int
     with Import, Convention => C, External_Name => "SDL_GetNumAllocations";

   function SDL_getenv (name : char_array) return chars_ptr
     with Import, Convention => C, External_Name => "SDL_getenv";

   function SDL_setenv
     (name      : char_array;
      value     : char_array;
      overwrite : int) return int
     with Import, Convention => C, External_Name => "SDL_setenv";

   procedure SDL_qsort
     (base    : System.Address;
      nmemb   : size_t;
      size    : size_t;
      compare : access function (arg1 : System.Address; arg2 : System.Address) return int)
     with Import, Convention => C, External_Name => "SDL_qsort";

   function SDL_abs (x : int) return int
     with Import, Convention => C, External_Name => "SDL_abs";

   function SDL_isdigit (x : int) return int
     with Import, Convention => C, External_Name => "SDL_isdigit";

   function SDL_isspace (x : int) return int
     with Import, Convention => C, External_Name => "SDL_isspace";

   function SDL_toupper (x : int) return int
     with Import, Convention => C, External_Name => "SDL_toupper";

   function SDL_tolower (x : int) return int
     with Import, Convention => C, External_Name => "SDL_tolower";

   function SDL_memset
     (dst : System.Address;
      c   : int;
      len : size_t) return System.Address
     with Import, Convention => C, External_Name => "SDL_memset";

   procedure SDL_memset4
     (dst    : System.Address;
      val    : Unsigned_32;
      dwords : size_t)
     with Import, Convention => C, External_Name => "SDL_memset4";

   function SDL_memcpy
     (dst : System.Address;
      src : System.Address;
      len : size_t) return System.Address
     with Import, Convention => C, External_Name => "SDL_memcpy";

   function SDL_memmove
     (dst : System.Address;
      src : System.Address;
      len : size_t) return System.Address
     with Import, Convention => C, External_Name => "SDL_memmove";

   function SDL_memcmp
     (s1  : System.Address;
      s2  : System.Address;
      len : size_t) return int
     with Import, Convention => C, External_Name => "SDL_memcmp";

   function SDL_wcsdup (wstr : access wchar_t) return access wchar_t
     with Import, Convention => C, External_Name => "SDL_wcsdup";

   function SDL_wcslen (wstr : access wchar_t) return size_t
     with Import, Convention => C, External_Name => "SDL_wcslen";

   function SDL_wcslcpy
     (dst    : access wchar_t;
      src    : access wchar_t;
      maxlen : size_t) return size_t
     with Import, Convention => C, External_Name => "SDL_wcslcpy";

   function SDL_wcslcat
     (dst    : access wchar_t;
      src    : access wchar_t;
      maxlen : size_t) return size_t
     with Import, Convention => C, External_Name => "SDL_wcslcat";

   function SDL_wcscmp
     (str1 : access wchar_t; str2 : access wchar_t) return int
     with Import, Convention => C, External_Name => "SDL_wcscmp";

   function SDL_strlen (str : char_array) return size_t
     with Import, Convention => C, External_Name => "SDL_strlen";

   function SDL_strlcpy
     (dst    : char_array;
      src    : char_array;
      maxlen : size_t) return size_t
     with Import, Convention => C, External_Name => "SDL_strlcpy";

   function SDL_utf8strlcpy
     (dst       : char_array;
      src       : char_array;
      dst_bytes : size_t) return size_t
     with Import, Convention => C, External_Name => "SDL_utf8strlcpy";

   function SDL_strlcat
     (dst    : char_array;
      src    : char_array;
      maxlen : size_t) return size_t
     with Import, Convention => C, External_Name => "SDL_strlcat";

   function SDL_strdup (str : char_array) return chars_ptr
     with Import, Convention => C, External_Name => "SDL_strdup";

   function SDL_strrev (str : char_array) return chars_ptr
     with Import, Convention => C, External_Name => "SDL_strrev";

   function SDL_strupr (str : char_array) return chars_ptr
     with Import, Convention => C, External_Name => "SDL_strupr";

   function SDL_strlwr (str : char_array) return chars_ptr
     with Import, Convention => C, External_Name => "SDL_strlwr";

   function SDL_strchr (str : char_array; c : int) return chars_ptr
     with Import, Convention => C, External_Name => "SDL_strchr";

   function SDL_strrchr (str : char_array; c : int) return chars_ptr
     with Import, Convention => C, External_Name => "SDL_strrchr";

   function SDL_strstr
     (haystack : char_array; needle : char_array) return chars_ptr
     with Import, Convention => C, External_Name => "SDL_strstr";

   function SDL_utf8strlen (str : char_array) return size_t
     with Import, Convention => C, External_Name => "SDL_utf8strlen";

   function SDL_itoa
     (value : int;
      str   : char_array;
      radix : int) return chars_ptr
     with Import, Convention => C, External_Name => "SDL_itoa";

   function SDL_uitoa
     (value : unsigned;
      str   : char_array;
      radix : int) return chars_ptr
     with Import, Convention => C, External_Name => "SDL_uitoa";

   function SDL_ltoa
     (value : long;
      str   : char_array;
      radix : int) return chars_ptr
     with Import, Convention => C, External_Name => "SDL_ltoa";

   function SDL_ultoa
     (value : unsigned_long;
      str   : char_array;
      radix : int) return chars_ptr
     with Import, Convention => C, External_Name => "SDL_ultoa";

   function SDL_lltoa
     (value : Integer_64;
      str   : char_array;
      radix : int) return chars_ptr
     with Import, Convention => C, External_Name => "SDL_lltoa";

   function SDL_ulltoa
     (value : Unsigned_64;
      str   : char_array;
      radix : int) return chars_ptr
     with Import, Convention => C, External_Name => "SDL_ulltoa";

   function SDL_atoi (str : char_array) return int
     with Import, Convention => C, External_Name => "SDL_atoi";

   function SDL_atof (str : char_array) return double
     with Import, Convention => C, External_Name => "SDL_atof";

   function SDL_strtol
     (str  : char_array;
      endp : System.Address;
      base : int) return long
     with Import, Convention => C, External_Name => "SDL_strtol";

   function SDL_strtoul
     (str  : char_array;
      endp : System.Address;
      base : int) return unsigned_long
     with Import, Convention => C, External_Name => "SDL_strtoul";

   function SDL_strtoll
     (str  : char_array;
      endp : System.Address;
      base : int) return Integer_64
     with Import, Convention => C, External_Name => "SDL_strtoll";

   function SDL_strtoull
     (str  : char_array;
      endp : System.Address;
      base : int) return Unsigned_64
     with Import, Convention => C, External_Name => "SDL_strtoull";

   function SDL_strtod (str : char_array; endp : System.Address) return double
     with Import, Convention => C, External_Name => "SDL_strtod";

   function SDL_strcmp (str1 : char_array; str2 : char_array) return int
     with Import, Convention => C, External_Name => "SDL_strcmp";

   function SDL_strncmp
     (str1   : char_array;
      str2   : char_array;
      maxlen : size_t) return int
     with Import, Convention => C, External_Name => "SDL_strncmp";

   function SDL_strcasecmp (str1 : char_array; str2 : char_array) return int
     with Import, Convention => C, External_Name => "SDL_strcasecmp";

   function SDL_strncasecmp
     (str1 : char_array;
      str2 : char_array;
      len  : size_t) return int
     with Import, Convention => C, External_Name => "SDL_strncasecmp";

   function SDL_sscanf (text : char_array; fmt : char_array) return int
     with Import, Convention => C, External_Name => "SDL_sscanf";

   function SDL_vsscanf
     (text : char_array;
      fmt  : char_array;
      ap   : access System.Address) return int
     with Import, Convention => C, External_Name => "SDL_vsscanf";

   function SDL_snprintf
     (text   : char_array;
      maxlen : size_t;
      fmt    : char_array) return int
     with Import, Convention => C, External_Name => "SDL_snprintf";

   function SDL_vsnprintf
     (text   : char_array;
      maxlen : size_t;
      fmt    : char_array;
      ap     : access System.Address) return int
     with Import, Convention => C, External_Name => "SDL_vsnprintf";

   function SDL_acos (x : double) return double
     with Import, Convention => C, External_Name => "SDL_acos";

   function SDL_acosf (x : float) return float
     with Import, Convention => C, External_Name => "SDL_acosf";

   function SDL_asin (x : double) return double
     with Import, Convention => C, External_Name => "SDL_asin";

   function SDL_asinf (x : float) return float
     with Import, Convention => C, External_Name => "SDL_asinf";

   function SDL_atan (x : double) return double
     with Import, Convention => C, External_Name => "SDL_atan";

   function SDL_atanf (x : float) return float
     with Import, Convention => C, External_Name => "SDL_atanf";

   function SDL_atan2 (x : double; y : double) return double
     with Import, Convention => C, External_Name => "SDL_atan2";

   function SDL_atan2f (x : float; y : float) return float
     with Import, Convention => C, External_Name => "SDL_atan2f";

   function SDL_ceil (x : double) return double
     with Import, Convention => C, External_Name => "SDL_ceil";

   function SDL_ceilf (x : float) return float
     with Import, Convention => C, External_Name => "SDL_ceilf";

   function SDL_copysign (x : double; y : double) return double
     with Import, Convention => C, External_Name => "SDL_copysign";

   function SDL_copysignf (x : float; y : float) return float
     with Import, Convention => C, External_Name => "SDL_copysignf";

   function SDL_cos (x : double) return double
     with Import, Convention => C, External_Name => "SDL_cos";

   function SDL_cosf (x : float) return float
     with Import, Convention => C, External_Name => "SDL_cosf";

   function SDL_exp (x : double) return double
     with Import, Convention => C, External_Name => "SDL_exp";

   function SDL_expf (x : float) return float
     with Import, Convention => C, External_Name => "SDL_expf";

   function SDL_fabs (x : double) return double
     with Import, Convention => C, External_Name => "SDL_fabs";

   function SDL_fabsf (x : float) return float
     with Import, Convention => C, External_Name => "SDL_fabsf";

   function SDL_floor (x : double) return double
     with Import, Convention => C, External_Name => "SDL_floor";

   function SDL_floorf (x : float) return float
     with Import, Convention => C, External_Name => "SDL_floorf";

   function SDL_fmod (x : double; y : double) return double
     with Import, Convention => C, External_Name => "SDL_fmod";

   function SDL_fmodf (x : float; y : float) return float
     with Import, Convention => C, External_Name => "SDL_fmodf";

   function SDL_log (x : double) return double
     with Import, Convention => C, External_Name => "SDL_log";

   function SDL_logf (x : float) return float
     with Import, Convention => C, External_Name => "SDL_logf";

   function SDL_log10 (x : double) return double
     with Import, Convention => C, External_Name => "SDL_log10";

   function SDL_log10f (x : float) return float
     with Import, Convention => C, External_Name => "SDL_log10f";

   function SDL_pow (x : double; y : double) return double
     with Import, Convention => C, External_Name => "SDL_pow";

   function SDL_powf (x : float; y : float) return float
     with Import, Convention => C, External_Name => "SDL_powf";

   function SDL_scalbn (x : double; n : int) return double
     with Import, Convention => C, External_Name => "SDL_scalbn";

   function SDL_scalbnf (x : float; n : int) return float
     with Import, Convention => C, External_Name => "SDL_scalbnf";

   function SDL_sin (x : double) return double
     with Import, Convention => C, External_Name => "SDL_sin";

   function SDL_sinf (x : float) return float
     with Import, Convention => C, External_Name => "SDL_sinf";

   function SDL_sqrt (x : double) return double
     with Import, Convention => C, External_Name => "SDL_sqrt";

   function SDL_sqrtf (x : float) return float
     with Import, Convention => C, External_Name => "SDL_sqrtf";

   function SDL_tan (x : double) return double
     with Import, Convention => C, External_Name => "SDL_tan";

   function SDL_tanf (x : float) return float
     with Import, Convention => C, External_Name => "SDL_tanf";

   subtype SDL_iconv_t is System.Address;

   function SDL_iconv_open
     (tocode : char_array; fromcode : char_array) return SDL_iconv_t
     with Import, Convention => C, External_Name => "SDL_iconv_open";

   function SDL_iconv_close (cd : SDL_iconv_t) return int
     with Import, Convention => C, External_Name => "SDL_iconv_close";

   function SDL_iconv
     (cd           : SDL_iconv_t;
      inbuf        : System.Address;
      inbytesleft  : access size_t;
      outbuf       : System.Address;
      outbytesleft : access size_t) return size_t
     with Import, Convention => C, External_Name => "SDL_iconv";

   function SDL_iconv_string
     (tocode      : char_array;
      fromcode    : char_array;
      inbuf       : char_array;
      inbytesleft : size_t) return chars_ptr
     with Import, Convention => C, External_Name => "SDL_iconv_string";

   function SDL_memcpy4
     (dst    : System.Address;
      src    : System.Address;
      dwords : size_t) return System.Address
     with Import, Convention => C, External_Name => "SDL_memcpy4";

end SDL.Stdinc;
