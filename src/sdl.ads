with Interfaces;           use Interfaces;
with Interfaces.C;         use Interfaces.C;
with Interfaces.C.Strings; use Interfaces.C.Strings;
with System;

package SDL is

   pragma Warnings (Off, System);

   type SDL_bool is (SDL_FALSE, SDL_TRUE)
     with Convention => C;

   function To_Ada (X : SDL_bool) return Boolean is
     (X = SDL_TRUE);

   function To_C (X : Boolean) return SDL_bool is
     (if X then SDL_TRUE else SDL_FALSE);

   type Unsigned_8_Array is array (size_t range <>) of aliased Unsigned_8
     with Convention => C;

   type Integer_8_Array is array (size_t range <>) of aliased Integer_8
     with Convention => C;

   type Unsigned_16_Array is array (size_t range <>) of aliased Unsigned_16
     with Convention => C;

   type Integer_16_Array is array (size_t range <>) of aliased Integer_16
     with Convention => C;

   type Float_Array is array (size_t range <>) of aliased Float
     with Convention => C;

   function Safe_Value (X : Chars_Ptr) return String is
     (if X = Null_Ptr then "" else Value (X));

   -----------------------------------------------------------------------

   SDL_INIT_TIMER          : constant Unsigned_32 := 16#00000001#;
   SDL_INIT_AUDIO          : constant Unsigned_32 := 16#00000010#;
   SDL_INIT_VIDEO          : constant Unsigned_32 := 16#00000020#;
   SDL_INIT_JOYSTICK       : constant Unsigned_32 := 16#00000200#;
   SDL_INIT_HAPTIC         : constant Unsigned_32 := 16#00001000#;
   SDL_INIT_GAMECONTROLLER : constant Unsigned_32 := 16#00002000#;
   SDL_INIT_EVENTS         : constant Unsigned_32 := 16#00004000#;
   SDL_INIT_SENSOR         : constant Unsigned_32 := 16#00008000#;
   SDL_INIT_NOPARACHUTE    : constant Unsigned_32 := 16#00100000#;
   SDL_INIT_EVERYTHING     : constant Unsigned_32 := SDL_INIT_TIMER or
                                                     SDL_INIT_AUDIO or
                                                     SDL_INIT_VIDEO or
                                                     SDL_INIT_EVENTS or
                                                     SDL_INIT_JOYSTICK or
                                                     SDL_INIT_HAPTIC or
                                                     SDL_INIT_GAMECONTROLLER or
                                                     SDL_INIT_SENSOR;

   function SDL_Init (flags : Unsigned_32) return int
     with Import, Convention => C, External_Name => "SDL_Init";

   function SDL_InitSubSystem (flags : Unsigned_32) return int
     with Import, Convention => C, External_Name => "SDL_InitSubSystem";

   procedure SDL_QuitSubSystem (flags : Unsigned_32)
     with Import, Convention => C, External_Name => "SDL_QuitSubSystem";

   function SDL_WasInit (flags : Unsigned_32) return Unsigned_32
     with Import, Convention => C, External_Name => "SDL_WasInit";

   procedure SDL_Quit
     with Import, Convention => C, External_Name => "SDL_Quit";

end SDL;
