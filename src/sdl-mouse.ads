with SDL.Video;   use SDL.Video;
with SDL.Surface; use SDL.Surface;

package SDL.Mouse is

   function SDL_BUTTON (X : Unsigned_8) return Unsigned_8 is
     (2**(Natural (X) - 1));

   SDL_BUTTON_LEFT   : constant := 1;
   SDL_BUTTON_MIDDLE : constant := 2;
   SDL_BUTTON_RIGHT  : constant := 3;
   SDL_BUTTON_X1     : constant := 4;
   SDL_BUTTON_X2     : constant := 5;

   SDL_BUTTON_LMASK  : constant Unsigned_8 := SDL_BUTTON (SDL_BUTTON_LEFT);
   SDL_BUTTON_MMASK  : constant Unsigned_8 := SDL_BUTTON (SDL_BUTTON_MIDDLE);
   SDL_BUTTON_RMASK  : constant Unsigned_8 := SDL_BUTTON (SDL_BUTTON_RIGHT);
   SDL_BUTTON_X1MASK : constant Unsigned_8 := SDL_BUTTON (SDL_BUTTON_X1);
   SDL_BUTTON_X2MASK : constant Unsigned_8 := SDL_BUTTON (SDL_BUTTON_X2);

   type SDL_Cursor is null record;   -- incomplete struct

   type SDL_SystemCursor is
     (SDL_SYSTEM_CURSOR_ARROW,
      SDL_SYSTEM_CURSOR_IBEAM,
      SDL_SYSTEM_CURSOR_WAIT,
      SDL_SYSTEM_CURSOR_CROSSHAIR,
      SDL_SYSTEM_CURSOR_WAITARROW,
      SDL_SYSTEM_CURSOR_SIZENWSE,
      SDL_SYSTEM_CURSOR_SIZENESW,
      SDL_SYSTEM_CURSOR_SIZEWE,
      SDL_SYSTEM_CURSOR_SIZENS,
      SDL_SYSTEM_CURSOR_SIZEALL,
      SDL_SYSTEM_CURSOR_NO,
      SDL_SYSTEM_CURSOR_HAND,
      SDL_NUM_SYSTEM_CURSORS)
     with Convention => C;

   type SDL_MouseWheelDirection is
     (SDL_MOUSEWHEEL_NORMAL,
      SDL_MOUSEWHEEL_FLIPPED)
     with Convention => C;

   function SDL_GetMouseFocus return access SDL_Window
     with Import, Convention => C, External_Name => "SDL_GetMouseFocus";

   function SDL_GetMouseState
     (x : access int;
      y : access int)
     return Unsigned_32
     with Import, Convention => C, External_Name => "SDL_GetMouseState";

   function SDL_GetGlobalMouseState
     (x : access int;
      y : access int)
     return Unsigned_32
     with Import, Convention => C, External_Name => "SDL_GetGlobalMouseState";

   function SDL_GetRelativeMouseState
     (x : access int;
      y : access int)
     return Unsigned_32
     with Import, Convention => C, External_Name => "SDL_GetRelativeMouseState";

   procedure SDL_WarpMouseInWindow
     (window : access SDL_Window;
      x      : int;
      y      : int)
     with Import, Convention => C, External_Name => "SDL_WarpMouseInWindow";

   function SDL_WarpMouseGlobal
     (x : int;
      y : int)
     return int
     with Import, Convention => C, External_Name => "SDL_WarpMouseGlobal";

   function SDL_SetRelativeMouseMode (enabled : SDL_bool) return int
     with Import, Convention => C, External_Name => "SDL_SetRelativeMouseMode";

   function SDL_CaptureMouse (enabled : SDL_bool) return int
     with Import, Convention => C, External_Name => "SDL_CaptureMouse";

   function SDL_GetRelativeMouseMode return SDL_bool
     with Import, Convention => C, External_Name => "SDL_GetRelativeMouseMode";

   function SDL_CreateCursor
     (data  : access Unsigned_8;
      mask  : access Unsigned_8;
      w     : int;
      h     : int;
      hot_x : int;
      hot_y : int)
     return access SDL_Cursor
     with Import, Convention => C, External_Name => "SDL_CreateCursor";

   function SDL_CreateColorCursor
     (surface : access SDL_Surface;
      hot_x   : int;
      hot_y   : int)
     return access SDL_Cursor
     with Import, Convention => C, External_Name => "SDL_CreateColorCursor";

   function SDL_CreateSystemCursor
     (id : SDL_SystemCursor) return access SDL_Cursor
     with Import, Convention => C, External_Name => "SDL_CreateSystemCursor";

   procedure SDL_SetCursor (cursor : access SDL_Cursor)
     with Import, Convention => C, External_Name => "SDL_SetCursor";

   function SDL_GetCursor return access SDL_Cursor
     with Import, Convention => C, External_Name => "SDL_GetCursor";

   function SDL_GetDefaultCursor return access SDL_Cursor
     with Import, Convention => C, External_Name => "SDL_GetDefaultCursor";

   procedure SDL_FreeCursor (cursor : access SDL_Cursor)
     with Import, Convention => C, External_Name => "SDL_FreeCursor";

   function SDL_ShowCursor (toggle : int) return int
     with Import, Convention => C, External_Name => "SDL_ShowCursor";

end SDL.Mouse;
