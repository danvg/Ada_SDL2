with SDL.Touch; use SDL.Touch;
with SDL.RWops; use SDL.RWops;

package SDL.Gesture is

   subtype SDL_GestureID is Integer_64;

   function SDL_RecordGesture (touchId : SDL_TouchID) return int
     with Import, Convention => C, External_Name => "SDL_RecordGesture";

   function SDL_SaveAllDollarTemplates (dst : access SDL_RWops) return int
     with Import, Convention => C, External_Name => "SDL_SaveAllDollarTemplates";

   function SDL_SaveDollarTemplate
     (gestureId : SDL_GestureID; dst : access SDL_RWops) return int
     with Import, Convention => C, External_Name => "SDL_SaveDollarTemplate";

   function SDL_LoadDollarTemplates
     (touchId : SDL_TouchID; src : access SDL_RWops) return int
     with Import, Convention => C, External_Name => "SDL_LoadDollarTemplates";

end SDL.Gesture;
