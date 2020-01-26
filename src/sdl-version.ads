package SDL.Version is

   SDL_MAJOR_VERSION : constant := 2;
   SDL_MINOR_VERSION : constant := 0;
   SDL_PATCHLEVEL    : constant := 10;

   function SDL_VERSIONNUM (X, Y, Z : int) return int is
     (X*1000 + Y*100 + Z);

   function SDL_COMPILEDVERSION return int is
     (SDL_VERSIONNUM (SDL_MAJOR_VERSION, SDL_MINOR_VERSION, SDL_PATCHLEVEL));

   function SDL_VERSION_ATLEAST (X, Y, Z : int) return SDL_bool is
     (if SDL_COMPILEDVERSION >= SDL_VERSIONNUM (X, Y, Z)
      then SDL_TRUE else SDL_FALSE);

   type SDL_version is record
      major : aliased Unsigned_8;
      minor : aliased Unsigned_8;
      patch : aliased Unsigned_8;
   end record
     with Convention => C_Pass_By_Copy;

   procedure SDL_GetVersion (ver : in out SDL_version)
     with Import, Convention => C, External_Name => "SDL_GetVersion";

   function SDL_GetRevision return chars_ptr
     with Import, Convention => C, External_Name => "SDL_GetRevision";

   function SDL_GetRevisionNumber return int
     with Import, Convention => C, External_Name => "SDL_GetRevisionNumber";

end SDL.Version;
