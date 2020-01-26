pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with SDL2_SDL_stdinc_h;
with Interfaces.C.Strings;
with System;
limited with SDL2_SDL_video_h;
limited with SDL2_SDL_surface_h;
with SDL2_SDL_blendmode_h;
limited with SDL2_SDL_rect_h;

package SDL2_SDL_render_h is

   subtype SDL_RendererFlags is unsigned;
   SDL_RENDERER_SOFTWARE : constant unsigned := 1;
   SDL_RENDERER_ACCELERATED : constant unsigned := 2;
   SDL_RENDERER_PRESENTVSYNC : constant unsigned := 4;
   SDL_RENDERER_TARGETTEXTURE : constant unsigned := 8;  -- /usr/include/SDL2/SDL_render.h:73

   type SDL_RendererInfo_texture_formats_array is array (0 .. 15) of aliased SDL2_SDL_stdinc_h.Uint32;
   type SDL_RendererInfo is record
      name : Interfaces.C.Strings.chars_ptr;  -- /usr/include/SDL2/SDL_render.h:80
      flags : aliased SDL2_SDL_stdinc_h.Uint32;  -- /usr/include/SDL2/SDL_render.h:81
      num_texture_formats : aliased SDL2_SDL_stdinc_h.Uint32;  -- /usr/include/SDL2/SDL_render.h:82
      texture_formats : aliased SDL_RendererInfo_texture_formats_array;  -- /usr/include/SDL2/SDL_render.h:83
      max_texture_width : aliased int;  -- /usr/include/SDL2/SDL_render.h:84
      max_texture_height : aliased int;  -- /usr/include/SDL2/SDL_render.h:85
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/SDL2/SDL_render.h:78

   type SDL_TextureAccess is 
     (SDL_TEXTUREACCESS_STATIC,
      SDL_TEXTUREACCESS_STREAMING,
      SDL_TEXTUREACCESS_TARGET)
   with Convention => C;  -- /usr/include/SDL2/SDL_render.h:96

   type SDL_TextureModulate is 
     (SDL_TEXTUREMODULATE_NONE,
      SDL_TEXTUREMODULATE_COLOR,
      SDL_TEXTUREMODULATE_ALPHA)
   with Convention => C;  -- /usr/include/SDL2/SDL_render.h:106

   type SDL_RendererFlip is 
     (SDL_FLIP_NONE,
      SDL_FLIP_HORIZONTAL,
      SDL_FLIP_VERTICAL)
   with Convention => C;  -- /usr/include/SDL2/SDL_render.h:116

   type SDL_Renderer is null record;   -- incomplete struct

   type SDL_Texture is null record;   -- incomplete struct

   function SDL_GetNumRenderDrivers return int  -- /usr/include/SDL2/SDL_render.h:144
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetNumRenderDrivers";

   function SDL_GetRenderDriverInfo (index : int; info : access SDL_RendererInfo) return int  -- /usr/include/SDL2/SDL_render.h:158
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetRenderDriverInfo";

   function SDL_CreateWindowAndRenderer
     (width : int;
      height : int;
      window_flags : SDL2_SDL_stdinc_h.Uint32;
      window : System.Address;
      renderer : System.Address) return int  -- /usr/include/SDL2/SDL_render.h:172
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_CreateWindowAndRenderer";

   function SDL_CreateRenderer
     (window : access SDL2_SDL_video_h.SDL_Window;
      index : int;
      flags : SDL2_SDL_stdinc_h.Uint32) return access SDL_Renderer  -- /usr/include/SDL2/SDL_render.h:191
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_CreateRenderer";

   function SDL_CreateSoftwareRenderer (surface : access SDL2_SDL_surface_h.SDL_Surface) return access SDL_Renderer  -- /usr/include/SDL2/SDL_render.h:204
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_CreateSoftwareRenderer";

   function SDL_GetRenderer (window : access SDL2_SDL_video_h.SDL_Window) return access SDL_Renderer  -- /usr/include/SDL2/SDL_render.h:209
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetRenderer";

   function SDL_GetRendererInfo (renderer : access SDL_Renderer; info : access SDL_RendererInfo) return int  -- /usr/include/SDL2/SDL_render.h:214
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetRendererInfo";

   function SDL_GetRendererOutputSize
     (renderer : access SDL_Renderer;
      w : access int;
      h : access int) return int  -- /usr/include/SDL2/SDL_render.h:220
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetRendererOutputSize";

   function SDL_CreateTexture
     (renderer : access SDL_Renderer;
      format : SDL2_SDL_stdinc_h.Uint32;
      c_access : int;
      w : int;
      h : int) return access SDL_Texture  -- /usr/include/SDL2/SDL_render.h:242
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_CreateTexture";

   function SDL_CreateTextureFromSurface (renderer : access SDL_Renderer; surface : access SDL2_SDL_surface_h.SDL_Surface) return access SDL_Texture  -- /usr/include/SDL2/SDL_render.h:260
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_CreateTextureFromSurface";

   function SDL_QueryTexture
     (texture : access SDL_Texture;
      format : access SDL2_SDL_stdinc_h.Uint32;
      c_access : access int;
      w : access int;
      h : access int) return int  -- /usr/include/SDL2/SDL_render.h:275
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_QueryTexture";

   function SDL_SetTextureColorMod
     (texture : access SDL_Texture;
      r : SDL2_SDL_stdinc_h.Uint8;
      g : SDL2_SDL_stdinc_h.Uint8;
      b : SDL2_SDL_stdinc_h.Uint8) return int  -- /usr/include/SDL2/SDL_render.h:292
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetTextureColorMod";

   function SDL_GetTextureColorMod
     (texture : access SDL_Texture;
      r : access SDL2_SDL_stdinc_h.Uint8;
      g : access SDL2_SDL_stdinc_h.Uint8;
      b : access SDL2_SDL_stdinc_h.Uint8) return int  -- /usr/include/SDL2/SDL_render.h:308
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetTextureColorMod";

   function SDL_SetTextureAlphaMod (texture : access SDL_Texture; alpha : SDL2_SDL_stdinc_h.Uint8) return int  -- /usr/include/SDL2/SDL_render.h:323
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetTextureAlphaMod";

   function SDL_GetTextureAlphaMod (texture : access SDL_Texture; alpha : access SDL2_SDL_stdinc_h.Uint8) return int  -- /usr/include/SDL2/SDL_render.h:336
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetTextureAlphaMod";

   function SDL_SetTextureBlendMode (texture : access SDL_Texture; blendMode : SDL2_SDL_blendmode_h.SDL_BlendMode) return int  -- /usr/include/SDL2/SDL_render.h:353
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetTextureBlendMode";

   function SDL_GetTextureBlendMode (texture : access SDL_Texture; blendMode : access SDL2_SDL_blendmode_h.SDL_BlendMode) return int  -- /usr/include/SDL2/SDL_render.h:366
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetTextureBlendMode";

   function SDL_UpdateTexture
     (texture : access SDL_Texture;
      rect : access constant SDL2_SDL_rect_h.SDL_Rect;
      pixels : System.Address;
      pitch : int) return int  -- /usr/include/SDL2/SDL_render.h:385
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_UpdateTexture";

   function SDL_UpdateYUVTexture
     (texture : access SDL_Texture;
      rect : access constant SDL2_SDL_rect_h.SDL_Rect;
      Yplane : access SDL2_SDL_stdinc_h.Uint8;
      Ypitch : int;
      Uplane : access SDL2_SDL_stdinc_h.Uint8;
      Upitch : int;
      Vplane : access SDL2_SDL_stdinc_h.Uint8;
      Vpitch : int) return int  -- /usr/include/SDL2/SDL_render.h:408
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_UpdateYUVTexture";

   function SDL_LockTexture
     (texture : access SDL_Texture;
      rect : access constant SDL2_SDL_rect_h.SDL_Rect;
      pixels : System.Address;
      pitch : access int) return int  -- /usr/include/SDL2/SDL_render.h:429
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_LockTexture";

   procedure SDL_UnlockTexture (texture : access SDL_Texture)  -- /usr/include/SDL2/SDL_render.h:438
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_UnlockTexture";

   function SDL_RenderTargetSupported (renderer : access SDL_Renderer) return SDL2_SDL_stdinc_h.SDL_bool  -- /usr/include/SDL2/SDL_render.h:447
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderTargetSupported";

   function SDL_SetRenderTarget (renderer : access SDL_Renderer; texture : access SDL_Texture) return int  -- /usr/include/SDL2/SDL_render.h:459
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetRenderTarget";

   function SDL_GetRenderTarget (renderer : access SDL_Renderer) return access SDL_Texture  -- /usr/include/SDL2/SDL_render.h:469
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetRenderTarget";

   function SDL_RenderSetLogicalSize
     (renderer : access SDL_Renderer;
      w : int;
      h : int) return int  -- /usr/include/SDL2/SDL_render.h:494
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderSetLogicalSize";

   procedure SDL_RenderGetLogicalSize
     (renderer : access SDL_Renderer;
      w : access int;
      h : access int)  -- /usr/include/SDL2/SDL_render.h:505
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderGetLogicalSize";

   function SDL_RenderSetIntegerScale (renderer : access SDL_Renderer; enable : SDL2_SDL_stdinc_h.SDL_bool) return int  -- /usr/include/SDL2/SDL_render.h:519
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderSetIntegerScale";

   function SDL_RenderGetIntegerScale (renderer : access SDL_Renderer) return SDL2_SDL_stdinc_h.SDL_bool  -- /usr/include/SDL2/SDL_render.h:529
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderGetIntegerScale";

   function SDL_RenderSetViewport (renderer : access SDL_Renderer; rect : access constant SDL2_SDL_rect_h.SDL_Rect) return int  -- /usr/include/SDL2/SDL_render.h:546
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderSetViewport";

   procedure SDL_RenderGetViewport (renderer : access SDL_Renderer; rect : access SDL2_SDL_rect_h.SDL_Rect)  -- /usr/include/SDL2/SDL_render.h:554
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderGetViewport";

   function SDL_RenderSetClipRect (renderer : access SDL_Renderer; rect : access constant SDL2_SDL_rect_h.SDL_Rect) return int  -- /usr/include/SDL2/SDL_render.h:568
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderSetClipRect";

   procedure SDL_RenderGetClipRect (renderer : access SDL_Renderer; rect : access SDL2_SDL_rect_h.SDL_Rect)  -- /usr/include/SDL2/SDL_render.h:580
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderGetClipRect";

   function SDL_RenderIsClipEnabled (renderer : access SDL_Renderer) return SDL2_SDL_stdinc_h.SDL_bool  -- /usr/include/SDL2/SDL_render.h:590
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderIsClipEnabled";

   function SDL_RenderSetScale
     (renderer : access SDL_Renderer;
      scaleX : float;
      scaleY : float) return int  -- /usr/include/SDL2/SDL_render.h:611
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderSetScale";

   procedure SDL_RenderGetScale
     (renderer : access SDL_Renderer;
      scaleX : access float;
      scaleY : access float)  -- /usr/include/SDL2/SDL_render.h:623
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderGetScale";

   function SDL_SetRenderDrawColor
     (renderer : access SDL_Renderer;
      r : SDL2_SDL_stdinc_h.Uint8;
      g : SDL2_SDL_stdinc_h.Uint8;
      b : SDL2_SDL_stdinc_h.Uint8;
      a : SDL2_SDL_stdinc_h.Uint8) return int  -- /usr/include/SDL2/SDL_render.h:638
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetRenderDrawColor";

   function SDL_GetRenderDrawColor
     (renderer : access SDL_Renderer;
      r : access SDL2_SDL_stdinc_h.Uint8;
      g : access SDL2_SDL_stdinc_h.Uint8;
      b : access SDL2_SDL_stdinc_h.Uint8;
      a : access SDL2_SDL_stdinc_h.Uint8) return int  -- /usr/include/SDL2/SDL_render.h:654
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetRenderDrawColor";

   function SDL_SetRenderDrawBlendMode (renderer : access SDL_Renderer; blendMode : SDL2_SDL_blendmode_h.SDL_BlendMode) return int  -- /usr/include/SDL2/SDL_render.h:671
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetRenderDrawBlendMode";

   function SDL_GetRenderDrawBlendMode (renderer : access SDL_Renderer; blendMode : access SDL2_SDL_blendmode_h.SDL_BlendMode) return int  -- /usr/include/SDL2/SDL_render.h:684
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetRenderDrawBlendMode";

   function SDL_RenderClear (renderer : access SDL_Renderer) return int  -- /usr/include/SDL2/SDL_render.h:695
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderClear";

   function SDL_RenderDrawPoint
     (renderer : access SDL_Renderer;
      x : int;
      y : int) return int  -- /usr/include/SDL2/SDL_render.h:706
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderDrawPoint";

   function SDL_RenderDrawPoints
     (renderer : access SDL_Renderer;
      points : access constant SDL2_SDL_rect_h.SDL_Point;
      count : int) return int  -- /usr/include/SDL2/SDL_render.h:718
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderDrawPoints";

   function SDL_RenderDrawLine
     (renderer : access SDL_Renderer;
      x1 : int;
      y1 : int;
      x2 : int;
      y2 : int) return int  -- /usr/include/SDL2/SDL_render.h:733
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderDrawLine";

   function SDL_RenderDrawLines
     (renderer : access SDL_Renderer;
      points : access constant SDL2_SDL_rect_h.SDL_Point;
      count : int) return int  -- /usr/include/SDL2/SDL_render.h:745
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderDrawLines";

   function SDL_RenderDrawRect (renderer : access SDL_Renderer; rect : access constant SDL2_SDL_rect_h.SDL_Rect) return int  -- /usr/include/SDL2/SDL_render.h:757
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderDrawRect";

   function SDL_RenderDrawRects
     (renderer : access SDL_Renderer;
      rects : access constant SDL2_SDL_rect_h.SDL_Rect;
      count : int) return int  -- /usr/include/SDL2/SDL_render.h:769
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderDrawRects";

   function SDL_RenderFillRect (renderer : access SDL_Renderer; rect : access constant SDL2_SDL_rect_h.SDL_Rect) return int  -- /usr/include/SDL2/SDL_render.h:782
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderFillRect";

   function SDL_RenderFillRects
     (renderer : access SDL_Renderer;
      rects : access constant SDL2_SDL_rect_h.SDL_Rect;
      count : int) return int  -- /usr/include/SDL2/SDL_render.h:794
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderFillRects";

   function SDL_RenderCopy
     (renderer : access SDL_Renderer;
      texture : access SDL_Texture;
      srcrect : access constant SDL2_SDL_rect_h.SDL_Rect;
      dstrect : access constant SDL2_SDL_rect_h.SDL_Rect) return int  -- /usr/include/SDL2/SDL_render.h:810
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderCopy";

   function SDL_RenderCopyEx
     (renderer : access SDL_Renderer;
      texture : access SDL_Texture;
      srcrect : access constant SDL2_SDL_rect_h.SDL_Rect;
      dstrect : access constant SDL2_SDL_rect_h.SDL_Rect;
      angle : double;
      center : access constant SDL2_SDL_rect_h.SDL_Point;
      flip : SDL_RendererFlip) return int  -- /usr/include/SDL2/SDL_render.h:830
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderCopyEx";

   function SDL_RenderDrawPointF
     (renderer : access SDL_Renderer;
      x : float;
      y : float) return int  -- /usr/include/SDL2/SDL_render.h:848
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderDrawPointF";

   function SDL_RenderDrawPointsF
     (renderer : access SDL_Renderer;
      points : access constant SDL2_SDL_rect_h.SDL_FPoint;
      count : int) return int  -- /usr/include/SDL2/SDL_render.h:860
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderDrawPointsF";

   function SDL_RenderDrawLineF
     (renderer : access SDL_Renderer;
      x1 : float;
      y1 : float;
      x2 : float;
      y2 : float) return int  -- /usr/include/SDL2/SDL_render.h:875
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderDrawLineF";

   function SDL_RenderDrawLinesF
     (renderer : access SDL_Renderer;
      points : access constant SDL2_SDL_rect_h.SDL_FPoint;
      count : int) return int  -- /usr/include/SDL2/SDL_render.h:887
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderDrawLinesF";

   function SDL_RenderDrawRectF (renderer : access SDL_Renderer; rect : access constant SDL2_SDL_rect_h.SDL_FRect) return int  -- /usr/include/SDL2/SDL_render.h:899
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderDrawRectF";

   function SDL_RenderDrawRectsF
     (renderer : access SDL_Renderer;
      rects : access constant SDL2_SDL_rect_h.SDL_FRect;
      count : int) return int  -- /usr/include/SDL2/SDL_render.h:911
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderDrawRectsF";

   function SDL_RenderFillRectF (renderer : access SDL_Renderer; rect : access constant SDL2_SDL_rect_h.SDL_FRect) return int  -- /usr/include/SDL2/SDL_render.h:924
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderFillRectF";

   function SDL_RenderFillRectsF
     (renderer : access SDL_Renderer;
      rects : access constant SDL2_SDL_rect_h.SDL_FRect;
      count : int) return int  -- /usr/include/SDL2/SDL_render.h:936
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderFillRectsF";

   function SDL_RenderCopyF
     (renderer : access SDL_Renderer;
      texture : access SDL_Texture;
      srcrect : access constant SDL2_SDL_rect_h.SDL_Rect;
      dstrect : access constant SDL2_SDL_rect_h.SDL_FRect) return int  -- /usr/include/SDL2/SDL_render.h:952
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderCopyF";

   function SDL_RenderCopyExF
     (renderer : access SDL_Renderer;
      texture : access SDL_Texture;
      srcrect : access constant SDL2_SDL_rect_h.SDL_Rect;
      dstrect : access constant SDL2_SDL_rect_h.SDL_FRect;
      angle : double;
      center : access constant SDL2_SDL_rect_h.SDL_FPoint;
      flip : SDL_RendererFlip) return int  -- /usr/include/SDL2/SDL_render.h:972
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderCopyExF";

   function SDL_RenderReadPixels
     (renderer : access SDL_Renderer;
      rect : access constant SDL2_SDL_rect_h.SDL_Rect;
      format : SDL2_SDL_stdinc_h.Uint32;
      pixels : System.Address;
      pitch : int) return int  -- /usr/include/SDL2/SDL_render.h:995
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderReadPixels";

   procedure SDL_RenderPresent (renderer : access SDL_Renderer)  -- /usr/include/SDL2/SDL_render.h:1003
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderPresent";

   procedure SDL_DestroyTexture (texture : access SDL_Texture)  -- /usr/include/SDL2/SDL_render.h:1011
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_DestroyTexture";

   procedure SDL_DestroyRenderer (renderer : access SDL_Renderer)  -- /usr/include/SDL2/SDL_render.h:1019
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_DestroyRenderer";

   function SDL_RenderFlush (renderer : access SDL_Renderer) return int  -- /usr/include/SDL2/SDL_render.h:1044
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderFlush";

   function SDL_GL_BindTexture
     (texture : access SDL_Texture;
      texw : access float;
      texh : access float) return int  -- /usr/include/SDL2/SDL_render.h:1057
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GL_BindTexture";

   function SDL_GL_UnbindTexture (texture : access SDL_Texture) return int  -- /usr/include/SDL2/SDL_render.h:1066
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GL_UnbindTexture";

   function SDL_RenderGetMetalLayer (renderer : access SDL_Renderer) return System.Address  -- /usr/include/SDL2/SDL_render.h:1077
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderGetMetalLayer";

   function SDL_RenderGetMetalCommandEncoder (renderer : access SDL_Renderer) return System.Address  -- /usr/include/SDL2/SDL_render.h:1088
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderGetMetalCommandEncoder";

end SDL2_SDL_render_h;
