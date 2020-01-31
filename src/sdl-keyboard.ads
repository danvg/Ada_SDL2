with SDL.Scancode; use SDL.Scancode;
with SDL.Keycode;  use SDL.Keycode;
with SDL.Video;    use SDL.Video;
with SDL.Rect;     use SDL.Rect;

package SDL.Keyboard is

   type SDL_Keysym is record
      scancode : aliased SDL_Scancode;
      sym      : aliased SDL_Keycode;
      c_mod    : aliased Unsigned_16;
      unused   : aliased Unsigned_32;
   end record
     with Convention => C_Pass_By_Copy;

   function SDL_GetKeyboardFocus return access SDL_Window
     with Import, Convention => C, External_Name => "SDL_GetKeyboardFocus";

   function SDL_GetKeyboardState
     (numkeys : access int) return access Unsigned_8
     with Import, Convention => C, External_Name => "SDL_GetKeyboardState";

   function SDL_GetKeyboardState_Address
     (numkeys : access int) return System.Address
     with Import, Convention => C, External_Name => "SDL_GetKeyboardState";

   function SDL_GetModState return SDL_Keymod
     with Import, Convention => C, External_Name => "SDL_GetModState";

   procedure SDL_SetModState (modstate : SDL_Keymod)
     with Import, Convention => C, External_Name => "SDL_SetModState";

   function SDL_GetKeyFromScancode
     (scancode : SDL_Scancode) return SDL_Keycode
     with Import, Convention => C, External_Name => "SDL_GetKeyFromScancode";

   function SDL_GetScancodeFromKey (key : SDL_Keycode) return SDL_Scancode
     with Import, Convention => C, External_Name => "SDL_GetScancodeFromKey";

   function SDL_GetScancodeName (scancode : SDL_Scancode) return chars_ptr
     with Import, Convention => C, External_Name => "SDL_GetScancodeName";

   function SDL_GetScancodeFromName
     (name : char_array) return SDL_Scancode
     with Import, Convention => C, External_Name => "SDL_GetScancodeFromName";

   function SDL_GetKeyName (key : SDL_Keycode) return chars_ptr
     with Import, Convention => C, External_Name => "SDL_GetKeyName";

   function SDL_GetKeyFromName (name : char_array) return SDL_Keycode
     with Import, Convention => C, External_Name => "SDL_GetKeyFromName";

   procedure SDL_StartTextInput
     with Import, Convention => C, External_Name => "SDL_StartTextInput";

   function SDL_IsTextInputActive return SDL_bool
     with Import, Convention => C, External_Name => "SDL_IsTextInputActive";

   procedure SDL_StopTextInput
     with Import, Convention => C, External_Name => "SDL_StopTextInput";

   procedure SDL_SetTextInputRect (rect : access SDL_Rect)
     with Import, Convention => C, External_Name => "SDL_SetTextInputRect";

   function SDL_HasScreenKeyboardSupport return SDL_bool
     with Import, Convention => C, External_Name => "SDL_HasScreenKeyboardSupport";

   function SDL_IsScreenKeyboardShown
     (window : access SDL_Window) return SDL_bool
     with Import, Convention => C, External_Name => "SDL_IsScreenKeyboardShown";

end SDL.Keyboard;
