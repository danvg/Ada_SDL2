package SDL.Log is

   SDL_MAX_LOG_MESSAGE : constant := 4096;

   type SDL_LogCategory is
     (SDL_LOG_CATEGORY_APPLICATION,
      SDL_LOG_CATEGORY_ERROR,
      SDL_LOG_CATEGORY_ASSERT,
      SDL_LOG_CATEGORY_SYSTEM,
      SDL_LOG_CATEGORY_AUDIO,
      SDL_LOG_CATEGORY_VIDEO,
      SDL_LOG_CATEGORY_RENDER,
      SDL_LOG_CATEGORY_INPUT,
      SDL_LOG_CATEGORY_TEST,
      SDL_LOG_CATEGORY_RESERVED1,
      SDL_LOG_CATEGORY_RESERVED2,
      SDL_LOG_CATEGORY_RESERVED3,
      SDL_LOG_CATEGORY_RESERVED4,
      SDL_LOG_CATEGORY_RESERVED5,
      SDL_LOG_CATEGORY_RESERVED6,
      SDL_LOG_CATEGORY_RESERVED7,
      SDL_LOG_CATEGORY_RESERVED8,
      SDL_LOG_CATEGORY_RESERVED9,
      SDL_LOG_CATEGORY_RESERVED10,
      SDL_LOG_CATEGORY_CUSTOM)
     with Convention => C;

   type SDL_LogPriority is
     (SDL_LOG_PRIORITY_VERBOSE,
      SDL_LOG_PRIORITY_DEBUG,
      SDL_LOG_PRIORITY_INFO,
      SDL_LOG_PRIORITY_WARN,
      SDL_LOG_PRIORITY_ERROR,
      SDL_LOG_PRIORITY_CRITICAL)
     with Convention => C;

   for SDL_LogPriority use
     (SDL_LOG_PRIORITY_VERBOSE  => 1,
      SDL_LOG_PRIORITY_DEBUG    => 2,
      SDL_LOG_PRIORITY_INFO     => 3,
      SDL_LOG_PRIORITY_WARN     => 4,
      SDL_LOG_PRIORITY_ERROR    => 5,
      SDL_LOG_PRIORITY_CRITICAL => 6);

   procedure SDL_LogSetAllPriority (priority : SDL_LogPriority)
     with Import, Convention => C, External_Name => "SDL_LogSetAllPriority";

   procedure SDL_LogSetPriority
     (category : SDL_LogCategory; priority : SDL_LogPriority)
     with Import, Convention => C, External_Name => "SDL_LogSetPriority";

   function SDL_LogGetPriority
     (category : SDL_LogCategory) return SDL_LogPriority
     with Import, Convention => C, External_Name => "SDL_LogGetPriority";

   procedure SDL_LogResetPriorities
     with Import, Convention => C, External_Name => "SDL_LogResetPriorities";

   procedure SDL_Log (fmt : char_array)
     with Import, Convention => C, External_Name => "SDL_Log";

   procedure SDL_LogVerbose (category : SDL_LogCategory; fmt : char_array)
     with Import, Convention => C, External_Name => "SDL_LogVerbose";

   procedure SDL_LogDebug (category : SDL_LogCategory; fmt : char_array)
     with Import, Convention => C, External_Name => "SDL_LogDebug";

   procedure SDL_LogInfo (category : SDL_LogCategory; fmt : char_array)
     with Import, Convention => C, External_Name => "SDL_LogInfo";

   procedure SDL_LogWarn (category : SDL_LogCategory; fmt : char_array)
     with Import, Convention => C, External_Name => "SDL_LogWarn";

   procedure SDL_LogError (category : SDL_LogCategory; fmt : char_array)
     with Import, Convention => C, External_Name => "SDL_LogError";

   procedure SDL_LogCritical (category : SDL_LogCategory; fmt : char_array)
     with Import, Convention => C, External_Name => "SDL_LogCritical";

   procedure SDL_LogMessage
     (category : SDL_LogCategory;
      priority : SDL_LogPriority;
      fmt : char_array)
     with Import, Convention => C, External_Name => "SDL_LogMessage";

   procedure SDL_LogMessageV
     (category : SDL_LogCategory;
      priority : SDL_LogPriority;
      fmt : char_array;
      ap : access System.Address)
     with Import, Convention => C, External_Name => "SDL_LogMessageV";

   type SDL_LogOutputFunction is access procedure
        (userdata : System.Address;
         category : SDL_LogCategory;
         priority : SDL_LogPriority;
         message  : chars_ptr)
     with Convention => C;

   procedure SDL_LogGetOutputFunction
     (callback : in out SDL_LogOutputFunction; userdata : System.Address)
     with Import, Convention => C, External_Name => "SDL_LogGetOutputFunction";

   procedure SDL_LogSetOutputFunction
     (callback : SDL_LogOutputFunction; userdata : System.Address)
     with Import, Convention => C, External_Name => "SDL_LogSetOutputFunction";

end SDL.Log;
