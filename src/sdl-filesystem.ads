package SDL.FileSystem is

   function SDL_GetBasePath return chars_ptr
     with Import, Convention => C, External_Name => "SDL_GetBasePath";

   function SDL_GetPrefPath (org, app : char_array) return chars_ptr
     with Import, Convention => C, External_Name => "SDL_GetPrefPath";

end SDL.FileSystem;
