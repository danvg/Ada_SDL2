with SDL.Video;     use SDL.Video;
with SDL.Surface;   use SDL.Surface;
with SDL.BlendMode; use SDL.BlendMode;
with SDL.Rect;      use SDL.Rect;

package SDL.Render is

   subtype SDL_RendererFlags is unsigned;
   SDL_RENDERER_SOFTWARE      : constant unsigned := 1;
   SDL_RENDERER_ACCELERATED   : constant unsigned := 2;
   SDL_RENDERER_PRESENTVSYNC  : constant unsigned := 4;
   SDL_RENDERER_TARGETTEXTURE : constant unsigned := 8;

   type SDL_RendererInfo is record
      name                : aliased chars_ptr;
      flags               : aliased Unsigned_32;
      num_texture_formats : aliased Unsigned_32;
      texture_formats     : aliased Unsigned_32_Array (0 .. 15);
      max_texture_width   : aliased int;
      max_texture_height  : aliased int;
   end record
     with Convention => C_Pass_By_Copy;

   type SDL_TextureAccess is
     (SDL_TEXTUREACCESS_STATIC,
      SDL_TEXTUREACCESS_STREAMING,
      SDL_TEXTUREACCESS_TARGET)
     with Convention => C;

   type SDL_TextureModulate is
     (SDL_TEXTUREMODULATE_NONE,
      SDL_TEXTUREMODULATE_COLOR,
      SDL_TEXTUREMODULATE_ALPHA)
     with Convention => C;

   type SDL_RendererFlip is
     (SDL_FLIP_NONE,
      SDL_FLIP_HORIZONTAL,
      SDL_FLIP_VERTICAL)
     with Convention => C;

   type SDL_Renderer is null record;   -- incomplete struct
   type SDL_Texture is null record;   -- incomplete struct

   function SDL_GetNumRenderDrivers return int
     with Import, Convention => C, External_Name => "SDL_GetNumRenderDrivers";

   function SDL_GetRenderDriverInfo
     (index : int;
      info  : access SDL_RendererInfo)
     return int
     with Import, Convention => C, External_Name => "SDL_GetRenderDriverInfo";

   function SDL_CreateWindowAndRenderer
     (width        : int;
      height       : int;
      window_flags : Unsigned_32;
      window       : System.Address;
      renderer     : System.Address)
     return int
     with Import, Convention => C, External_Name => "SDL_CreateWindowAndRenderer";

   function SDL_CreateRenderer
     (window : access SDL_Window;
      index  : int;
      flags  : Unsigned_32)
     return access SDL_Renderer
     with Import, Convention => C, External_Name => "SDL_CreateRenderer";

   function SDL_CreateSoftwareRenderer
     (surface : access SDL_Surface) return access SDL_Renderer
     with Import, Convention => C, External_Name => "SDL_CreateSoftwareRenderer";

   function SDL_GetRenderer
     (window : access SDL_Window) return access SDL_Renderer
     with Import, Convention => C, External_Name => "SDL_GetRenderer";

   function SDL_GetRendererInfo
     (renderer : access SDL_Renderer;
      info     : access SDL_RendererInfo)
     return int
     with Import, Convention => C, External_Name => "SDL_GetRendererInfo";

   function SDL_GetRendererOutputSize
     (renderer : access SDL_Renderer;
      w        : access int;
      h        : access int)
     return int
     with Import, Convention => C, External_Name => "SDL_GetRendererOutputSize";

   function SDL_CreateTexture
     (renderer : access SDL_Renderer;
      format   : Unsigned_32;
      c_access : int;
      w        : int;
      h        : int)
     return access SDL_Texture
     with Import, Convention => C, External_Name => "SDL_CreateTexture";

   function SDL_CreateTextureFromSurface
     (renderer : access SDL_Renderer;
      surface  : access SDL_Surface)
     return access SDL_Texture
     with Import, Convention => C, External_Name => "SDL_CreateTextureFromSurface";

   function SDL_QueryTexture
     (texture  : access SDL_Texture;
      format   : access Unsigned_32;
      c_access : access int;
      w        : access int;
      h        : access int)
     return int
     with Import, Convention => C, External_Name => "SDL_QueryTexture";

   function SDL_SetTextureColorMod
     (texture : access SDL_Texture;
      r       : Unsigned_8;
      g       : Unsigned_8;
      b       : Unsigned_8)
     return int
     with Import, Convention => C, External_Name => "SDL_SetTextureColorMod";

   function SDL_GetTextureColorMod
     (texture : access SDL_Texture;
      r       : access Unsigned_8;
      g       : access Unsigned_8;
      b       : access Unsigned_8)
     return int
     with Import, Convention => C, External_Name => "SDL_GetTextureColorMod";

   function SDL_SetTextureAlphaMod
     (texture : access SDL_Texture;
      alpha   : Unsigned_8)
     return int
     with Import, Convention => C, External_Name => "SDL_SetTextureAlphaMod";

   function SDL_GetTextureAlphaMod
     (texture : access SDL_Texture;
      alpha   : access Unsigned_8)
     return int
     with Import, Convention => C, External_Name => "SDL_GetTextureAlphaMod";

   function SDL_SetTextureBlendMode
     (texture   : access SDL_Texture;
      blendMode : SDL_BlendMode)
     return int
     with Import, Convention => C, External_Name => "SDL_SetTextureBlendMode";

   function SDL_GetTextureBlendMode
     (texture   : access SDL_Texture;
      blendMode : access SDL_BlendMode)
     return int
     with Import, Convention => C, External_Name => "SDL_GetTextureBlendMode";

   function SDL_UpdateTexture
     (texture : access SDL_Texture;
      rect    : access constant SDL_Rect;
      pixels  : System.Address;
      pitch   : int)
     return int
     with Import, Convention => C, External_Name => "SDL_UpdateTexture";

   function SDL_UpdateYUVTexture
     (texture : access SDL_Texture;
      rect    : access constant SDL_Rect;
      Yplane  : access Unsigned_8;
      Ypitch  : int;
      Uplane  : access Unsigned_8;
      Upitch  : int;
      Vplane  : access Unsigned_8;
      Vpitch  : int)
     return int
     with Import, Convention => C, External_Name => "SDL_UpdateYUVTexture";

   function SDL_LockTexture
     (texture : access SDL_Texture;
      rect    : access constant SDL_Rect;
      pixels  : System.Address;
      pitch   : access int)
     return int
     with Import, Convention => C, External_Name => "SDL_LockTexture";

   procedure SDL_UnlockTexture (texture : access SDL_Texture)
     with Import, Convention => C, External_Name => "SDL_UnlockTexture";

   function SDL_RenderTargetSupported
     (renderer : access SDL_Renderer) return SDL_bool
     with Import, Convention => C, External_Name => "SDL_RenderTargetSupported";

   function SDL_SetRenderTarget
     (renderer : access SDL_Renderer;
      texture  : access SDL_Texture)
     return int
     with Import, Convention => C, External_Name => "SDL_SetRenderTarget";

   function SDL_GetRenderTarget
     (renderer : access SDL_Renderer) return access SDL_Texture
     with Import, Convention => C, External_Name => "SDL_GetRenderTarget";

   function SDL_RenderSetLogicalSize
     (renderer : access SDL_Renderer;
      w        : int;
      h        : int)
     return int
     with Import, Convention => C, External_Name => "SDL_RenderSetLogicalSize";

   procedure SDL_RenderGetLogicalSize
     (renderer : access SDL_Renderer;
      w        : access int;
      h        : access int)
     with Import, Convention => C, External_Name => "SDL_RenderGetLogicalSize";

   function SDL_RenderSetIntegerScale
     (renderer : access SDL_Renderer;
      enable   : SDL_bool)
     return int
     with Import, Convention => C, External_Name => "SDL_RenderSetIntegerScale";

   function SDL_RenderGetIntegerScale
     (renderer : access SDL_Renderer) return SDL_bool
     with Import, Convention => C, External_Name => "SDL_RenderGetIntegerScale";

   function SDL_RenderSetViewport
     (renderer : access SDL_Renderer;
      rect     : access constant SDL_Rect)
     return int
     with Import, Convention => C, External_Name => "SDL_RenderSetViewport";

   procedure SDL_RenderGetViewport
     (renderer : access SDL_Renderer; rect : access SDL_Rect)
     with Import, Convention => C, External_Name => "SDL_RenderGetViewport";

   function SDL_RenderSetClipRect
     (renderer : access SDL_Renderer;
      rect     : access constant SDL_Rect)
     return int
     with Import, Convention => C, External_Name => "SDL_RenderSetClipRect";

   procedure SDL_RenderGetClipRect
     (renderer : access SDL_Renderer; rect : access SDL_Rect)
     with Import, Convention => C, External_Name => "SDL_RenderGetClipRect";

   function SDL_RenderIsClipEnabled
     (renderer : access SDL_Renderer) return SDL_bool
     with Import, Convention => C, External_Name => "SDL_RenderIsClipEnabled";

   function SDL_RenderSetScale
     (renderer : access SDL_Renderer;
      scaleX   : Float;
      scaleY   : Float)
     return int
     with Import, Convention => C, External_Name => "SDL_RenderSetScale";

   procedure SDL_RenderGetScale
     (renderer : access SDL_Renderer;
      scaleX   : access Float;
      scaleY   : access Float)
     with Import, Convention => C, External_Name => "SDL_RenderGetScale";

   function SDL_SetRenderDrawColor
     (renderer : access SDL_Renderer;
      r        : Unsigned_8;
      g        : Unsigned_8;
      b        : Unsigned_8;
      a        : Unsigned_8)
     return int
     with Import, Convention => C, External_Name => "SDL_SetRenderDrawColor";

   function SDL_GetRenderDrawColor
     (renderer : access SDL_Renderer;
      r        : access Unsigned_8;
      g        : access Unsigned_8;
      b        : access Unsigned_8;
      a        : access Unsigned_8)
     return int
     with Import, Convention => C, External_Name => "SDL_GetRenderDrawColor";

   function SDL_SetRenderDrawBlendMode
     (renderer  : access SDL_Renderer;
      blendMode : SDL_BlendMode)
     return int
     with Import, Convention => C, External_Name => "SDL_SetRenderDrawBlendMode";

   function SDL_GetRenderDrawBlendMode
     (renderer  : access SDL_Renderer;
      blendMode : access SDL_BlendMode)
     return int
     with Import, Convention => C, External_Name => "SDL_GetRenderDrawBlendMode";

   function SDL_RenderClear (renderer : access SDL_Renderer) return int
     with Import, Convention => C, External_Name => "SDL_RenderClear";

   function SDL_RenderDrawPoint
     (renderer : access SDL_Renderer;
      x        : int;
      y        : int)
     return int
     with Import, Convention => C, External_Name => "SDL_RenderDrawPoint";

   function SDL_RenderDrawPoints
     (renderer : access SDL_Renderer;
      points   : access constant SDL_Point;
      count    : int)
     return int
     with Import, Convention => C, External_Name => "SDL_RenderDrawPoints";

   function SDL_RenderDrawLine
     (renderer : access SDL_Renderer;
      x1       : int;
      y1       : int;
      x2       : int;
      y2       : int)
     return int
     with Import, Convention => C, External_Name => "SDL_RenderDrawLine";

   function SDL_RenderDrawLines
     (renderer : access SDL_Renderer;
      points   : access constant SDL_Point;
      count    : int)
     return int
     with Import, Convention => C, External_Name => "SDL_RenderDrawLines";

   function SDL_RenderDrawRect
     (renderer : access SDL_Renderer;
      rect     : access constant SDL_Rect)
     return int
     with Import, Convention => C, External_Name => "SDL_RenderDrawRect";

   function SDL_RenderDrawRects
     (renderer : access SDL_Renderer;
      rects    : access constant SDL_Rect;
      count    : int)
     return int
     with Import, Convention => C, External_Name => "SDL_RenderDrawRects";

   function SDL_RenderFillRect
     (renderer : access SDL_Renderer;
      rect     : access constant SDL_Rect)
     return int
     with Import, Convention => C, External_Name => "SDL_RenderFillRect";

   function SDL_RenderFillRects
     (renderer : access SDL_Renderer;
      rects    : access constant SDL_Rect;
      count    : int)
     return int
     with Import, Convention => C, External_Name => "SDL_RenderFillRects";

   function SDL_RenderCopy
     (renderer : access SDL_Renderer;
      texture  : access SDL_Texture;
      srcrect  : access constant SDL_Rect;
      dstrect  : access constant SDL_Rect)
     return int
     with Import, Convention => C, External_Name => "SDL_RenderCopy";

   function SDL_RenderCopyEx
     (renderer : access SDL_Renderer;
      texture  : access SDL_Texture;
      srcrect  : access constant SDL_Rect;
      dstrect  : access constant SDL_Rect;
      angle    : double;
      center   : access constant SDL_Point;
      flip     : SDL_RendererFlip)
     return int
     with Import, Convention => C, External_Name => "SDL_RenderCopyEx";

   function SDL_RenderDrawPointF
     (renderer : access SDL_Renderer;
      x        : Float;
      y        : Float)
     return int
     with Import, Convention => C, External_Name => "SDL_RenderDrawPointF";

   function SDL_RenderDrawPointsF
     (renderer : access SDL_Renderer;
      points   : access constant SDL_FPoint;
      count    : int)
     return int
     with Import, Convention => C, External_Name => "SDL_RenderDrawPointsF";

   function SDL_RenderDrawLineF
     (renderer : access SDL_Renderer;
      x1       : Float;
      y1       : Float;
      x2       : Float;
      y2       : Float)
     return int
     with Import, Convention => C, External_Name => "SDL_RenderDrawLineF";

   function SDL_RenderDrawLinesF
     (renderer : access SDL_Renderer;
      points   : access constant SDL_FPoint;
      count    : int)
     return int
     with Import, Convention => C, External_Name => "SDL_RenderDrawLinesF";

   function SDL_RenderDrawRectF
     (renderer : access SDL_Renderer;
      rect     : access constant SDL_FRect)
     return int
     with Import, Convention => C, External_Name => "SDL_RenderDrawRectF";

   function SDL_RenderDrawRectsF
     (renderer : access SDL_Renderer;
      rects    : access constant SDL_FRect;
      count    : int)
     return int
     with Import, Convention => C, External_Name => "SDL_RenderDrawRectsF";

   function SDL_RenderFillRectF
     (renderer : access SDL_Renderer;
      rect     : access constant SDL_FRect)
     return int
     with Import, Convention => C, External_Name => "SDL_RenderFillRectF";

   function SDL_RenderFillRectsF
     (renderer : access SDL_Renderer;
      rects    : access constant SDL_FRect;
      count    : int)
     return int
     with Import, Convention => C, External_Name => "SDL_RenderFillRectsF";

   function SDL_RenderCopyF
     (renderer : access SDL_Renderer;
      texture  : access SDL_Texture;
      srcrect  : access constant SDL_Rect;
      dstrect  : access constant SDL_FRect)
     return int
     with Import, Convention => C, External_Name => "SDL_RenderCopyF";

   function SDL_RenderCopyExF
     (renderer : access SDL_Renderer;
      texture  : access SDL_Texture;
      srcrect  : access constant SDL_Rect;
      dstrect  : access constant SDL_FRect;
      angle    : double;
      center   : access constant SDL_FPoint;
      flip     : SDL_RendererFlip)
     return int
     with Import, Convention => C, External_Name => "SDL_RenderCopyExF";

   function SDL_RenderReadPixels
     (renderer : access SDL_Renderer;
      rect     : access constant SDL_Rect;
      format   : Unsigned_32;
      pixels   : System.Address;
      pitch    : int)
     return int
     with Import, Convention => C, External_Name => "SDL_RenderReadPixels";

   procedure SDL_RenderPresent (renderer : access SDL_Renderer)
     with Import, Convention => C, External_Name => "SDL_RenderPresent";

   procedure SDL_DestroyTexture (texture : access SDL_Texture)
     with Import, Convention => C, External_Name => "SDL_DestroyTexture";

   procedure SDL_DestroyRenderer (renderer : access SDL_Renderer)
     with Import, Convention => C, External_Name => "SDL_DestroyRenderer";

   function SDL_RenderFlush (renderer : access SDL_Renderer) return int
     with Import, Convention => C, External_Name => "SDL_RenderFlush";

   function SDL_GL_BindTexture
     (texture : access SDL_Texture;
      texw    : access Float;
      texh    : access Float)
     return int
     with Import, Convention => C, External_Name => "SDL_GL_BindTexture";

   function SDL_GL_UnbindTexture (texture : access SDL_Texture) return int
     with Import, Convention => C, External_Name => "SDL_GL_UnbindTexture";

   function SDL_RenderGetMetalLayer
     (renderer : access SDL_Renderer) return System.Address
     with Import, Convention => C, External_Name => "SDL_RenderGetMetalLayer";

   function SDL_RenderGetMetalCommandEncoder
     (renderer : access SDL_Renderer) return System.Address
     with Import, Convention => C, External_Name => "SDL_RenderGetMetalCommandEncoder";

end SDL.Render;
