package SDL.Power is

   type SDL_PowerState is
     (SDL_POWERSTATE_UNKNOWN,
      SDL_POWERSTATE_ON_BATTERY,
      SDL_POWERSTATE_NO_BATTERY,
      SDL_POWERSTATE_CHARGING,
      SDL_POWERSTATE_CHARGED)
     with Convention => C;

   function SDL_GetPowerInfo (secs, pct : access int) return SDL_PowerState
     with Import, Convention => C, External_Name => "SDL_GetPowerInfo";

end SDL.Power;
