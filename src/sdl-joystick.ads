package SDL.Joystick is

   SDL_JOYSTICK_AXIS_MAX : constant := 32767;
   SDL_JOYSTICK_AXIS_MIN : constant := -32768;

   SDL_HAT_CENTERED : constant := 16#00#;
   SDL_HAT_UP       : constant := 16#01#;
   SDL_HAT_RIGHT    : constant := 16#02#;
   SDL_HAT_DOWN     : constant := 16#04#;
   SDL_HAT_LEFT     : constant := 16#08#;

   SDL_HAT_RIGHTUP   : constant unsigned := SDL_HAT_RIGHT or SDL_HAT_UP;
   SDL_HAT_RIGHTDOWN : constant unsigned := SDL_HAT_RIGHT or SDL_HAT_DOWN;
   SDL_HAT_LEFTUP    : constant unsigned := SDL_HAT_LEFT or SDL_HAT_UP;
   SDL_HAT_LEFTDOWN  : constant unsigned := SDL_HAT_LEFT or SDL_HAT_DOWN;

   type SDL_Joystick is null record; -- incomplete struct

   type SDL_JoystickGUID is record
      data : aliased Unsigned_8_Array (0 .. 15);
   end record
     with Convention => C_Pass_By_Copy;

   subtype SDL_JoystickID is Integer_32;

   type SDL_JoystickType is
     (SDL_JOYSTICK_TYPE_UNKNOWN,
      SDL_JOYSTICK_TYPE_GAMECONTROLLER,
      SDL_JOYSTICK_TYPE_WHEEL,
      SDL_JOYSTICK_TYPE_ARCADE_STICK,
      SDL_JOYSTICK_TYPE_FLIGHT_STICK,
      SDL_JOYSTICK_TYPE_DANCE_PAD,
      SDL_JOYSTICK_TYPE_GUITAR,
      SDL_JOYSTICK_TYPE_DRUM_KIT,
      SDL_JOYSTICK_TYPE_ARCADE_PAD,
      SDL_JOYSTICK_TYPE_THROTTLE)
     with
      Convention => C;

   type SDL_JoystickPowerLevel is
     (SDL_JOYSTICK_POWER_UNKNOWN,
      SDL_JOYSTICK_POWER_EMPTY,
      SDL_JOYSTICK_POWER_LOW,
      SDL_JOYSTICK_POWER_MEDIUM,
      SDL_JOYSTICK_POWER_FULL,
      SDL_JOYSTICK_POWER_WIRED,
      SDL_JOYSTICK_POWER_MAX)
     with
      Convention => C;

   for SDL_JoystickPowerLevel use
     (SDL_JOYSTICK_POWER_UNKNOWN => -1,
      SDL_JOYSTICK_POWER_EMPTY   => 0,
      SDL_JOYSTICK_POWER_LOW     => 1,
      SDL_JOYSTICK_POWER_MEDIUM  => 2,
      SDL_JOYSTICK_POWER_FULL    => 3,
      SDL_JOYSTICK_POWER_WIRED   => 4,
      SDL_JOYSTICK_POWER_MAX     => 5);

   procedure SDL_LockJoysticks
     with Import, Convention => C, External_Name => "SDL_LockJoysticks";

   procedure SDL_UnlockJoysticks
     with Import, Convention => C, External_Name => "SDL_UnlockJoysticks";

   function SDL_NumJoysticks return int
     with Import, Convention => C, External_Name => "SDL_NumJoysticks";

   function SDL_JoystickNameForIndex (device_index : int) return chars_ptr
     with Import, Convention => C, External_Name => "SDL_JoystickNameForIndex";

   function SDL_JoystickGetDevicePlayerIndex
     (device_index : int) return int
     with Import, Convention => C, External_Name => "SDL_JoystickGetDevicePlayerIndex";

   function SDL_JoystickGetDeviceGUID
     (device_index : int) return SDL_JoystickGUID
     with Import, Convention => C, External_Name => "SDL_JoystickGetDeviceGUID";

   function SDL_JoystickGetDeviceVendor
     (device_index : int) return Unsigned_16
     with Import, Convention => C, External_Name => "SDL_JoystickGetDeviceVendor";

   function SDL_JoystickGetDeviceProduct
     (device_index : int) return Unsigned_16
     with Import, Convention => C, External_Name => "SDL_JoystickGetDeviceProduct";

   function SDL_JoystickGetDeviceProductVersion
     (device_index : int) return Unsigned_16
     with Import, Convention => C, External_Name => "SDL_JoystickGetDeviceProductVersion";

   function SDL_JoystickGetDeviceType
     (device_index : int) return SDL_JoystickType
     with Import, Convention => C, External_Name => "SDL_JoystickGetDeviceType";

   function SDL_JoystickGetDeviceInstanceID
     (device_index : int) return SDL_JoystickID
     with Import, Convention => C, External_Name => "SDL_JoystickGetDeviceInstanceID";

   function SDL_JoystickOpen
     (device_index : int) return access SDL_Joystick
     with Import, Convention => C, External_Name => "SDL_JoystickOpen";

   function SDL_JoystickFromInstanceID
     (joyid : SDL_JoystickID) return access SDL_Joystick
     with Import, Convention => C, External_Name => "SDL_JoystickFromInstanceID";

   function SDL_JoystickName
     (joystick : access SDL_Joystick) return chars_ptr
     with Import, Convention => C, External_Name => "SDL_JoystickName";

   function SDL_JoystickGetPlayerIndex
     (joystick : access SDL_Joystick) return int
     with Import, Convention => C, External_Name => "SDL_JoystickGetPlayerIndex";

   function SDL_JoystickGetGUID
     (joystick : access SDL_Joystick) return SDL_JoystickGUID
     with Import, Convention => C, External_Name => "SDL_JoystickGetGUID";

   function SDL_JoystickGetVendor
     (joystick : access SDL_Joystick) return Unsigned_16
     with Import, Convention => C, External_Name => "SDL_JoystickGetVendor";

   function SDL_JoystickGetProduct
     (joystick : access SDL_Joystick) return Unsigned_16
     with Import, Convention => C, External_Name => "SDL_JoystickGetProduct";

   function SDL_JoystickGetProductVersion
     (joystick : access SDL_Joystick) return Unsigned_16
     with Import, Convention => C, External_Name => "SDL_JoystickGetProductVersion";

   function SDL_JoystickGetType
     (joystick : access SDL_Joystick) return SDL_JoystickType
     with Import, Convention => C, External_Name => "SDL_JoystickGetType";

   procedure SDL_JoystickGetGUIDString
     (guid : SDL_JoystickGUID; pszGUID : char_array; cbGUID : int)
     with Import, Convention => C, External_Name => "SDL_JoystickGetGUIDString";

   function SDL_JoystickGetGUIDFromString
     (pchGUID : char_array) return SDL_JoystickGUID
     with Import, Convention => C, External_Name => "SDL_JoystickGetGUIDFromString";

   function SDL_JoystickGetAttached
     (joystick : access SDL_Joystick) return SDL_bool
     with Import, Convention => C, External_Name => "SDL_JoystickGetAttached";

   function SDL_JoystickInstanceID
     (joystick : access SDL_Joystick) return SDL_JoystickID
     with Import, Convention => C, External_Name => "SDL_JoystickInstanceID";

   function SDL_JoystickNumAxes
     (joystick : access SDL_Joystick) return int
     with Import, Convention => C, External_Name => "SDL_JoystickNumAxes";

   function SDL_JoystickNumBalls
     (joystick : access SDL_Joystick) return int
     with Import, Convention => C, External_Name => "SDL_JoystickNumBalls";

   function SDL_JoystickNumHats
     (joystick : access SDL_Joystick) return int
     with Import, Convention => C, External_Name => "SDL_JoystickNumHats";

   function SDL_JoystickNumButtons
     (joystick : access SDL_Joystick) return int
     with Import, Convention => C, External_Name => "SDL_JoystickNumButtons";

   procedure SDL_JoystickUpdate
     with Import, Convention => C, External_Name => "SDL_JoystickUpdate";

   function SDL_JoystickEventState (state : int) return int
     with Import, Convention => C, External_Name => "SDL_JoystickEventState";

   function SDL_JoystickGetAxis
     (joystick : access SDL_Joystick; axis : int) return Integer_16
     with Import, Convention => C, External_Name => "SDL_JoystickGetAxis";

   function SDL_JoystickGetAxisInitialState
     (joystick : access SDL_Joystick;
      axis     : int;
      state    : access Integer_16)
     return SDL_bool
     with Import, Convention => C, External_Name => "SDL_JoystickGetAxisInitialState";

   function SDL_JoystickGetHat
     (joystick : access SDL_Joystick; hat : int) return Unsigned_8
     with Import, Convention => C, External_Name => "SDL_JoystickGetHat";

   function SDL_JoystickGetBall
     (joystick : access SDL_Joystick;
      ball     : int;
      dx       : access int;
      dy       : access int)
     return int
     with Import, Convention => C, External_Name => "SDL_JoystickGetBall";

   function SDL_JoystickGetButton
     (joystick : access SDL_Joystick; button : int) return Unsigned_8
     with Import, Convention => C, External_Name => "SDL_JoystickGetButton";

   function SDL_JoystickRumble
     (joystick              : access SDL_Joystick;
      low_frequency_rumble  : Unsigned_16;
      high_frequency_rumble : Unsigned_16;
      duration_ms           : Unsigned_32)
     return int
     with Import, Convention => C, External_Name => "SDL_JoystickRumble";

   procedure SDL_JoystickClose (joystick : access SDL_Joystick)
     with Import, Convention => C, External_Name => "SDL_JoystickClose";

   function SDL_JoystickCurrentPowerLevel
     (joystick : access SDL_Joystick) return SDL_JoystickPowerLevel
     with Import, Convention => C, External_Name => "SDL_JoystickCurrentPowerLevel";

end SDL.Joystick;
