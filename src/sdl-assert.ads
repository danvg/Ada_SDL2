package SDL.Assert is

   SDL_ASSERT_LEVEL : constant := 2;

   --  arg-macro: procedure SDL_TriggerBreakpoint ()
   --    __asm__ __volatile__ ( "int $3" & ASCII.LF & "" & ASCII.HT & "" )
   --  unsupported macro: SDL_FUNCTION __FUNCTION__
   --  unsupported macro: SDL_FILE __FILE__
   --  unsupported macro: SDL_LINE __LINE__

   SDL_NULL_WHILE_LOOP_CONDITION : constant := (0);

   --  arg-macro: procedure SDL_disabled_assert (condition)
   --    do { (void) sizeof ((condition)); } while (SDL_NULL_WHILE_LOOP_CONDITION)
   --  unsupported macro: SDL_enabled_assert(condition) do { while ( !(condition) ) { static struct SDL_AssertData sdl_assert_data = { 0, 0, #condition, 0, 0, 0, 0 }; const SDL_AssertState sdl_assert_state = SDL_ReportAssertion(&sdl_assert_data, SDL_FUNCTION, SDL_FILE, SDL_LINE); if (sdl_assert_state == SDL_ASSERTION_RETRY) { continue; } else if (sdl_assert_state == SDL_ASSERTION_BREAK) { SDL_TriggerBreakpoint(); } break; } } while (SDL_NULL_WHILE_LOOP_CONDITION)
   --  arg-macro: procedure SDL_assert (condition)
   --    SDL_enabled_assert(condition)
   --  arg-macro: procedure SDL_assert_release (condition)
   --    SDL_enabled_assert(condition)
   --  arg-macro: procedure SDL_assert_paranoid (condition)
   --    SDL_disabled_assert(condition)
   --  arg-macro: procedure SDL_assert_always (condition)
   --    SDL_enabled_assert(condition)
   --  unsupported macro: SDL_assert_state SDL_AssertState
   --  unsupported macro: SDL_assert_data SDL_AssertData

   type SDL_AssertState is
     (SDL_ASSERTION_RETRY,
      SDL_ASSERTION_BREAK,
      SDL_ASSERTION_ABORT,
      SDL_ASSERTION_IGNORE,
      SDL_ASSERTION_ALWAYS_IGNORE)
     with Convention => C;

   type SDL_AssertData;
   type SDL_AssertData is record
      always_ignore : aliased int;
      trigger_count : aliased unsigned;
      condition     : aliased chars_ptr;
      filename      : aliased chars_ptr;
      linenum       : aliased int;
      c_function    : aliased chars_ptr;
      next          : access constant SDL_AssertData;
   end record
     with Convention => C_Pass_By_Copy;

   function SDL_ReportAssertion
     (arg1 : access SDL_AssertData;
      arg2 : chars_ptr;
      arg3 : chars_ptr;
      arg4 : int)
     return SDL_AssertState
     with Import, Convention => C, External_Name => "SDL_ReportAssertion";

   type SDL_AssertionHandler is access function
     (data     : access constant SDL_AssertData;
      userdata : System.Address)
     return SDL_AssertState
     with Convention => C;

   procedure SDL_SetAssertionHandler
     (handler : SDL_AssertionHandler; userdata : System.Address)
     with Import, Convention => C, External_Name => "SDL_SetAssertionHandler";

   function SDL_GetDefaultAssertionHandler return SDL_AssertionHandler
     with Import, Convention => C, External_Name => "SDL_GetDefaultAssertionHandler";

   function SDL_GetAssertionHandler
     (puserdata : System.Address) return SDL_AssertionHandler
     with Import, Convention => C, External_Name => "SDL_GetAssertionHandler";

   function SDL_GetAssertionReport return access constant SDL_AssertData
     with Import, Convention => C, External_Name => "SDL_GetAssertionReport";

   procedure SDL_ResetAssertionReport
     with Import, Convention => C, External_Name => "SDL_ResetAssertionReport";

end SDL.Assert;
