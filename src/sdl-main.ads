package SDL.Main is

   type SDL_main_func is access function
     (argc : int;
      argv : System.Address)
     return int with
      Convention => C;

   function SDL_main
     (argc : int;
      argv : System.Address)
     return int
     with Import, Convention => C, External_Name => "SDL_main";

   procedure SDL_SetMainReady
     with Import, Convention => C, External_Name => "SDL_SetMainReady";

end SDL.Main;
