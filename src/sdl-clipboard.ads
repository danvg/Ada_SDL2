package SDL.Clipboard is

   function SDL_SetClipboardText (text : char_array) return int
     with Import, Convention => C, External_Name => "SDL_SetClipboardText";

   function SDL_GetClipboardText return chars_ptr
     with Import, Convention => C, External_Name => "SDL_GetClipboardText";

   function SDL_HasClipboardText return SDL_bool
     with Import, Convention => C, External_Name => "SDL_HasClipboardText";

end SDL.Clipboard;
