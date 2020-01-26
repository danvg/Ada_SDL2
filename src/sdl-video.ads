with SDL.Rect;    use SDL.Rect;
with SDL.Surface; use SDL.Surface;

package SDL.Video is

   SDL_WINDOWPOS_UNDEFINED_MASK : constant := 16#1FFF0000#;

   function SDL_WINDOWPOS_UNDEFINED_DISPLAY (X : int) return int is
     (int (SDL_WINDOWPOS_UNDEFINED_MASK or Unsigned_32 (X)));

   SDL_WINDOWPOS_UNDEFINED : constant int :=
     SDL_WINDOWPOS_UNDEFINED_DISPLAY (0);

   function SDL_WINDOWPOS_ISUNDEFINED (X : int) return SDL_bool is
     (if (Unsigned_32 (X) and 16#FFFF0000#) = SDL_WINDOWPOS_UNDEFINED_MASK
      then SDL_TRUE else SDL_FALSE);

   SDL_WINDOWPOS_CENTERED_MASK : constant := 16#2FFF0000#;

   function SDL_WINDOWPOS_CENTERED_DISPLAY (X : int) return int is
     (int (SDL_WINDOWPOS_CENTERED_MASK or Unsigned_32 (X)));

   SDL_WINDOWPOS_CENTERED : constant int := SDL_WINDOWPOS_CENTERED_DISPLAY (0);

   function SDL_WINDOWPOS_ISCENTERED (X : unsigned) return SDL_bool is
     (if (X and 16#FFFF0000#) = SDL_WINDOWPOS_CENTERED_MASK then SDL_TRUE
      else SDL_FALSE);

   type SDL_DisplayMode is record
      format       : aliased Unsigned_32;
      w            : aliased int;
      h            : aliased int;
      refresh_rate : aliased int;
      driverdata   : System.Address;
   end record
     with Convention => C_Pass_By_Copy;

   type SDL_Window is null record;   -- incomplete struct

   subtype SDL_WindowFlags is unsigned;
   SDL_WINDOW_FULLSCREEN         : constant := 1;
   SDL_WINDOW_OPENGL             : constant := 2;
   SDL_WINDOW_SHOWN              : constant := 4;
   SDL_WINDOW_HIDDEN             : constant := 8;
   SDL_WINDOW_BORDERLESS         : constant := 16;
   SDL_WINDOW_RESIZABLE          : constant := 32;
   SDL_WINDOW_MINIMIZED          : constant := 64;
   SDL_WINDOW_MAXIMIZED          : constant := 128;
   SDL_WINDOW_INPUT_GRABBED      : constant := 256;
   SDL_WINDOW_INPUT_FOCUS        : constant := 512;
   SDL_WINDOW_MOUSE_FOCUS        : constant := 1024;
   SDL_WINDOW_FULLSCREEN_DESKTOP : constant := 4097;
   SDL_WINDOW_FOREIGN            : constant := 2048;
   SDL_WINDOW_ALLOW_HIGHDPI      : constant := 8192;
   SDL_WINDOW_MOUSE_CAPTURE      : constant := 16384;
   SDL_WINDOW_ALWAYS_ON_TOP      : constant := 32768;
   SDL_WINDOW_SKIP_TASKBAR       : constant := 65536;
   SDL_WINDOW_UTILITY            : constant := 131072;
   SDL_WINDOW_TOOLTIP            : constant := 262144;
   SDL_WINDOW_POPUP_MENU         : constant := 524288;
   SDL_WINDOW_VULKAN             : constant := 268435456;

   type SDL_WindowEventID is
     (SDL_WINDOWEVENT_NONE,
      SDL_WINDOWEVENT_SHOWN,
      SDL_WINDOWEVENT_HIDDEN,
      SDL_WINDOWEVENT_EXPOSED,
      SDL_WINDOWEVENT_MOVED,
      SDL_WINDOWEVENT_RESIZED,
      SDL_WINDOWEVENT_SIZE_CHANGED,
      SDL_WINDOWEVENT_MINIMIZED,
      SDL_WINDOWEVENT_MAXIMIZED,
      SDL_WINDOWEVENT_RESTORED,
      SDL_WINDOWEVENT_ENTER,
      SDL_WINDOWEVENT_LEAVE,
      SDL_WINDOWEVENT_FOCUS_GAINED,
      SDL_WINDOWEVENT_FOCUS_LOST,
      SDL_WINDOWEVENT_CLOSE,
      SDL_WINDOWEVENT_TAKE_FOCUS,
      SDL_WINDOWEVENT_HIT_TEST)
     with Convention => C;

   type SDL_DisplayEventID is
     (SDL_DISPLAYEVENT_NONE,
      SDL_DISPLAYEVENT_ORIENTATION)
     with Convention => C;

   type SDL_DisplayOrientation is
     (SDL_ORIENTATION_UNKNOWN,
      SDL_ORIENTATION_LANDSCAPE,
      SDL_ORIENTATION_LANDSCAPE_FLIPPED,
      SDL_ORIENTATION_PORTRAIT,
      SDL_ORIENTATION_PORTRAIT_FLIPPED)
     with Convention => C;

   type SDL_GLContext is new System.Address;

   type SDL_GLattr is
     (SDL_GL_RED_SIZE,
      SDL_GL_GREEN_SIZE,
      SDL_GL_BLUE_SIZE,
      SDL_GL_ALPHA_SIZE,
      SDL_GL_BUFFER_SIZE,
      SDL_GL_DOUBLEBUFFER,
      SDL_GL_DEPTH_SIZE,
      SDL_GL_STENCIL_SIZE,
      SDL_GL_ACCUM_RED_SIZE,
      SDL_GL_ACCUM_GREEN_SIZE,
      SDL_GL_ACCUM_BLUE_SIZE,
      SDL_GL_ACCUM_ALPHA_SIZE,
      SDL_GL_STEREO,
      SDL_GL_MULTISAMPLEBUFFERS,
      SDL_GL_MULTISAMPLESAMPLES,
      SDL_GL_ACCELERATED_VISUAL,
      SDL_GL_RETAINED_BACKING,
      SDL_GL_CONTEXT_MAJOR_VERSION,
      SDL_GL_CONTEXT_MINOR_VERSION,
      SDL_GL_CONTEXT_EGL,
      SDL_GL_CONTEXT_FLAGS,
      SDL_GL_CONTEXT_PROFILE_MASK,
      SDL_GL_SHARE_WITH_CURRENT_CONTEXT,
      SDL_GL_FRAMEBUFFER_SRGB_CAPABLE,
      SDL_GL_CONTEXT_RELEASE_BEHAVIOR,
      SDL_GL_CONTEXT_RESET_NOTIFICATION,
      SDL_GL_CONTEXT_NO_ERROR)
     with Convention => C;

   type SDL_GLprofile is
     (SDL_GL_CONTEXT_PROFILE_CORE,
      SDL_GL_CONTEXT_PROFILE_COMPATIBILITY,
      SDL_GL_CONTEXT_PROFILE_ES)
     with Convention => C;

   for SDL_GLprofile use
     (SDL_GL_CONTEXT_PROFILE_CORE          => 1,
      SDL_GL_CONTEXT_PROFILE_COMPATIBILITY => 2,
      SDL_GL_CONTEXT_PROFILE_ES            => 4);

   subtype SDL_GLcontextFlag is unsigned;
   SDL_GL_CONTEXT_DEBUG_FLAG              : constant := 1;
   SDL_GL_CONTEXT_FORWARD_COMPATIBLE_FLAG : constant := 2;
   SDL_GL_CONTEXT_ROBUST_ACCESS_FLAG      : constant := 4;
   SDL_GL_CONTEXT_RESET_ISOLATION_FLAG    : constant := 8;

   type SDL_GLcontextReleaseFlag is
     (SDL_GL_CONTEXT_RELEASE_BEHAVIOR_NONE,
      SDL_GL_CONTEXT_RELEASE_BEHAVIOR_FLUSH)
     with Convention => C;

   type SDL_GLContextResetNotification is
     (SDL_GL_CONTEXT_RESET_NO_NOTIFICATION,
      SDL_GL_CONTEXT_RESET_LOSE_CONTEXT)
     with Convention => C;

   function SDL_GetNumVideoDrivers return int
     with Import, Convention => C, External_Name => "SDL_GetNumVideoDrivers";

   function SDL_GetVideoDriver (index : int) return chars_ptr
     with Import, Convention => C, External_Name => "SDL_GetVideoDriver";

   function SDL_VideoInit (driver_name : char_array) return int
     with Import, Convention => C, External_Name => "SDL_VideoInit";

   procedure SDL_VideoQuit
     with Import, Convention => C, External_Name => "SDL_VideoQuit";

   function SDL_GetCurrentVideoDriver return chars_ptr
     with Import, Convention => C, External_Name => "SDL_GetCurrentVideoDriver";

   function SDL_GetNumVideoDisplays return int
     with Import, Convention => C, External_Name => "SDL_GetNumVideoDisplays";

   function SDL_GetDisplayName (displayIndex : int) return chars_ptr
     with Import, Convention => C, External_Name => "SDL_GetDisplayName";

   function SDL_GetDisplayBounds
     (displayIndex : int;
      rect         : access SDL_Rect)
     return int
     with Import, Convention => C, External_Name => "SDL_GetDisplayBounds";

   function SDL_GetDisplayUsableBounds
     (displayIndex : int;
      rect         : access SDL_Rect)
     return int
     with Import, Convention => C, External_Name => "SDL_GetDisplayUsableBounds";

   function SDL_GetDisplayDPI
     (displayIndex : int;
      ddpi         : access Float;
      hdpi         : access Float;
      vdpi         : access Float)
     return int
     with Import, Convention => C, External_Name => "SDL_GetDisplayDPI";

   function SDL_GetDisplayOrientation
     (displayIndex : int) return SDL_DisplayOrientation
     with Import, Convention => C, External_Name => "SDL_GetDisplayOrientation";

   function SDL_GetNumDisplayModes (displayIndex : int) return int
     with Import, Convention => C, External_Name => "SDL_GetNumDisplayModes";

   function SDL_GetDisplayMode
     (displayIndex : int;
      modeIndex    : int;
      mode         : access SDL_DisplayMode)
     return int
     with Import, Convention => C, External_Name => "SDL_GetDisplayMode";

   function SDL_GetDesktopDisplayMode
     (displayIndex : int;
      mode         : access SDL_DisplayMode)
     return int
     with Import, Convention => C, External_Name => "SDL_GetDesktopDisplayMode";

   function SDL_GetCurrentDisplayMode
     (displayIndex : int;
      mode         : access SDL_DisplayMode)
     return int
     with Import, Convention => C, External_Name => "SDL_GetCurrentDisplayMode";

   function SDL_GetClosestDisplayMode
     (displayIndex : int;
      mode         : access constant SDL_DisplayMode;
      closest      : access SDL_DisplayMode)
     return access SDL_DisplayMode
     with Import, Convention => C, External_Name => "SDL_GetClosestDisplayMode";

   function SDL_GetWindowDisplayIndex
     (window : access SDL_Window) return int
     with Import, Convention => C, External_Name => "SDL_GetWindowDisplayIndex";

   function SDL_SetWindowDisplayMode
     (window : access SDL_Window;
      mode   : access constant SDL_DisplayMode)
     return int
     with Import, Convention => C, External_Name => "SDL_SetWindowDisplayMode";

   function SDL_GetWindowDisplayMode
     (window : access SDL_Window;
      mode   : access SDL_DisplayMode)
     return int
     with Import, Convention => C, External_Name => "SDL_GetWindowDisplayMode";

   function SDL_GetWindowPixelFormat
     (window : access SDL_Window) return Unsigned_32
     with Import, Convention => C, External_Name => "SDL_GetWindowPixelFormat";

   function SDL_CreateWindow
     (title      : char_array;
      x, y, w, h : int;
      flags      : Unsigned_32)
     return access SDL_Window
     with Import, Convention => C, External_Name => "SDL_CreateWindow";

   function SDL_CreateWindowFrom
     (data : System.Address) return access SDL_Window
     with Import, Convention => C, External_Name => "SDL_CreateWindowFrom";

   function SDL_GetWindowID
     (window : access SDL_Window) return Unsigned_32
     with Import, Convention => C, External_Name => "SDL_GetWindowID";

   function SDL_GetWindowFromID
     (id : Unsigned_32) return access SDL_Window
     with Import, Convention => C, External_Name => "SDL_GetWindowFromID";

   function SDL_GetWindowFlags
     (window : access SDL_Window) return Unsigned_32
     with Import, Convention => C, External_Name => "SDL_GetWindowFlags";

   procedure SDL_SetWindowTitle
     (window : access SDL_Window; title : char_array)
     with Import, Convention => C, External_Name => "SDL_SetWindowTitle";

   function SDL_GetWindowTitle
     (window : access SDL_Window) return chars_ptr
     with Import, Convention => C, External_Name => "SDL_GetWindowTitle";

   procedure SDL_SetWindowIcon
     (window : access SDL_Window; icon : access SDL_Surface)
     with Import, Convention => C, External_Name => "SDL_SetWindowIcon";

   function SDL_SetWindowData
     (window   : access SDL_Window;
      name     : char_array;
      userdata : System.Address)
     return System.Address
     with Import, Convention => C, External_Name => "SDL_SetWindowData";

   function SDL_GetWindowData
     (window : access SDL_Window;
      name   : char_array)
     return System.Address
     with Import, Convention => C, External_Name => "SDL_GetWindowData";

   procedure SDL_SetWindowPosition
     (window : access SDL_Window;
      x      : int;
      y      : int)
     with Import, Convention => C, External_Name => "SDL_SetWindowPosition";

   procedure SDL_GetWindowPosition
     (window : access SDL_Window;
      x      : access int;
      y      : access int)
     with Import, Convention => C, External_Name => "SDL_GetWindowPosition";

   procedure SDL_SetWindowSize
     (window : access SDL_Window;
      w      : int;
      h      : int)
     with Import, Convention => C, External_Name => "SDL_SetWindowSize";

   procedure SDL_GetWindowSize
     (window : access SDL_Window;
      w      : access int;
      h      : access int)
     with Import, Convention => C, External_Name => "SDL_GetWindowSize";

   function SDL_GetWindowBordersSize
     (window : access SDL_Window;
      top    : access int;
      left   : access int;
      bottom : access int;
      right  : access int)
     return int
     with Import, Convention => C, External_Name => "SDL_GetWindowBordersSize";

   procedure SDL_SetWindowMinimumSize
     (window : access SDL_Window;
      min_w  : int;
      min_h  : int)
     with Import, Convention => C, External_Name => "SDL_SetWindowMinimumSize";

   procedure SDL_GetWindowMinimumSize
     (window : access SDL_Window;
      w      : access int;
      h      : access int)
     with Import, Convention => C, External_Name => "SDL_GetWindowMinimumSize";

   procedure SDL_SetWindowMaximumSize
     (window : access SDL_Window;
      max_w  : int;
      max_h  : int)
     with Import, Convention => C, External_Name => "SDL_SetWindowMaximumSize";

   procedure SDL_GetWindowMaximumSize
     (window : access SDL_Window;
      w      : access int;
      h      : access int)
     with Import, Convention => C, External_Name => "SDL_GetWindowMaximumSize";

   procedure SDL_SetWindowBordered
     (window : access SDL_Window; bordered : SDL_bool)
     with Import, Convention => C, External_Name => "SDL_SetWindowBordered";

   procedure SDL_SetWindowResizable
     (window : access SDL_Window; resizable : SDL_bool)
     with Import, Convention => C, External_Name => "SDL_SetWindowResizable";

   procedure SDL_ShowWindow (window : access SDL_Window)
     with Import, Convention => C, External_Name => "SDL_ShowWindow";

   procedure SDL_HideWindow (window : access SDL_Window)
     with Import, Convention => C, External_Name => "SDL_HideWindow";

   procedure SDL_RaiseWindow (window : access SDL_Window)
     with Import, Convention => C, External_Name => "SDL_RaiseWindow";

   procedure SDL_MaximizeWindow (window : access SDL_Window)
     with Import, Convention => C, External_Name => "SDL_MaximizeWindow";

   procedure SDL_MinimizeWindow (window : access SDL_Window)
     with Import, Convention => C, External_Name => "SDL_MinimizeWindow";

   procedure SDL_RestoreWindow (window : access SDL_Window)
     with Import, Convention => C, External_Name => "SDL_RestoreWindow";

   function SDL_SetWindowFullscreen
     (window : access SDL_Window;
      flags  : Unsigned_32)
     return int
     with Import, Convention => C, External_Name => "SDL_SetWindowFullscreen";

   function SDL_GetWindowSurface
     (window : access SDL_Window) return access SDL_Surface
     with Import, Convention => C, External_Name => "SDL_GetWindowSurface";

   function SDL_UpdateWindowSurface
     (window : access SDL_Window) return int
     with Import, Convention => C, External_Name => "SDL_UpdateWindowSurface";

   function SDL_UpdateWindowSurfaceRects
     (window   : access SDL_Window;
      rects    : access constant SDL_Rect;
      numrects : int)
     return int
     with Import, Convention => C, External_Name => "SDL_UpdateWindowSurfaceRects";

   procedure SDL_SetWindowGrab
     (window : access SDL_Window; grabbed : SDL_bool)
     with Import, Convention => C, External_Name => "SDL_SetWindowGrab";

   function SDL_GetWindowGrab (window : access SDL_Window) return SDL_bool
     with Import, Convention => C, External_Name => "SDL_GetWindowGrab";

   function SDL_GetGrabbedWindow return access SDL_Window
     with Import, Convention => C, External_Name => "SDL_GetGrabbedWindow";

   function SDL_SetWindowBrightness
     (window     : access SDL_Window;
      brightness : Float)
     return int
     with Import, Convention => C, External_Name => "SDL_SetWindowBrightness";

   function SDL_GetWindowBrightness
     (window : access SDL_Window) return Float
     with Import, Convention => C, External_Name => "SDL_GetWindowBrightness";

   function SDL_SetWindowOpacity
     (window  : access SDL_Window;
      opacity : Float)
     return int
     with Import, Convention => C, External_Name => "SDL_SetWindowOpacity";

   function SDL_GetWindowOpacity
     (window      : access SDL_Window;
      out_opacity : access Float)
     return int
     with Import, Convention => C, External_Name => "SDL_GetWindowOpacity";

   function SDL_SetWindowModalFor
     (modal_window  : access SDL_Window;
      parent_window : access SDL_Window)
     return int
     with Import, Convention => C, External_Name => "SDL_SetWindowModalFor";

   function SDL_SetWindowInputFocus
     (window : access SDL_Window) return int
     with Import, Convention => C, External_Name => "SDL_SetWindowInputFocus";

   function SDL_SetWindowGammaRamp
     (window : access SDL_Window;
      red    : access Unsigned_16;
      green  : access Unsigned_16;
      blue   : access Unsigned_16)
     return int
     with Import, Convention => C, External_Name => "SDL_SetWindowGammaRamp";

   function SDL_GetWindowGammaRamp
     (window : access SDL_Window;
      red    : access Unsigned_16;
      green  : access Unsigned_16;
      blue   : access Unsigned_16)
     return int
     with Import, Convention => C, External_Name => "SDL_GetWindowGammaRamp";

   type SDL_HitTestResult is
     (SDL_HITTEST_NORMAL,
      SDL_HITTEST_DRAGGABLE,
      SDL_HITTEST_RESIZE_TOPLEFT,
      SDL_HITTEST_RESIZE_TOP,
      SDL_HITTEST_RESIZE_TOPRIGHT,
      SDL_HITTEST_RESIZE_RIGHT,
      SDL_HITTEST_RESIZE_BOTTOMRIGHT,
      SDL_HITTEST_RESIZE_BOTTOM,
      SDL_HITTEST_RESIZE_BOTTOMLEFT,
      SDL_HITTEST_RESIZE_LEFT)
     with Convention => C;

   type SDL_HitTest is access function
     (arg1 : access SDL_Window;
      arg2 : access constant SDL_Point;
      arg3 : System.Address)
     return SDL_HitTestResult
     with Convention => C;

   function SDL_SetWindowHitTest
     (window        : access SDL_Window;
      callback      : SDL_HitTest;
      callback_data : System.Address)
     return int
     with Import, Convention => C, External_Name => "SDL_SetWindowHitTest";

   procedure SDL_DestroyWindow (window : access SDL_Window)
     with Import, Convention => C, External_Name => "SDL_DestroyWindow";

   function SDL_IsScreenSaverEnabled return SDL_bool
     with Import, Convention => C, External_Name => "SDL_IsScreenSaverEnabled";

   procedure SDL_EnableScreenSaver
     with Import, Convention => C, External_Name => "SDL_EnableScreenSaver";

   procedure SDL_DisableScreenSaver
     with Import, Convention => C, External_Name => "SDL_DisableScreenSaver";

   function SDL_GL_LoadLibrary (path : char_array) return int
     with Import, Convention => C, External_Name => "SDL_GL_LoadLibrary";

   function SDL_GL_GetProcAddress
     (proc : char_array) return System.Address
     with Import, Convention => C, External_Name => "SDL_GL_GetProcAddress";

   procedure SDL_GL_UnloadLibrary
     with Import, Convention => C, External_Name => "SDL_GL_UnloadLibrary";

   function SDL_GL_ExtensionSupported
     (extension : char_array) return SDL_bool
     with Import, Convention => C, External_Name => "SDL_GL_ExtensionSupported";

   procedure SDL_GL_ResetAttributes
     with Import, Convention => C, External_Name => "SDL_GL_ResetAttributes";

   function SDL_GL_SetAttribute
     (attr  : SDL_GLattr;
      value : int)
     return int
     with Import, Convention => C, External_Name => "SDL_GL_SetAttribute";

   function SDL_GL_GetAttribute
     (attr  : SDL_GLattr;
      value : access int)
     return int
     with Import, Convention => C, External_Name => "SDL_GL_GetAttribute";

   function SDL_GL_CreateContext
     (window : access SDL_Window) return SDL_GLContext
     with Import, Convention => C, External_Name => "SDL_GL_CreateContext";

   function SDL_GL_MakeCurrent
     (window  : access SDL_Window;
      context : SDL_GLContext)
     return int
     with Import, Convention => C, External_Name => "SDL_GL_MakeCurrent";

   function SDL_GL_GetCurrentWindow return access SDL_Window
     with Import, Convention => C, External_Name => "SDL_GL_GetCurrentWindow";

   function SDL_GL_GetCurrentContext return SDL_GLContext
     with Import, Convention => C, External_Name => "SDL_GL_GetCurrentContext";

   procedure SDL_GL_GetDrawableSize
     (window : access SDL_Window;
      w      : access int;
      h      : access int)
     with Import, Convention => C, External_Name => "SDL_GL_GetDrawableSize";

   function SDL_GL_SetSwapInterval (interval : int) return int
     with Import, Convention => C, External_Name => "SDL_GL_SetSwapInterval";

   function SDL_GL_GetSwapInterval return int
     with Import, Convention => C, External_Name => "SDL_GL_GetSwapInterval";

   procedure SDL_GL_SwapWindow (window : access SDL_Window)
     with Import, Convention => C, External_Name => "SDL_GL_SwapWindow";

   procedure SDL_GL_DeleteContext (context : SDL_GLContext)
     with Import, Convention => C, External_Name => "SDL_GL_DeleteContext";

end SDL.Video;
