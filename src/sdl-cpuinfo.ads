package SDL.CPUinfo is

   SDL_CACHELINE_SIZE : constant := 128;

   function SDL_GetCPUCount return int
     with Import, Convention => C, External_Name => "SDL_GetCPUCount";

   function SDL_GetCPUCacheLineSize return int
     with Import, Convention => C, External_Name => "SDL_GetCPUCacheLineSize";

   function SDL_HasRDTSC return SDL_bool
     with Import, Convention => C, External_Name => "SDL_HasRDTSC";

   function SDL_HasAltiVec return SDL_bool
     with Import, Convention => C, External_Name => "SDL_HasAltiVec";

   function SDL_HasMMX return SDL_bool
     with Import, Convention => C, External_Name => "SDL_HasMMX";

   function SDL_Has3DNow return SDL_bool
     with Import, Convention => C, External_Name => "SDL_Has3DNow";

   function SDL_HasSSE return SDL_bool
     with Import, Convention => C, External_Name => "SDL_HasSSE";

   function SDL_HasSSE2 return SDL_bool
     with Import, Convention => C, External_Name => "SDL_HasSSE2";

   function SDL_HasSSE3 return SDL_bool
     with Import, Convention => C, External_Name => "SDL_HasSSE3";

   function SDL_HasSSE41 return SDL_bool
     with Import, Convention => C, External_Name => "SDL_HasSSE41";

   function SDL_HasSSE42 return SDL_bool
     with Import, Convention => C, External_Name => "SDL_HasSSE42";

   function SDL_HasAVX return SDL_bool
     with Import, Convention => C, External_Name => "SDL_HasAVX";

   function SDL_HasAVX2 return SDL_bool
     with Import, Convention => C, External_Name => "SDL_HasAVX2";

   function SDL_HasAVX512F return SDL_bool
     with Import, Convention => C, External_Name => "SDL_HasAVX512F";

   function SDL_HasNEON return SDL_bool
     with Import, Convention => C, External_Name => "SDL_HasNEON";

   function SDL_GetSystemRAM return int
     with Import, Convention => C, External_Name => "SDL_GetSystemRAM";

   function SDL_SIMDGetAlignment return size_t
     with Import, Convention => C, External_Name => "SDL_SIMDGetAlignment";

   function SDL_SIMDAlloc (len : size_t) return System.Address
     with Import, Convention => C, External_Name => "SDL_SIMDAlloc";

   procedure SDL_SIMDFree (ptr : System.Address)
     with Import, Convention => C, External_Name => "SDL_SIMDFree";

end SDL.CPUinfo;
