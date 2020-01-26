package SDL.Endian is

   SDL_LIL_ENDIAN : constant := 1234;
   SDL_BIG_ENDIAN : constant := 4321;

   --  unsupported macro: SDL_BYTEORDER __BYTE_ORDER
   --  arg-macro: function SDL_SwapLE16 (X)
   --    return X;
   --  arg-macro: function SDL_SwapLE32 (X)
   --    return X;
   --  arg-macro: function SDL_SwapLE64 (X)
   --    return X;
   --  arg-macro: function SDL_SwapFloatLE (X)
   --    return X;
   --  arg-macro: procedure SDL_SwapBE16 (X)
   --    SDL_Swap16(X)
   --  arg-macro: procedure SDL_SwapBE32 (X)
   --    SDL_Swap32(X)
   --  arg-macro: procedure SDL_SwapBE64 (X)
   --    SDL_Swap64(X)
   --  arg-macro: procedure SDL_SwapFloatBE (X)
   --    SDL_SwapFloat(X)

   function SDL_Swap16 (x : Unsigned_16) return Unsigned_16
     with Import, Convention => C, External_Name => "SDL_Swap16";

   function SDL_Swap32 (x : Unsigned_32) return Unsigned_32
     with Import, Convention => C, External_Name => "SDL_Swap32";

   function SDL_Swap64 (x : Unsigned_64) return Unsigned_64
     with Import, Convention => C, External_Name => "SDL_Swap64";

   function SDL_SwapFloat (x : Float) return Float
     with Import, Convention => C, External_Name => "SDL_SwapFloat";

end SDL.Endian;
