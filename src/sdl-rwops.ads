package SDL.Rwops is

   SDL_RWOPS_UNKNOWN   : constant := 0;
   SDL_RWOPS_WINFILE   : constant := 1;
   SDL_RWOPS_STDFILE   : constant := 2;
   SDL_RWOPS_JNIFILE   : constant := 3;
   SDL_RWOPS_MEMORY    : constant := 4;
   SDL_RWOPS_MEMORY_RO : constant := 5;

   RW_SEEK_SET : constant := 0;
   RW_SEEK_CUR : constant := 1;
   RW_SEEK_END : constant := 2;

   type SDL_RWops is null record;

   function SDL_RWFromFile (file, mode : char_array) return access SDL_RWops
     with Import, Convention => C, External_Name => "SDL_RWFromFile";

   function SDL_RWFromMem (mem : System.Address; size : int) return access SDL_RWops
     with Import, Convention => C, External_Name => "SDL_RWFromMem";

   function SDL_RWFromConstMem (mem : System.Address; size : int) return access SDL_RWops
     with Import, Convention => C, External_Name => "SDL_RWFromConstMem";

   function SDL_AllocRW return access SDL_RWops
     with Import, Convention => C, External_Name => "SDL_AllocRW";

   procedure SDL_FreeRW (area : access SDL_RWops)
     with Import, Convention => C, External_Name => "SDL_FreeRW";

   function SDL_RWsize (context : access SDL_RWops) return Integer_64
     with Import, Convention => C, External_Name => "SDL_RWsize";

   function SDL_RWseek
     (context : access SDL_RWops;
      offset : Integer_64;
      whence : int) return Integer_64
     with Import, Convention => C, External_Name => "SDL_RWseek";

   function SDL_RWtell (context : access SDL_RWops) return Integer_64
     with Import, Convention => C, External_Name => "SDL_RWtell";

   function SDL_RWread
     (context : access SDL_RWops;
      ptr : System.Address;
      size : size_t;
      maxnum : size_t) return size_t
     with Import, Convention => C, External_Name => "SDL_RWread";

   function SDL_RWwrite
     (context : access SDL_RWops;
      ptr : System.Address;
      size : size_t;
      num : size_t) return size_t
     with Import, Convention => C, External_Name => "SDL_RWwrite";

   function SDL_RWclose (context : access SDL_RWops) return int
     with Import, Convention => C, External_Name => "SDL_RWclose";

   function SDL_LoadFile_RW
     (src : access SDL_RWops;
      datasize : access size_t;
      freesrc : int) return System.Address
     with Import, Convention => C, External_Name => "SDL_LoadFile_RW";

   function SDL_LoadFile
     (file : char_array; datasize : access size_t) return System.Address
     with Import, Convention => C, External_Name => "SDL_LoadFile";

   function SDL_ReadU8 (src : access SDL_RWops) return Unsigned_8
     with Import, Convention => C, External_Name => "SDL_ReadU8";

   function SDL_ReadLE16 (src : access SDL_RWops) return Unsigned_16
     with Import, Convention => C, External_Name => "SDL_ReadLE16";

   function SDL_ReadBE16 (src : access SDL_RWops) return Unsigned_16
     with Import, Convention => C, External_Name => "SDL_ReadBE16";

   function SDL_ReadLE32 (src : access SDL_RWops) return Unsigned_32
     with Import, Convention => C, External_Name => "SDL_ReadLE32";

   function SDL_ReadBE32 (src : access SDL_RWops) return Unsigned_32
     with Import, Convention => C, External_Name => "SDL_ReadBE32";

   function SDL_ReadLE64 (src : access SDL_RWops) return Unsigned_64
     with Import, Convention => C, External_Name => "SDL_ReadLE64";

   function SDL_ReadBE64 (src : access SDL_RWops) return Unsigned_64
     with Import, Convention => C, External_Name => "SDL_ReadBE64";

   function SDL_WriteU8 (dst : access SDL_RWops; value : Unsigned_8) return size_t
     with Import, Convention => C, External_Name => "SDL_WriteU8";

   function SDL_WriteLE16 (dst : access SDL_RWops; value : Unsigned_16) return size_t
     with Import, Convention => C, External_Name => "SDL_WriteLE16";

   function SDL_WriteBE16 (dst : access SDL_RWops; value : Unsigned_16) return size_t
     with Import, Convention => C, External_Name => "SDL_WriteBE16";

   function SDL_WriteLE32 (dst : access SDL_RWops; value : Unsigned_32) return size_t
     with Import, Convention => C, External_Name => "SDL_WriteLE32";

   function SDL_WriteBE32 (dst : access SDL_RWops; value : Unsigned_32) return size_t
     with Import, Convention => C, External_Name => "SDL_WriteBE32";

   function SDL_WriteLE64 (dst : access SDL_RWops; value : Unsigned_64) return size_t
     with Import, Convention => C, External_Name => "SDL_WriteLE64";

   function SDL_WriteBE64 (dst : access SDL_RWops; value : Unsigned_64) return size_t
     with Import, Convention => C, External_Name => "SDL_WriteBE64";

end SDL.Rwops;
