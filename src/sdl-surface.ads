with SDL.Pixels;    use SDL.Pixels;
with SDL.Rect;      use SDL.Rect;
with SDL.RWops;     use SDL.RWops;
with SDL.BlendMode; use SDL.BlendMode;

package SDL.Surface is

   SDL_SWSURFACE    : constant := 0;
   SDL_PREALLOC     : constant := 16#00000001#;
   SDL_RLEACCEL     : constant := 16#00000002#;
   SDL_DONTFREE     : constant := 16#00000004#;
   SDL_SIMD_ALIGNED : constant := 16#00000008#;

   type SDL_BlitMap;
   type SDL_Surface is record
      flags     : aliased Unsigned_32;
      format    : access SDL_PixelFormat;
      w         : aliased int;
      h         : aliased int;
      pitch     : aliased int;
      pixels    : System.Address;
      userdata  : System.Address;
      locked    : aliased int;
      lock_data : System.Address;
      clip_rect : aliased SDL_Rect;
      map       : access SDL_BlitMap;
      refcount  : aliased int;
   end record with
      Convention => C_Pass_By_Copy;

   type SDL_BlitMap is null record;   -- incomplete struct

   type SDL_blit is access function
     (arg1 : access SDL_Surface;
      arg2 : access SDL_Rect;
      arg3 : access SDL_Surface;
      arg4 : access SDL_Rect)
     return int
     with Convention => C;

   type SDL_YUV_CONVERSION_MODE is
     (SDL_YUV_CONVERSION_JPEG,
      SDL_YUV_CONVERSION_BT601,
      SDL_YUV_CONVERSION_BT709,
      SDL_YUV_CONVERSION_AUTOMATIC)
     with Convention => C;

   function SDL_MUSTLOCK (S : access SDL_Surface) return SDL_bool is
     (if ((S.flags and SDL_RLEACCEL) /= 0) then SDL_TRUE else SDL_FALSE);

   function SDL_CreateRGBSurface
     (flags  : Unsigned_32;
      width  : int;
      height : int;
      depth  : int;
      Rmask  : Unsigned_32;
      Gmask  : Unsigned_32;
      Bmask  : Unsigned_32;
      Amask  : Unsigned_32)
     return access SDL_Surface
     with Import, Convention => C, External_Name => "SDL_CreateRGBSurface";

   function SDL_CreateRGBSurfaceWithFormat
     (flags  : Unsigned_32;
      width  : int;
      height : int;
      depth  : int;
      format : Unsigned_32)
     return access SDL_Surface
     with Import, Convention => C, External_Name => "SDL_CreateRGBSurfaceWithFormat";

   function SDL_CreateRGBSurfaceFrom
     (pixels : System.Address;
      width  : int;
      height : int;
      depth  : int;
      pitch  : int;
      Rmask  : Unsigned_32;
      Gmask  : Unsigned_32;
      Bmask  : Unsigned_32;
      Amask  : Unsigned_32)
     return access SDL_Surface
     with Import, Convention => C, External_Name => "SDL_CreateRGBSurfaceFrom";

   function SDL_CreateRGBSurfaceWithFormatFrom
     (pixels : System.Address;
      width  : int;
      height : int;
      depth  : int;
      pitch  : int;
      format : Unsigned_32)
     return access SDL_Surface
     with Import, Convention => C, External_Name => "SDL_CreateRGBSurfaceWithFormatFrom";

   procedure SDL_FreeSurface (surface : access SDL_Surface)
     with Import, Convention => C, External_Name => "SDL_FreeSurface";

   function SDL_SetSurfacePalette
     (surface : access SDL_Surface;
      palette : access SDL_Palette)
     return int
     with Import, Convention => C, External_Name => "SDL_SetSurfacePalette";

   function SDL_LockSurface (surface : access SDL_Surface) return int
     with Import, Convention => C, External_Name => "SDL_LockSurface";

   procedure SDL_UnlockSurface (surface : access SDL_Surface)
     with Import, Convention => C, External_Name => "SDL_UnlockSurface";

   function SDL_LoadBMP_RW
     (src     : access SDL_RWops;
      freesrc : int)
     return access SDL_Surface
     with Import, Convention => C, External_Name => "SDL_LoadBMP_RW";

   function SDL_LoadBMP (file : char_array) return access SDL_Surface is
     (SDL_LoadBMP_RW (SDL_RWFromFile (file, To_C ("rb")), 1));

   function SDL_SaveBMP_RW
     (surface : access SDL_Surface;
      dst     : access SDL_RWops;
      freedst : int)
     return int
     with Import, Convention => C, External_Name => "SDL_SaveBMP_RW";

   function SDL_SaveBMP_RW
     (surface : access SDL_Surface;
      file    : char_array)
     return int is
     (SDL_SaveBMP_RW (surface, SDL_RWFromFile (file, To_C ("wb")), 1));

   function SDL_SetSurfaceRLE
     (surface : access SDL_Surface;
      flag    : int)
     return int
     with Import, Convention => C, External_Name => "SDL_SetSurfaceRLE";

   function SDL_SetColorKey
     (surface : access SDL_Surface;
      flag    : int;
      key     : Unsigned_32)
     return int
     with Import, Convention => C, External_Name => "SDL_SetColorKey";

   function SDL_HasColorKey (surface : access SDL_Surface) return SDL_bool
     with Import, Convention => C, External_Name => "SDL_HasColorKey";

   function SDL_GetColorKey
     (surface : access SDL_Surface;
      key     : access Unsigned_32)
     return int
     with Import, Convention => C, External_Name => "SDL_GetColorKey";

   function SDL_SetSurfaceColorMod
     (surface : access SDL_Surface;
      r       : Unsigned_8;
      g       : Unsigned_8;
      b       : Unsigned_8)
     return int
     with Import, Convention => C, External_Name => "SDL_SetSurfaceColorMod";

   function SDL_GetSurfaceColorMod
     (surface : access SDL_Surface;
      r       : access Unsigned_8;
      g       : access Unsigned_8;
      b       : access Unsigned_8)
     return int
     with Import, Convention => C, External_Name => "SDL_GetSurfaceColorMod";

   function SDL_SetSurfaceAlphaMod
     (surface : access SDL_Surface;
      alpha   : Unsigned_8)
     return int
     with Import, Convention => C, External_Name => "SDL_SetSurfaceAlphaMod";

   function SDL_GetSurfaceAlphaMod
     (surface : access SDL_Surface;
      alpha   : access Unsigned_8)
     return int
     with Import, Convention => C, External_Name => "SDL_GetSurfaceAlphaMod";

   function SDL_SetSurfaceBlendMode
     (surface   : access SDL_Surface;
      blendMode : SDL_BlendMode)
     return int
     with Import, Convention => C, External_Name => "SDL_SetSurfaceBlendMode";

   function SDL_GetSurfaceBlendMode
     (surface   : access SDL_Surface;
      blendMode : access SDL_BlendMode)
     return int
     with Import, Convention => C, External_Name => "SDL_GetSurfaceBlendMode";

   function SDL_SetClipRect
     (surface : access SDL_Surface;
      rect    : access constant SDL_Rect)
     return SDL_bool
     with Import, Convention => C, External_Name => "SDL_SetClipRect";

   procedure SDL_GetClipRect
     (surface : access SDL_Surface; rect : access SDL_Rect)
     with Import, Convention => C, External_Name => "SDL_GetClipRect";

   function SDL_DuplicateSurface
     (surface : access SDL_Surface) return access SDL_Surface
     with Import, Convention => C, External_Name => "SDL_DuplicateSurface";

   function SDL_ConvertSurface
     (src   : access SDL_Surface;
      fmt   : access constant SDL_PixelFormat;
      flags : Unsigned_32)
     return access SDL_Surface
     with Import, Convention => C, External_Name => "SDL_ConvertSurface";

   function SDL_ConvertSurfaceFormat
     (src          : access SDL_Surface;
      pixel_format : Unsigned_32;
      flags        : Unsigned_32)
     return access SDL_Surface
     with Import, Convention => C, External_Name => "SDL_ConvertSurfaceFormat";

   function SDL_ConvertPixels
     (width      : int;
      height     : int;
      src_format : Unsigned_32;
      src        : System.Address;
      src_pitch  : int;
      dst_format : Unsigned_32;
      dst        : System.Address;
      dst_pitch  : int)
     return int
     with Import, Convention => C, External_Name => "SDL_ConvertPixels";

   function SDL_FillRect
     (dst   : access SDL_Surface;
      rect  : access constant SDL_Rect;
      color : Unsigned_32)
     return int
     with Import, Convention => C, External_Name => "SDL_FillRect";

   function SDL_FillRects
     (dst   : access SDL_Surface;
      rects : access constant SDL_Rect;
      count : int;
      color : Unsigned_32)
     return int
     with Import, Convention => C, External_Name => "SDL_FillRects";

   function SDL_UpperBlit
     (src     : access SDL_Surface;
      srcrect : access constant SDL_Rect;
      dst     : access SDL_Surface;
      dstrect : access SDL_Rect)
     return int
     with Import, Convention => C, External_Name => "SDL_UpperBlit";

   function SDL_BlitSurface
     (src     : access SDL_Surface;
      srcrect : access constant SDL_Rect;
      dst     : access SDL_Surface;
      dstrect : access SDL_Rect)
     return int renames SDL_UpperBlit;

   function SDL_LowerBlit
     (src     : access SDL_Surface;
      srcrect : access SDL_Rect;
      dst     : access SDL_Surface;
      dstrect : access SDL_Rect)
     return int
     with Import, Convention => C, External_Name => "SDL_LowerBlit";

   function SDL_SoftStretch
     (src     : access SDL_Surface;
      srcrect : access constant SDL_Rect;
      dst     : access SDL_Surface;
      dstrect : access constant SDL_Rect)
     return int
     with Import, Convention => C, External_Name => "SDL_SoftStretch";

   function SDL_UpperBlitScaled
     (src     : access SDL_Surface;
      srcrect : access constant SDL_Rect;
      dst     : access SDL_Surface;
      dstrect : access SDL_Rect)
     return int
     with Import, Convention => C, External_Name => "SDL_UpperBlitScaled";

   function SDL_BlitScaled
     (src     : access SDL_Surface;
      srcrect : access constant SDL_Rect;
      dst     : access SDL_Surface;
      dstrect : access SDL_Rect)
     return int renames SDL_UpperBlitScaled;

   function SDL_LowerBlitScaled
     (src     : access SDL_Surface;
      srcrect : access SDL_Rect;
      dst     : access SDL_Surface;
      dstrect : access SDL_Rect)
     return int
     with Import, Convention => C, External_Name => "SDL_LowerBlitScaled";

   procedure SDL_SetYUVConversionMode (mode : SDL_YUV_CONVERSION_MODE)
     with Import, Convention => C, External_Name => "SDL_SetYUVConversionMode";

   function SDL_GetYUVConversionMode return SDL_YUV_CONVERSION_MODE
     with Import, Convention => C, External_Name => "SDL_GetYUVConversionMode";

   function SDL_GetYUVConversionModeForResolution
     (width  : int;
      height : int)
     return SDL_YUV_CONVERSION_MODE
     with Import, Convention => C, External_Name => "SDL_GetYUVConversionModeForResolution";

end SDL.Surface;
