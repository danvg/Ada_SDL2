with SDL.Video; use SDL.Video;

package SDL.MessageBox is

   subtype SDL_MessageBoxFlags is unsigned;
   SDL_MESSAGEBOX_ERROR       : constant unsigned := 16;
   SDL_MESSAGEBOX_WARNING     : constant unsigned := 32;
   SDL_MESSAGEBOX_INFORMATION : constant unsigned := 64;

   subtype SDL_MessageBoxButtonFlags is unsigned;
   SDL_MESSAGEBOX_BUTTON_RETURNKEY_DEFAULT : constant unsigned := 1;
   SDL_MESSAGEBOX_BUTTON_ESCAPEKEY_DEFAULT : constant unsigned := 2;

   type SDL_MessageBoxButtonData is record
      flags    : aliased Unsigned_32;
      buttonid : aliased int;
      text     : aliased chars_ptr;
   end record
     with Convention => C_Pass_By_Copy;

   type SDL_MessageBoxColor is record
      r : aliased Unsigned_8;
      g : aliased Unsigned_8;
      b : aliased Unsigned_8;
   end record
     with Convention => C_Pass_By_Copy;

   type SDL_MessageBoxColorType is
     (SDL_MESSAGEBOX_COLOR_BACKGROUND,
      SDL_MESSAGEBOX_COLOR_TEXT,
      SDL_MESSAGEBOX_COLOR_BUTTON_BORDER,
      SDL_MESSAGEBOX_COLOR_BUTTON_BACKGROUND,
      SDL_MESSAGEBOX_COLOR_BUTTON_SELECTED,
      SDL_MESSAGEBOX_COLOR_MAX)
     with Convention => C;

   type SDL_MessageBoxColorScheme_colors_array is
     array (0 .. 4) of aliased SDL_MessageBoxColor;

   type SDL_MessageBoxColorScheme is record
      colors : aliased SDL_MessageBoxColorScheme_colors_array;
   end record
     with Convention => C_Pass_By_Copy;

   type SDL_MessageBoxData is record
      flags       : aliased Unsigned_32;
      window      : access SDL_Window;
      title       : aliased chars_ptr;
      message     : aliased chars_ptr;
      numbuttons  : aliased int;
      buttons     : access constant SDL_MessageBoxButtonData;
      colorScheme : access constant SDL_MessageBoxColorScheme;
   end record
     with Convention => C_Pass_By_Copy;

   function SDL_ShowMessageBox
     (messageboxdata : access constant SDL_MessageBoxData;
      buttonid       : access int)
     return int
     with Import, Convention => C, External_Name => "SDL_ShowMessageBox";

   function SDL_ShowSimpleMessageBox
     (flags   : Unsigned_32;
      title   : char_array;
      message : char_array;
      window  : access SDL_Window)
     return int
     with Import, Convention => C, External_Name => "SDL_ShowSimpleMessageBox";

end SDL.MessageBox;
