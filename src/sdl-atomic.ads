package SDL.Atomic is

   --  arg-macro: procedure SDL_CompilerBarrier ()
   --    __asm__ __volatile__ ("" : : : & "memory")
   --  arg-macro: procedure SDL_MemoryBarrierRelease ()
   --    SDL_CompilerBarrier()
   --  arg-macro: procedure SDL_MemoryBarrierAcquire ()
   --    SDL_CompilerBarrier()

   subtype SDL_SpinLock is int;

   function SDL_AtomicTryLock (lock : access SDL_SpinLock) return SDL_bool
     with Import, Convention => C, External_Name => "SDL_AtomicTryLock";

   procedure SDL_AtomicLock (lock : access SDL_SpinLock)
     with Import, Convention => C, External_Name => "SDL_AtomicLock";

   procedure SDL_AtomicUnlock (lock : access SDL_SpinLock)
     with Import, Convention => C, External_Name => "SDL_AtomicUnlock";

   procedure SDL_MemoryBarrierReleaseFunction
     with Import, Convention => C, External_Name => "SDL_MemoryBarrierReleaseFunction";

   procedure SDL_MemoryBarrierAcquireFunction
     with Import, Convention => C, External_Name => "SDL_MemoryBarrierAcquireFunction";

   type SDL_atomic_t is record
      value : aliased int;
   end record
     with Convention => C_Pass_By_Copy;

   function SDL_AtomicCAS
     (a      : access SDL_atomic_t;
      oldval : int;
      newval : int)
     return SDL_bool
     with Import, Convention => C, External_Name => "SDL_AtomicCAS";

   function SDL_AtomicSet
     (a : access SDL_atomic_t;
      v : int)
     return int
     with Import, Convention => C, External_Name => "SDL_AtomicSet";

   function SDL_AtomicGet (a : access SDL_atomic_t) return int
     with Import, Convention => C, External_Name => "SDL_AtomicGet";

   function SDL_AtomicAdd
     (a : access SDL_atomic_t;
      v : int)
     return int
     with Import, Convention => C, External_Name => "SDL_AtomicAdd";

   function SDL_AtomicIncRef (a : access SDL_atomic_t) return int is
     (SDL_AtomicAdd (a, 1));

   function SDL_AtomicDecRef (a : access SDL_atomic_t) return int is
     (SDL_AtomicAdd (a, -1));

   function SDL_AtomicCASPtr
     (a      : System.Address;
      oldval : System.Address;
      newval : System.Address)
     return SDL_bool
     with Import, Convention => C, External_Name => "SDL_AtomicCASPtr";

   function SDL_AtomicSetPtr
     (a : System.Address;
      v : System.Address)
     return System.Address
     with Import, Convention => C, External_Name => "SDL_AtomicSetPtr";

   function SDL_AtomicGetPtr (a : System.Address) return System.Address
     with Import, Convention => C, External_Name => "SDL_AtomicGetPtr";

end SDL.Atomic;
