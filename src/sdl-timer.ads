package SDL.Timer is

   function SDL_TICKS_PASSED (A, B : Integer_32) return SDL_bool is
     (if (B - A) <= 0 then SDL_TRUE else SDL_FALSE);

   function SDL_GetTicks return Unsigned_32
     with Import, Convention => C, External_Name => "SDL_GetTicks";

   function SDL_GetPerformanceCounter return Unsigned_64
     with Import, Convention => C, External_Name => "SDL_GetPerformanceCounter";

   function SDL_GetPerformanceFrequency return Unsigned_64
     with Import, Convention => C, External_Name => "SDL_GetPerformanceFrequency";

   procedure SDL_Delay (ms : Unsigned_32)
     with Import, Convention => C, External_Name => "SDL_Delay";

   type SDL_TimerCallback is access function
     (interval : Unsigned_32; param : System.Address) return Unsigned_32
     with Convention => C;

   subtype SDL_TimerID is int;

   function SDL_AddTimer
     (interval : Unsigned_32; callback : SDL_TimerCallback;
      param : System.Address) return SDL_TimerID
     with Import, Convention => C, External_Name => "SDL_AddTimer";

   function SDL_RemoveTimer (id : SDL_TimerID) return SDL_bool
     with Import, Convention => C, External_Name => "SDL_RemoveTimer";

end SDL.Timer;
