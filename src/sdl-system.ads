package SDL.System is

   function SDL_IsTablet return SDL_bool
     with Import, Convention => C, External_Name => "SDL_IsTablet";

end SDL.System;
