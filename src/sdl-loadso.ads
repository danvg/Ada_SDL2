package SDL.LoadSO is

   function SDL_LoadObject (sofile : char_array) return System.Address
     with Import, Convention => C, External_Name => "SDL_LoadObject";

   function SDL_LoadFunction (handle : System.Address; name : char_array) return System.Address
     with Import, Convention => C, External_Name => "SDL_LoadFunction";

   procedure SDL_UnloadObject (handle : System.Address)
     with Import, Convention => C, External_Name => "SDL_UnloadObject";

end SDL.LoadSO;
