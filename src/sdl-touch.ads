package SDL.Touch is

   -- SDL_TOUCH_MOUSEID : constant := Unsigned_32 (-1);
   -- SDL_MOUSE_TOUCHID : constant := Integer_64 (-1);

   subtype SDL_TouchID is Integer_64;
   subtype SDL_FingerID is Integer_64;

   type SDL_TouchDeviceType is
     (SDL_TOUCH_DEVICE_INVALID,
      SDL_TOUCH_DEVICE_DIRECT,
      SDL_TOUCH_DEVICE_INDIRECT_ABSOLUTE,
      SDL_TOUCH_DEVICE_INDIRECT_RELATIVE)
     with Convention => C;

   for SDL_TouchDeviceType use
     (SDL_TOUCH_DEVICE_INVALID           => -1,
      SDL_TOUCH_DEVICE_DIRECT            => 0,
      SDL_TOUCH_DEVICE_INDIRECT_ABSOLUTE => 1,
      SDL_TOUCH_DEVICE_INDIRECT_RELATIVE => 2);

   type SDL_Finger is record
      id       : aliased SDL_FingerID;
      x        : aliased Float;
      y        : aliased Float;
      pressure : aliased Float;
   end record
     with Convention => C_Pass_By_Copy;

   function SDL_GetNumTouchDevices return int
     with Import, Convention => C, External_Name => "SDL_GetNumTouchDevices";

   function SDL_GetTouchDevice (index : int) return SDL_TouchID
     with Import, Convention => C, External_Name => "SDL_GetTouchDevice";

   function SDL_GetTouchDeviceType
     (touchID : SDL_TouchID) return SDL_TouchDeviceType
     with Import, Convention => C, External_Name => "SDL_GetTouchDeviceType";

   function SDL_GetNumTouchFingers (touchID : SDL_TouchID) return int
     with Import, Convention => C, External_Name => "SDL_GetNumTouchFingers";

   function SDL_GetTouchFinger
     (touchID : SDL_TouchID; index : int) return access SDL_Finger
     with Import, Convention => C, External_Name => "SDL_GetTouchFinger";

end SDL.Touch;
