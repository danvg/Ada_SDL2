pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with SDL2_SDL_stdinc_h;

package SDL2_SDL_system_h is

   function SDL_LinuxSetThreadPriority (threadID : SDL2_SDL_stdinc_h.Sint64; priority : int) return int  -- /usr/include/SDL2/SDL_system.h:87
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_LinuxSetThreadPriority";

   function SDL_IsTablet return SDL2_SDL_stdinc_h.SDL_bool  -- /usr/include/SDL2/SDL_system.h:269
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_IsTablet";

end SDL2_SDL_system_h;
