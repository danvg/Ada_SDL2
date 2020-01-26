package SDL.Error is

   function SDL_SetError (fmt : char_array) return int
     with Import, Convention => C, External_Name => "SDL_SetError";

   function SDL_GetError return chars_ptr
     with Import, Convention => C, External_Name => "SDL_GetError";

   procedure SDL_ClearError
     with Import, Convention => C, External_Name => "SDL_ClearError";

end SDL.Error;
