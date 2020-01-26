package SDL.Mutex is

   SDL_MUTEX_TIMEDOUT : constant := 1;
   SDL_MUTEX_MAXWAIT  : constant := (not Unsigned_32 (0));

   --  arg-macro: procedure SDL_mutexP (m)
   --    SDL_LockMutex(m)
   --  arg-macro: procedure SDL_mutexV (m)
   --    SDL_UnlockMutex(m)

   type SDL_mutex is null record;   -- incomplete struct

   function SDL_CreateMutex return access SDL_mutex
     with Import, Convention => C, External_Name => "SDL_CreateMutex";

   function SDL_LockMutex (mutex : access SDL_mutex) return int
     with Import, Convention => C, External_Name => "SDL_LockMutex";

   function SDL_TryLockMutex (mutex : access SDL_mutex) return int
     with Import, Convention => C, External_Name => "SDL_TryLockMutex";

   function SDL_UnlockMutex (mutex : access SDL_mutex) return int
     with Import, Convention => C, External_Name => "SDL_UnlockMutex";

   procedure SDL_DestroyMutex (mutex : access SDL_mutex)
     with Import, Convention => C, External_Name => "SDL_DestroyMutex";

   type SDL_semaphore is null record;   -- incomplete struct
   subtype SDL_sem is SDL_semaphore;

   function SDL_CreateSemaphore
     (initial_value : Unsigned_32) return access SDL_sem
     with Import, Convention => C, External_Name => "SDL_CreateSemaphore";

   procedure SDL_DestroySemaphore (sem : access SDL_sem)
     with Import, Convention => C, External_Name => "SDL_DestroySemaphore";

   function SDL_SemWait (sem : access SDL_sem) return int
     with Import, Convention => C, External_Name => "SDL_SemWait";

   function SDL_SemTryWait (sem : access SDL_sem) return int
     with Import, Convention => C, External_Name => "SDL_SemTryWait";

   function SDL_SemWaitTimeout
     (sem : access SDL_sem; ms : Unsigned_32) return int
     with Import, Convention => C, External_Name => "SDL_SemWaitTimeout";

   function SDL_SemPost (sem : access SDL_sem) return int
     with Import, Convention => C, External_Name => "SDL_SemPost";

   function SDL_SemValue (sem : access SDL_sem) return Unsigned_32
     with Import, Convention => C, External_Name => "SDL_SemValue";

   type SDL_cond is null record;   -- incomplete struct

   function SDL_CreateCond return access SDL_cond
     with Import, Convention => C, External_Name => "SDL_CreateCond";

   procedure SDL_DestroyCond (cond : access SDL_cond)
     with Import, Convention => C, External_Name => "SDL_DestroyCond";

   function SDL_CondSignal (cond : access SDL_cond) return int
     with Import, Convention => C, External_Name => "SDL_CondSignal";

   function SDL_CondBroadcast (cond : access SDL_cond) return int
     with Import, Convention => C, External_Name => "SDL_CondBroadcast";

   function SDL_CondWait
     (cond : access SDL_cond; mutex : access SDL_mutex) return int
     with Import, Convention => C, External_Name => "SDL_CondWait";

   function SDL_CondWaitTimeout
     (cond  : access SDL_cond;
      mutex : access SDL_mutex;
      ms    : Unsigned_32)
     return int
     with Import, Convention => C, External_Name => "SDL_CondWaitTimeout";

end SDL.Mutex;
