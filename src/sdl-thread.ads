package SDL.Thread is

   type SDL_Thread is null record;   -- incomplete struct
   subtype SDL_threadID is unsigned_long;
   subtype SDL_TLSID is unsigned;

   type SDL_ThreadPriority is
     (SDL_THREAD_PRIORITY_LOW,
      SDL_THREAD_PRIORITY_NORMAL,
      SDL_THREAD_PRIORITY_HIGH,
      SDL_THREAD_PRIORITY_TIME_CRITICAL)
     with Convention => C;

   type SDL_ThreadFunction is access function
     (data : System.Address) return int
     with Convention => C;

   function SDL_CreateThread
     (fn   : SDL_ThreadFunction;
      name : char_array;
      data : System.Address)
     return access SDL_Thread
     with Import, Convention => C, External_Name => "SDL_CreateThread";

   function SDL_CreateThreadWithStackSize
     (fn        : SDL_ThreadFunction;
      name      : char_array;
      stacksize : size_t;
      data      : System.Address)
     return access SDL_Thread
     with Import, Convention => C, External_Name => "SDL_CreateThreadWithStackSize";

   function SDL_GetThreadName
     (thread : access SDL_Thread) return chars_ptr
     with Import, Convention => C, External_Name => "SDL_GetThreadName";

   function C_SDL_ThreadID return SDL_threadID
     with Import, Convention => C, External_Name => "SDL_ThreadID";

   function SDL_GetThreadID
     (thread : access SDL_Thread) return SDL_threadID
     with Import, Convention => C, External_Name => "SDL_GetThreadID";

   function SDL_SetThreadPriority
     (priority : SDL_ThreadPriority) return int
     with Import, Convention => C, External_Name => "SDL_SetThreadPriority";

   procedure SDL_WaitThread
     (thread : access SDL_Thread; status : access int)
     with Import, Convention => C, External_Name => "SDL_WaitThread";

   procedure SDL_DetachThread (thread : access SDL_Thread)
     with Import, Convention => C, External_Name => "SDL_DetachThread";

   function SDL_TLSCreate return SDL_TLSID
     with Import, Convention => C, External_Name => "SDL_TLSCreate";

   function SDL_TLSGet (id : SDL_TLSID) return System.Address
     with Import, Convention => C, External_Name => "SDL_TLSGet";

   function SDL_TLSSet
     (id         : SDL_TLSID;
      value      : System.Address;
      destructor : access procedure (data : System.Address))
     return int
     with Import, Convention => C, External_Name => "SDL_TLSSet";

end SDL.Thread;
