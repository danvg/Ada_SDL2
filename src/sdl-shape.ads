with SDL.Video;   use SDL.Video;
with SDL.Pixels;  use SDL.Pixels;
with SDL.Surface; use SDL.Surface;

package SDL.Shape is

   SDL_NONSHAPEABLE_WINDOW    : constant := -1;
   SDL_INVALID_SHAPE_ARGUMENT : constant := -2;
   SDL_WINDOW_LACKS_SHAPE     : constant := -3;

   function SDL_CreateShapedWindow
     (title : Interfaces.C.Strings.chars_ptr;
      x     : unsigned;
      y     : unsigned;
      w     : unsigned;
      h     : unsigned;
      flags : Unsigned_32)
     return access SDL_Window
     with Import, Convention => C, External_Name => "SDL_CreateShapedWindow";

   function SDL_IsShapedWindow
     (window : access constant SDL_Window) return SDL_bool
     with Import, Convention => C, External_Name => "SDL_IsShapedWindow";

   type WindowShapeMode is
     (ShapeModeDefault,
      ShapeModeBinarizeAlpha,
      ShapeModeReverseBinarizeAlpha,
      ShapeModeColorKey)
     with Convention => C;

   function SDL_SHAPEMODEALPHA (mode : WindowShapeMode) return SDL_bool is
     (if ((mode = ShapeModeDefault) or else (mode = ShapeModeBinarizeAlpha)
         or else (mode = ShapeModeReverseBinarizeAlpha))
      then SDL_TRUE
      else SDL_FALSE);

   type SDL_WindowShapeParams (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            binarizationCutoff : aliased Unsigned_8;
         when others =>
            colorKey : aliased SDL_Color;
      end case;
   end record
     with Convention      => C_Pass_By_Copy,
          Unchecked_Union => True;

   type SDL_WindowShapeMode is record
      mode       : aliased WindowShapeMode;
      parameters : aliased SDL_WindowShapeParams;
   end record
     with Convention => C_Pass_By_Copy;

   function SDL_SetWindowShape
     (window     : access SDL_Window;
      shape      : access SDL_Surface;
      shape_mode : access SDL_WindowShapeMode)
     return int
     with Import, Convention => C, External_Name => "SDL_SetWindowShape";

   function SDL_GetShapedWindowMode
     (window     : access SDL_Window;
      shape_mode : access SDL_WindowShapeMode)
     return int
     with Import, Convention => C, External_Name => "SDL_GetShapedWindowMode";

end SDL.Shape;
