with SDL.Joystick; use SDL.Joystick;
with SDL.RWops;    use SDL.RWops;

package SDL.GameController is

   type SDL_GameController is null record; -- incomplete record

   type SDL_GameControllerBindType is
     (SDL_CONTROLLER_BINDTYPE_NONE,
      SDL_CONTROLLER_BINDTYPE_BUTTON,
      SDL_CONTROLLER_BINDTYPE_AXIS,
      SDL_CONTROLLER_BINDTYPE_HAT)
     with Convention => C;

   type Anon_Hat is record
      hat      : aliased int;
      hat_mask : aliased int;
   end record
     with Convention => C_Pass_By_Copy;

   type Anon_Value (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            button : aliased int;
         when 1 =>
            axis : aliased int;
         when others =>
            hat : aliased Anon_Hat;
      end case;
   end record
     with Convention      => C_Pass_By_Copy,
          Unchecked_Union => True;

   type SDL_GameControllerButtonBind is record
      bindType : aliased SDL_GameControllerBindType;
      value    : aliased Anon_Value;
   end record
     with Convention => C_Pass_By_Copy;

   function SDL_GameControllerAddMappingsFromRW
     (rw : access SDL_RWops; freerw : int) return int
     with Import, Convention => C, External_Name => "SDL_GameControllerAddMappingsFromRW";

   function SDL_GameControllerAddMappingsFromFile
     (file : char_array) return int is
     (SDL_GameControllerAddMappingsFromRW (SDL_RWFromFile (file, "rb"), 1));

   function SDL_GameControllerAddMapping
     (mappingString : char_array) return int
     with Import, Convention => C, External_Name => "SDL_GameControllerAddMapping";

   function SDL_GameControllerNumMappings return int
     with Import, Convention => C, External_Name => "SDL_GameControllerNumMappings";

   function SDL_GameControllerMappingForIndex
     (mapping_index : int) return chars_ptr
     with Import, Convention => C, External_Name => "SDL_GameControllerMappingForIndex";

   function SDL_GameControllerMappingForGUID
     (guid : SDL_JoystickGUID) return chars_ptr
     with Import, Convention => C, External_Name => "SDL_GameControllerMappingForGUID";

   function SDL_GameControllerMapping
     (gamecontroller : access SDL_GameController) return chars_ptr
     with Import, Convention => C, External_Name => "SDL_GameControllerMapping";

   function SDL_IsGameController (joystick_index : int) return SDL_bool
     with Import, Convention => C, External_Name => "SDL_IsGameController";

   function SDL_GameControllerNameForIndex
     (joystick_index : int) return chars_ptr
     with Import, Convention => C, External_Name => "SDL_GameControllerNameForIndex";

   function SDL_GameControllerMappingForDeviceIndex
     (joystick_index : int) return chars_ptr
     with Import, Convention => C, External_Name => "SDL_GameControllerMappingForDeviceIndex";

   function SDL_GameControllerOpen
     (joystick_index : int) return access SDL_GameController
     with Import, Convention => C, External_Name => "SDL_GameControllerOpen";

   function SDL_GameControllerFromInstanceID
     (joyid : SDL_JoystickID) return access SDL_GameController
     with Import, Convention => C, External_Name => "SDL_GameControllerFromInstanceID";

   function SDL_GameControllerName
     (gamecontroller : access SDL_GameController) return chars_ptr
     with Import, Convention => C, External_Name => "SDL_GameControllerName";

   function SDL_GameControllerGetPlayerIndex
     (gamecontroller : access SDL_GameController) return int
     with Import, Convention => C, External_Name => "SDL_GameControllerGetPlayerIndex";

   function SDL_GameControllerGetVendor
     (gamecontroller : access SDL_GameController) return Unsigned_16
     with Import, Convention => C, External_Name => "SDL_GameControllerGetVendor";

   function SDL_GameControllerGetProduct
     (gamecontroller : access SDL_GameController) return Unsigned_16
     with Import, Convention => C, External_Name => "SDL_GameControllerGetProduct";

   function SDL_GameControllerGetProductVersion
     (gamecontroller : access SDL_GameController) return Unsigned_16
     with Import, Convention => C, External_Name => "SDL_GameControllerGetProductVersion";

   function SDL_GameControllerGetAttached
     (gamecontroller : access SDL_GameController) return SDL_bool
     with Import, Convention => C, External_Name => "SDL_GameControllerGetAttached";

   function SDL_GameControllerGetJoystick
     (gamecontroller : access SDL_GameController)
      return access SDL_Joystick
     with Import, Convention => C, External_Name => "SDL_GameControllerGetJoystick";

   function SDL_GameControllerEventState (state : int) return int
     with Import, Convention => C, External_Name => "SDL_GameControllerEventState";

   procedure SDL_GameControllerUpdate
     with Import, Convention => C, External_Name => "SDL_GameControllerUpdate";

   type SDL_GameControllerAxis is
     (SDL_CONTROLLER_AXIS_INVALID,
      SDL_CONTROLLER_AXIS_LEFTX,
      SDL_CONTROLLER_AXIS_LEFTY,
      SDL_CONTROLLER_AXIS_RIGHTX,
      SDL_CONTROLLER_AXIS_RIGHTY,
      SDL_CONTROLLER_AXIS_TRIGGERLEFT,
      SDL_CONTROLLER_AXIS_TRIGGERRIGHT,
      SDL_CONTROLLER_AXIS_MAX)
     with Convention => C;

   for SDL_GameControllerAxis use
     (SDL_CONTROLLER_AXIS_INVALID      => -1,
      SDL_CONTROLLER_AXIS_LEFTX        => 0,
      SDL_CONTROLLER_AXIS_LEFTY        => 1,
      SDL_CONTROLLER_AXIS_RIGHTX       => 2,
      SDL_CONTROLLER_AXIS_RIGHTY       => 3,
      SDL_CONTROLLER_AXIS_TRIGGERLEFT  => 4,
      SDL_CONTROLLER_AXIS_TRIGGERRIGHT => 5,
      SDL_CONTROLLER_AXIS_MAX          => 6);

   function SDL_GameControllerGetAxisFromString
     (pchString : char_array) return SDL_GameControllerAxis
     with Import, Convention => C, External_Name => "SDL_GameControllerGetAxisFromString";

   function SDL_GameControllerGetStringForAxis
     (axis : SDL_GameControllerAxis) return chars_ptr
     with Import, Convention => C, External_Name => "SDL_GameControllerGetStringForAxis";

   function SDL_GameControllerGetBindForAxis
     (gamecontroller : access SDL_GameController;
      axis : SDL_GameControllerAxis) return SDL_GameControllerButtonBind
     with Import, Convention => C, External_Name => "SDL_GameControllerGetBindForAxis";

   function SDL_GameControllerGetAxis
     (gamecontroller : access SDL_GameController;
      axis           : SDL_GameControllerAxis) return Integer_16
     with Import, Convention => C, External_Name => "SDL_GameControllerGetAxis";

   type SDL_GameControllerButton is
     (SDL_CONTROLLER_BUTTON_INVALID,
      SDL_CONTROLLER_BUTTON_A,
      SDL_CONTROLLER_BUTTON_B,
      SDL_CONTROLLER_BUTTON_X,
      SDL_CONTROLLER_BUTTON_Y,
      SDL_CONTROLLER_BUTTON_BACK,
      SDL_CONTROLLER_BUTTON_GUIDE,
      SDL_CONTROLLER_BUTTON_START,
      SDL_CONTROLLER_BUTTON_LEFTSTICK,
      SDL_CONTROLLER_BUTTON_RIGHTSTICK,
      SDL_CONTROLLER_BUTTON_LEFTSHOULDER,
      SDL_CONTROLLER_BUTTON_RIGHTSHOULDER,
      SDL_CONTROLLER_BUTTON_DPAD_UP,
      SDL_CONTROLLER_BUTTON_DPAD_DOWN,
      SDL_CONTROLLER_BUTTON_DPAD_LEFT,
      SDL_CONTROLLER_BUTTON_DPAD_RIGHT,
      SDL_CONTROLLER_BUTTON_MAX)
     with Convention => C;

   for SDL_GameControllerButton use
     (SDL_CONTROLLER_BUTTON_INVALID       => -1,
      SDL_CONTROLLER_BUTTON_A             => 0,
      SDL_CONTROLLER_BUTTON_B             => 1,
      SDL_CONTROLLER_BUTTON_X             => 2,
      SDL_CONTROLLER_BUTTON_Y             => 3,
      SDL_CONTROLLER_BUTTON_BACK          => 4,
      SDL_CONTROLLER_BUTTON_GUIDE         => 5,
      SDL_CONTROLLER_BUTTON_START         => 6,
      SDL_CONTROLLER_BUTTON_LEFTSTICK     => 7,
      SDL_CONTROLLER_BUTTON_RIGHTSTICK    => 8,
      SDL_CONTROLLER_BUTTON_LEFTSHOULDER  => 9,
      SDL_CONTROLLER_BUTTON_RIGHTSHOULDER => 10,
      SDL_CONTROLLER_BUTTON_DPAD_UP       => 11,
      SDL_CONTROLLER_BUTTON_DPAD_DOWN     => 12,
      SDL_CONTROLLER_BUTTON_DPAD_LEFT     => 13,
      SDL_CONTROLLER_BUTTON_DPAD_RIGHT    => 14,
      SDL_CONTROLLER_BUTTON_MAX           => 15);

   function SDL_GameControllerGetButtonFromString
     (pchString : char_array) return SDL_GameControllerButton
     with Import, Convention => C, External_Name => "SDL_GameControllerGetButtonFromString";

   function SDL_GameControllerGetStringForButton
     (button : SDL_GameControllerButton) return chars_ptr
     with Import, Convention => C, External_Name => "SDL_GameControllerGetStringForButton";

   function SDL_GameControllerGetBindForButton
     (gamecontroller : access SDL_GameController;
      button         : SDL_GameControllerButton)
      return SDL_GameControllerButtonBind
     with Import, Convention => C, External_Name => "SDL_GameControllerGetBindForButton";

   function SDL_GameControllerGetButton
     (gamecontroller : access SDL_GameController;
      button         : SDL_GameControllerButton) return Unsigned_8
     with Import, Convention => C, External_Name => "SDL_GameControllerGetButton";

   function SDL_GameControllerRumble
     (gamecontroller        : access SDL_GameController;
      low_frequency_rumble  : Unsigned_16;
      high_frequency_rumble : Unsigned_16;
      duration_ms           : Unsigned_32)
     return int
     with Import, Convention => C, External_Name => "SDL_GameControllerRumble";

   procedure SDL_GameControllerClose
     (gamecontroller : access SDL_GameController)
     with Import, Convention => C, External_Name => "SDL_GameControllerClose";

end SDL.GameController;
