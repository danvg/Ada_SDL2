package SDL.Platform is

   function SDL_GetPlatform return chars_ptr
     with Import, Convention => C, External_Name => "SDL_GetPlatform";

end SDL.Platform;
