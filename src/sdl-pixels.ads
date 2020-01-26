package SDL.Pixels is

   SDL_ALPHA_OPAQUE      : constant := 255;
   SDL_ALPHA_TRANSPARENT : constant := 0;

   SDL_PIXELTYPE_UNKNOWN  : constant := 0;
   SDL_PIXELTYPE_INDEX1   : constant := 1;
   SDL_PIXELTYPE_INDEX4   : constant := 2;
   SDL_PIXELTYPE_INDEX8   : constant := 3;
   SDL_PIXELTYPE_PACKED8  : constant := 4;
   SDL_PIXELTYPE_PACKED16 : constant := 5;
   SDL_PIXELTYPE_PACKED32 : constant := 6;
   SDL_PIXELTYPE_ARRAYU8  : constant := 7;
   SDL_PIXELTYPE_ARRAYU16 : constant := 8;
   SDL_PIXELTYPE_ARRAYU32 : constant := 9;
   SDL_PIXELTYPE_ARRAYF16 : constant := 10;
   SDL_PIXELTYPE_ARRAYF32 : constant := 11;

   SDL_BITMAPORDER_NONE : constant := 0;
   SDL_BITMAPORDER_4321 : constant := 1;
   SDL_BITMAPORDER_1234 : constant := 2;

   SDL_PACKEDORDER_NONE : constant := 0;
   SDL_PACKEDORDER_XRGB : constant := 1;
   SDL_PACKEDORDER_RGBX : constant := 2;
   SDL_PACKEDORDER_ARGB : constant := 3;
   SDL_PACKEDORDER_RGBA : constant := 4;
   SDL_PACKEDORDER_XBGR : constant := 5;
   SDL_PACKEDORDER_BGRX : constant := 6;
   SDL_PACKEDORDER_ABGR : constant := 7;
   SDL_PACKEDORDER_BGRA : constant := 8;

   SDL_ARRAYORDER_NONE : constant := 0;
   SDL_ARRAYORDER_RGB  : constant := 1;
   SDL_ARRAYORDER_RGBA : constant := 2;
   SDL_ARRAYORDER_ARGB : constant := 3;
   SDL_ARRAYORDER_BGR  : constant := 4;
   SDL_ARRAYORDER_BGRA : constant := 5;
   SDL_ARRAYORDER_ABGR : constant := 6;

   SDL_PACKEDLAYOUT_NONE    : constant := 0;
   SDL_PACKEDLAYOUT_332     : constant := 1;
   SDL_PACKEDLAYOUT_4444    : constant := 2;
   SDL_PACKEDLAYOUT_1555    : constant := 3;
   SDL_PACKEDLAYOUT_5551    : constant := 4;
   SDL_PACKEDLAYOUT_565     : constant := 5;
   SDL_PACKEDLAYOUT_8888    : constant := 6;
   SDL_PACKEDLAYOUT_2101010 : constant := 7;
   SDL_PACKEDLAYOUT_1010102 : constant := 8;

   function SDL_DEFINE_PIXELFOURCC (A, B, C, D : int) return Unsigned_32 is
     (Unsigned_32 (D) or Shift_Left (Unsigned_32 (C), 8)
       or Shift_Right (Unsigned_32 (B), 16)
       or Shift_Left (Unsigned_32 (A), 24));

   function SDL_DEFINE_PIXELFORMAT
     (typ, order, layout, bits, bytes : int) return Unsigned_32 is
     ((2**28) or Shift_Left (Unsigned_32 (typ), 24)
       or Shift_Left (Unsigned_32 (order), 20)
       or Shift_Left (Unsigned_32 (layout), 16)
       or Shift_Left (Unsigned_32 (bits), 8)
       or Unsigned_32 (bytes));

   subtype SDL_PixelFormatEnum is unsigned;
   SDL_PIXELFORMAT_UNKNOWN      : constant := 0;
   SDL_PIXELFORMAT_INDEX1LSB    : constant := 286261504;
   SDL_PIXELFORMAT_INDEX1MSB    : constant := 287310080;
   SDL_PIXELFORMAT_INDEX4LSB    : constant := 303039488;
   SDL_PIXELFORMAT_INDEX4MSB    : constant := 304088064;
   SDL_PIXELFORMAT_INDEX8       : constant := 318769153;
   SDL_PIXELFORMAT_RGB332       : constant := 336660481;
   SDL_PIXELFORMAT_RGB444       : constant := 353504258;
   SDL_PIXELFORMAT_RGB555       : constant := 353570562;
   SDL_PIXELFORMAT_BGR555       : constant := 357764866;
   SDL_PIXELFORMAT_ARGB4444     : constant := 355602434;
   SDL_PIXELFORMAT_RGBA4444     : constant := 356651010;
   SDL_PIXELFORMAT_ABGR4444     : constant := 359796738;
   SDL_PIXELFORMAT_BGRA4444     : constant := 360845314;
   SDL_PIXELFORMAT_ARGB1555     : constant := 355667970;
   SDL_PIXELFORMAT_RGBA5551     : constant := 356782082;
   SDL_PIXELFORMAT_ABGR1555     : constant := 359862274;
   SDL_PIXELFORMAT_BGRA5551     : constant := 360976386;
   SDL_PIXELFORMAT_RGB565       : constant := 353701890;
   SDL_PIXELFORMAT_BGR565       : constant := 357896194;
   SDL_PIXELFORMAT_RGB24        : constant := 386930691;
   SDL_PIXELFORMAT_BGR24        : constant := 390076419;
   SDL_PIXELFORMAT_RGB888       : constant := 370546692;
   SDL_PIXELFORMAT_RGBX8888     : constant := 371595268;
   SDL_PIXELFORMAT_BGR888       : constant := 374740996;
   SDL_PIXELFORMAT_BGRX8888     : constant := 375789572;
   SDL_PIXELFORMAT_ARGB8888     : constant := 372645892;
   SDL_PIXELFORMAT_RGBA8888     : constant := 373694468;
   SDL_PIXELFORMAT_ABGR8888     : constant := 376840196;
   SDL_PIXELFORMAT_BGRA8888     : constant := 377888772;
   SDL_PIXELFORMAT_ARGB2101010  : constant := 372711428;
   SDL_PIXELFORMAT_RGBA32       : constant := 376840196;
   SDL_PIXELFORMAT_ARGB32       : constant := 377888772;
   SDL_PIXELFORMAT_BGRA32       : constant := 372645892;
   SDL_PIXELFORMAT_ABGR32       : constant := 373694468;
   SDL_PIXELFORMAT_YV12         : constant := 842094169;
   SDL_PIXELFORMAT_IYUV         : constant := 1448433993;
   SDL_PIXELFORMAT_YUY2         : constant := 844715353;
   SDL_PIXELFORMAT_UYVY         : constant := 1498831189;
   SDL_PIXELFORMAT_YVYU         : constant := 1431918169;
   SDL_PIXELFORMAT_NV12         : constant := 842094158;
   SDL_PIXELFORMAT_NV21         : constant := 825382478;
   SDL_PIXELFORMAT_EXTERNAL_OES : constant := 542328143;

   function SDL_PIXELFLAG (X : Unsigned_32) return int is
     (int (Shift_Right (X, 28) and 16#0F#));

   function SDL_PIXELTYPE (X : Unsigned_32) return int is
     (int (Shift_Right (X, 24) and 16#0F#));

   function SDL_PIXELORDER (X : Unsigned_32) return int is
     (int (Shift_Right (X, 20) and 16#0F#));

   function SDL_PIXELLAYOUT (X : Unsigned_32) return int is
     (int (Shift_Right (X, 16) and 16#0F#));

   function SDL_BITSPERPIXEL (X : Unsigned_32) return int is
     (int (Shift_Right (X, 8) and 16#FF#));

   function SDL_ISPIXELFORMAT_FOURCC (format : Unsigned_32) return SDL_bool is
     (if (format /= 0 and then SDL_PIXELFLAG (format) /= 1) then SDL_TRUE
      else SDL_FALSE);

   function SDL_BYTESPERPIXEL (X : Unsigned_32) return int is
     (if SDL_ISPIXELFORMAT_FOURCC (X) = SDL_TRUE then
        (if (X = SDL_PIXELFORMAT_YUY2)
           or else (X = SDL_PIXELFORMAT_UYVY)
           or else (X = SDL_PIXELFORMAT_YVYU)
         then 2
         else 1)
      else int (X and 16#FF#));

   function SDL_ISPIXELFORMAT_INDEXED (format : Unsigned_32) return SDL_bool is
     (if ((SDL_ISPIXELFORMAT_FOURCC (format) = SDL_FALSE)
         and then ((SDL_PIXELTYPE (format) = SDL_PIXELTYPE_INDEX1)
           or else (SDL_PIXELTYPE (format) = SDL_PIXELTYPE_INDEX4)
           or else (SDL_PIXELTYPE (format) = SDL_PIXELTYPE_INDEX8)))
      then SDL_TRUE
      else SDL_FALSE);

   function SDL_ISPIXELFORMAT_PACKED (format : Unsigned_32) return SDL_bool is
     (if ((SDL_ISPIXELFORMAT_FOURCC (format) = SDL_FALSE)
         and then ((SDL_PIXELTYPE (format) = SDL_PIXELTYPE_PACKED8)
           or else (SDL_PIXELTYPE (format) = SDL_PIXELTYPE_PACKED16)
           or else (SDL_PIXELTYPE (format) = SDL_PIXELTYPE_PACKED32)))
      then SDL_TRUE
      else SDL_FALSE);

   function SDL_ISPIXELFORMAT_ARRAY (format : Unsigned_32) return SDL_bool is
     (if ((SDL_ISPIXELFORMAT_FOURCC (format) = SDL_FALSE)
         and then ((SDL_PIXELTYPE (format) = SDL_PIXELTYPE_ARRAYU8)
           or else (SDL_PIXELTYPE (format) = SDL_PIXELTYPE_ARRAYU16)
           or else (SDL_PIXELTYPE (format) = SDL_PIXELTYPE_ARRAYU32)
           or else (SDL_PIXELTYPE (format) = SDL_PIXELTYPE_ARRAYF16)
           or else (SDL_PIXELTYPE (format) = SDL_PIXELTYPE_ARRAYF32)))
      then SDL_TRUE
      else SDL_FALSE);

   function SDL_ISPIXELFORMAT_ALPHA (format : Unsigned_32) return SDL_bool is
     (if ((SDL_ISPIXELFORMAT_PACKED (format) = SDL_TRUE)
         and then ((SDL_PIXELORDER (format) = SDL_PACKEDORDER_ARGB)
           or else (SDL_PIXELORDER (format) = SDL_PACKEDORDER_RGBA)
           or else (SDL_PIXELORDER (format) = SDL_PACKEDORDER_ABGR)
           or else (SDL_PIXELORDER (format) = SDL_PACKEDORDER_BGRA)
           or else (SDL_ISPIXELFORMAT_ARRAY (format) = SDL_TRUE))
         and then ((SDL_PIXELORDER (format) = SDL_ARRAYORDER_ARGB)
           or else (SDL_PIXELORDER (format) = SDL_ARRAYORDER_RGBA)
           or else (SDL_PIXELORDER (format) = SDL_ARRAYORDER_ABGR)
           or else (SDL_PIXELORDER (format) = SDL_ARRAYORDER_BGRA)))
      then SDL_TRUE
      else SDL_FALSE);

   type SDL_Color is record
      r : aliased Unsigned_8;
      g : aliased Unsigned_8;
      b : aliased Unsigned_8;
      a : aliased Unsigned_8;
   end record
     with Convention => C_Pass_By_Copy;

   subtype SDL_Colour is SDL_Color;

   type SDL_Palette is record
      ncolors  : aliased int;
      colors   : access SDL_Color;
      version  : aliased Unsigned_32;
      refcount : aliased int;
   end record
     with Convention => C_Pass_By_Copy;

   type SDL_PixelFormat;
   type SDL_PixelFormat is record
      format        : aliased Unsigned_32;
      palette       : access SDL_Palette;
      BitsPerPixel  : aliased Unsigned_8;
      BytesPerPixel : aliased Unsigned_8;
      padding       : aliased Unsigned_8_Array (0 .. 1);
      Rmask         : aliased Unsigned_32;
      Gmask         : aliased Unsigned_32;
      Bmask         : aliased Unsigned_32;
      Amask         : aliased Unsigned_32;
      Rloss         : aliased Unsigned_8;
      Gloss         : aliased Unsigned_8;
      Bloss         : aliased Unsigned_8;
      Aloss         : aliased Unsigned_8;
      Rshift        : aliased Unsigned_8;
      Gshift        : aliased Unsigned_8;
      Bshift        : aliased Unsigned_8;
      Ashift        : aliased Unsigned_8;
      refcount      : aliased int;
      next          : access SDL_PixelFormat;
   end record
     with Convention => C_Pass_By_Copy;

   function SDL_GetPixelFormatName (format : Unsigned_32) return chars_ptr
     with Import, Convention => C, External_Name => "SDL_GetPixelFormatName";

   function SDL_PixelFormatEnumToMasks
     (format : Unsigned_32;
      bpp    : access int;
      Rmask  : access Unsigned_32;
      Gmask  : access Unsigned_32;
      Bmask  : access Unsigned_32;
      Amask  : access Unsigned_32)
     return SDL_bool
     with Import, Convention => C, External_Name => "SDL_PixelFormatEnumToMasks";

   function SDL_MasksToPixelFormatEnum
     (bpp   : int;
      Rmask : Unsigned_32;
      Gmask : Unsigned_32;
      Bmask : Unsigned_32;
      Amask : Unsigned_32)
     return Unsigned_32
     with Import, Convention => C, External_Name => "SDL_MasksToPixelFormatEnum";

   function SDL_AllocFormat
     (pixel_format : Unsigned_32) return access SDL_PixelFormat
     with Import, Convention => C, External_Name => "SDL_AllocFormat";

   procedure SDL_FreeFormat (format : access SDL_PixelFormat)
     with Import, Convention => C, External_Name => "SDL_FreeFormat";

   function SDL_AllocPalette (ncolors : int) return access SDL_Palette
     with Import, Convention => C, External_Name => "SDL_AllocPalette";

   function SDL_SetPixelFormatPalette
     (format  : access SDL_PixelFormat;
      palette : access SDL_Palette)
     return int
     with Import, Convention => C, External_Name => "SDL_SetPixelFormatPalette";

   function SDL_SetPaletteColors
     (palette    : access SDL_Palette;
      colors     : access constant SDL_Color;
      firstcolor : int;
      ncolors    : int)
     return int
     with Import, Convention => C, External_Name => "SDL_SetPaletteColors";

   procedure SDL_FreePalette (palette : access SDL_Palette)
     with Import, Convention => C, External_Name => "SDL_FreePalette";

   function SDL_MapRGB
     (format : access constant SDL_PixelFormat;
      r      : Unsigned_8;
      g      : Unsigned_8;
      b      : Unsigned_8)
     return Unsigned_32
     with Import, Convention => C, External_Name => "SDL_MapRGB";

   function SDL_MapRGBA
     (format : access constant SDL_PixelFormat;
      r      : Unsigned_8;
      g      : Unsigned_8;
      b      : Unsigned_8;
      a      : Unsigned_8)
     return Unsigned_32
     with Import, Convention => C, External_Name => "SDL_MapRGBA";

   procedure SDL_GetRGB
     (pixel  : Unsigned_32;
      format : access constant SDL_PixelFormat;
      r      : access Unsigned_8;
      g      : access Unsigned_8;
      b      : access Unsigned_8)
     with Import, Convention => C, External_Name => "SDL_GetRGB";

   procedure SDL_GetRGBA
     (pixel  : Unsigned_32;
      format : access constant SDL_PixelFormat;
      r      : access Unsigned_8;
      g      : access Unsigned_8;
      b      : access Unsigned_8;
      a      : access Unsigned_8)
     with Import, Convention => C, External_Name => "SDL_GetRGBA";

   procedure SDL_CalculateGammaRamp (gamma : Float; ramp : access Unsigned_16)
     with Import, Convention => C, External_Name => "SDL_CalculateGammaRamp";

end SDL.Pixels;
