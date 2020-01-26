with SDL.Keyboard; use SDL.Keyboard;
with SDL.Joystick; use SDL.Joystick;
with SDL.Touch;    use SDL.Touch;
with SDL.Gesture;  use SDL.Gesture;

package SDL.Events is

   SDL_RELEASED : constant := 0;
   SDL_PRESSED  : constant := 1;

   SDL_TEXTEDITINGEVENT_TEXT_SIZE : constant := (32);
   SDL_TEXTINPUTEVENT_TEXT_SIZE   : constant := (32);

   SDL_QUERY   : constant := -1;
   SDL_IGNORE  : constant := 0;
   SDL_DISABLE : constant := 0;
   SDL_ENABLE  : constant := 1;

   subtype SDL_EventType is Unsigned_32;

   SDL_FIRSTEVENT               : constant SDL_EventType := 0;
   SDL_QUIT                     : constant SDL_EventType := 256;
   SDL_APP_TERMINATING          : constant SDL_EventType := 257;
   SDL_APP_LOWMEMORY            : constant SDL_EventType := 258;
   SDL_APP_WILLENTERBACKGROUND  : constant SDL_EventType := 259;
   SDL_APP_DIDENTERBACKGROUND   : constant SDL_EventType := 260;
   SDL_APP_WILLENTERFOREGROUND  : constant SDL_EventType := 261;
   SDL_APP_DIDENTERFOREGROUND   : constant SDL_EventType := 262;
   SDL_DISPLAYEVENT             : constant SDL_EventType := 336;
   SDL_WINDOWEVENT              : constant SDL_EventType := 512;
   SDL_SYSWMEVENT               : constant SDL_EventType := 513;
   SDL_KEYDOWN                  : constant SDL_EventType := 768;
   SDL_KEYUP                    : constant SDL_EventType := 769;
   SDL_TEXTEDITING              : constant SDL_EventType := 770;
   SDL_TEXTINPUT                : constant SDL_EventType := 771;
   SDL_KEYMAPCHANGED            : constant SDL_EventType := 772;
   SDL_MOUSEMOTION              : constant SDL_EventType := 1024;
   SDL_MOUSEBUTTONDOWN          : constant SDL_EventType := 1025;
   SDL_MOUSEBUTTONUP            : constant SDL_EventType := 1026;
   SDL_MOUSEWHEEL               : constant SDL_EventType := 1027;
   SDL_JOYAXISMOTION            : constant SDL_EventType := 1536;
   SDL_JOYBALLMOTION            : constant SDL_EventType := 1537;
   SDL_JOYHATMOTION             : constant SDL_EventType := 1538;
   SDL_JOYBUTTONDOWN            : constant SDL_EventType := 1539;
   SDL_JOYBUTTONUP              : constant SDL_EventType := 1540;
   SDL_JOYDEVICEADDED           : constant SDL_EventType := 1541;
   SDL_JOYDEVICEREMOVED         : constant SDL_EventType := 1542;
   SDL_CONTROLLERAXISMOTION     : constant SDL_EventType := 1616;
   SDL_CONTROLLERBUTTONDOWN     : constant SDL_EventType := 1617;
   SDL_CONTROLLERBUTTONUP       : constant SDL_EventType := 1618;
   SDL_CONTROLLERDEVICEADDED    : constant SDL_EventType := 1619;
   SDL_CONTROLLERDEVICEREMOVED  : constant SDL_EventType := 1620;
   SDL_CONTROLLERDEVICEREMAPPED : constant SDL_EventType := 1621;
   SDL_FINGERDOWN               : constant SDL_EventType := 1792;
   SDL_FINGERUP                 : constant SDL_EventType := 1793;
   SDL_FINGERMOTION             : constant SDL_EventType := 1794;
   SDL_DOLLARGESTURE            : constant SDL_EventType := 2048;
   SDL_DOLLARRECORD             : constant SDL_EventType := 2049;
   SDL_MULTIGESTURE             : constant SDL_EventType := 2050;
   SDL_CLIPBOARDUPDATE          : constant SDL_EventType := 2304;
   SDL_DROPFILE                 : constant SDL_EventType := 4096;
   SDL_DROPTEXT                 : constant SDL_EventType := 4097;
   SDL_DROPBEGIN                : constant SDL_EventType := 4098;
   SDL_DROPCOMPLETE             : constant SDL_EventType := 4099;
   SDL_AUDIODEVICEADDED         : constant SDL_EventType := 4352;
   SDL_AUDIODEVICEREMOVED       : constant SDL_EventType := 4353;
   SDL_SENSORUPDATE             : constant SDL_EventType := 4608;
   SDL_RENDER_TARGETS_RESET     : constant SDL_EventType := 8192;
   SDL_RENDER_DEVICE_RESET      : constant SDL_EventType := 8193;
   SDL_USEREVENT                : constant SDL_EventType := 32768;
   SDL_LASTEVENT                : constant SDL_EventType := 65535;

   type SDL_CommonEvent_Data is record
      c_type    : aliased Unsigned_32;
      timestamp : aliased Unsigned_32;
   end record
     with Convention => C_Pass_By_Copy;

   type SDL_DisplayEvent_Data is record
      c_type    : aliased Unsigned_32;
      timestamp : aliased Unsigned_32;
      display   : aliased Unsigned_32;
      event     : aliased Unsigned_8;
      padding1  : aliased Unsigned_8;
      padding2  : aliased Unsigned_8;
      padding3  : aliased Unsigned_8;
      data1     : aliased Integer_32;
   end record
     with Convention => C_Pass_By_Copy;

   type SDL_WindowEvent_Data is record
      c_type    : aliased Unsigned_32;
      timestamp : aliased Unsigned_32;
      windowID  : aliased Unsigned_32;
      event     : aliased Unsigned_8;
      padding1  : aliased Unsigned_8;
      padding2  : aliased Unsigned_8;
      padding3  : aliased Unsigned_8;
      data1     : aliased Integer_32;
      data2     : aliased Integer_32;
   end record
     with Convention => C_Pass_By_Copy;

   type SDL_KeyboardEvent_Data is record
      c_type    : aliased Unsigned_32;
      timestamp : aliased Unsigned_32;
      windowID  : aliased Unsigned_32;
      state     : aliased Unsigned_8;
      repeat    : aliased Unsigned_8;
      padding2  : aliased Unsigned_8;
      padding3  : aliased Unsigned_8;
      keysym    : aliased SDL_Keysym;
   end record
     with Convention => C_Pass_By_Copy;

   type SDL_TextEditingEvent_Data is record
      c_type    : aliased Unsigned_32;
      timestamp : aliased Unsigned_32;
      windowID  : aliased Unsigned_32;
      text      : aliased char_array (0 .. 31);
      start     : aliased Integer_32;
      length    : aliased Integer_32;
   end record
     with Convention => C_Pass_By_Copy;

   type SDL_TextInputEvent_Data is record
      c_type    : aliased Unsigned_32;
      timestamp : aliased Unsigned_32;
      windowID  : aliased Unsigned_32;
      text      : aliased char_array (0 .. 31);
   end record
     with Convention => C_Pass_By_Copy;

   type SDL_MouseMotionEvent_Data is record
      c_type    : aliased Unsigned_32;
      timestamp : aliased Unsigned_32;
      windowID  : aliased Unsigned_32;
      which     : aliased Unsigned_32;
      state     : aliased Unsigned_32;
      x         : aliased Integer_32;
      y         : aliased Integer_32;
      xrel      : aliased Integer_32;
      yrel      : aliased Integer_32;
   end record
     with Convention => C_Pass_By_Copy;

   type SDL_MouseButtonEvent_Data is record
      c_type    : aliased Unsigned_32;
      timestamp : aliased Unsigned_32;
      windowID  : aliased Unsigned_32;
      which     : aliased Unsigned_32;
      button    : aliased Unsigned_8;
      state     : aliased Unsigned_8;
      clicks    : aliased Unsigned_8;
      padding1  : aliased Unsigned_8;
      x         : aliased Integer_32;
      y         : aliased Integer_32;
   end record
     with Convention => C_Pass_By_Copy;

   type SDL_MouseWheelEvent_Data is record
      c_type    : aliased Unsigned_32;
      timestamp : aliased Unsigned_32;
      windowID  : aliased Unsigned_32;
      which     : aliased Unsigned_32;
      x         : aliased Integer_32;
      y         : aliased Integer_32;
      direction : aliased Unsigned_32;
   end record
     with Convention => C_Pass_By_Copy;

   type SDL_JoyAxisEvent_Data is record
      c_type    : aliased Unsigned_32;
      timestamp : aliased Unsigned_32;
      which     : aliased SDL_JoystickID;
      axis      : aliased Unsigned_8;
      padding1  : aliased Unsigned_8;
      padding2  : aliased Unsigned_8;
      padding3  : aliased Unsigned_8;
      value     : aliased Integer_16;
      padding4  : aliased Unsigned_16;
   end record
     with Convention => C_Pass_By_Copy;

   type SDL_JoyBallEvent_Data is record
      c_type    : aliased Unsigned_32;
      timestamp : aliased Unsigned_32;
      which     : aliased SDL_JoystickID;
      ball      : aliased Unsigned_8;
      padding1  : aliased Unsigned_8;
      padding2  : aliased Unsigned_8;
      padding3  : aliased Unsigned_8;
      xrel      : aliased Integer_16;
      yrel      : aliased Integer_16;
   end record
     with Convention => C_Pass_By_Copy;

   type SDL_JoyHatEvent_Data is record
      c_type    : aliased Unsigned_32;
      timestamp : aliased Unsigned_32;
      which     : aliased SDL_JoystickID;
      hat       : aliased Unsigned_8;
      value     : aliased Unsigned_8;
      padding1  : aliased Unsigned_8;
      padding2  : aliased Unsigned_8;
   end record
     with Convention => C_Pass_By_Copy;

   type SDL_JoyButtonEvent_Data is record
      c_type    : aliased Unsigned_32;
      timestamp : aliased Unsigned_32;
      which     : aliased SDL_JoystickID;
      button    : aliased Unsigned_8;
      state     : aliased Unsigned_8;
      padding1  : aliased Unsigned_8;
      padding2  : aliased Unsigned_8;
   end record
     with Convention => C_Pass_By_Copy;

   type SDL_JoyDeviceEvent_Data is record
      c_type    : aliased Unsigned_32;
      timestamp : aliased Unsigned_32;
      which     : aliased Integer_32;
   end record
     with Convention => C_Pass_By_Copy;

   type SDL_ControllerAxisEvent_Data is record
      c_type    : aliased Unsigned_32;
      timestamp : aliased Unsigned_32;
      which     : aliased SDL_JoystickID;
      axis      : aliased Unsigned_8;
      padding1  : aliased Unsigned_8;
      padding2  : aliased Unsigned_8;
      padding3  : aliased Unsigned_8;
      value     : aliased Integer_16;
      padding4  : aliased Unsigned_16;
   end record
     with Convention => C_Pass_By_Copy;

   type SDL_ControllerButtonEvent_Data is record
      c_type    : aliased Unsigned_32;
      timestamp : aliased Unsigned_32;
      which     : aliased SDL_JoystickID;
      button    : aliased Unsigned_8;
      state     : aliased Unsigned_8;
      padding1  : aliased Unsigned_8;
      padding2  : aliased Unsigned_8;
   end record
     with Convention => C_Pass_By_Copy;

   type SDL_ControllerDeviceEvent_Data is record
      c_type    : aliased Unsigned_32;
      timestamp : aliased Unsigned_32;
      which     : aliased Integer_32;
   end record
     with Convention => C_Pass_By_Copy;

   type SDL_AudioDeviceEvent_Data is record
      c_type    : aliased Unsigned_32;
      timestamp : aliased Unsigned_32;
      which     : aliased Unsigned_32;
      iscapture : aliased Unsigned_8;
      padding1  : aliased Unsigned_8;
      padding2  : aliased Unsigned_8;
      padding3  : aliased Unsigned_8;
   end record
     with Convention => C_Pass_By_Copy;

   type SDL_TouchFingerEvent_Data is record
      c_type    : aliased Unsigned_32;
      timestamp : aliased Unsigned_32;
      touchId   : aliased SDL_TouchID;
      fingerId  : aliased SDL_FingerID;
      x         : aliased Float;
      y         : aliased Float;
      dx        : aliased Float;
      dy        : aliased Float;
      pressure  : aliased Float;
   end record
     with Convention => C_Pass_By_Copy;

   type SDL_MultiGestureEvent_Data is record
      c_type     : aliased Unsigned_32;
      timestamp  : aliased Unsigned_32;
      touchId    : aliased SDL_TouchID;
      dTheta     : aliased Float;
      dDist      : aliased Float;
      x          : aliased Float;
      y          : aliased Float;
      numFingers : aliased Unsigned_16;
      padding    : aliased Unsigned_16;
   end record
     with Convention => C_Pass_By_Copy;

   type SDL_DollarGestureEvent_Data is record
      c_type     : aliased Unsigned_32;
      timestamp  : aliased Unsigned_32;
      touchId    : aliased SDL_TouchID;
      gestureId  : aliased SDL_GestureID;
      numFingers : aliased Unsigned_32;
      error      : aliased Float;
      x          : aliased Float;
      y          : aliased Float;
   end record
     with Convention => C_Pass_By_Copy;

   type SDL_DropEvent_Data is record
      c_type    : aliased Unsigned_32;
      timestamp : aliased Unsigned_32;
      file      : Interfaces.C.Strings.chars_ptr;
      windowID  : aliased Unsigned_32;
   end record
     with Convention => C_Pass_By_Copy;

   type SDL_SensorEvent_Data is record
      c_type    : aliased Unsigned_32;
      timestamp : aliased Unsigned_32;
      which     : aliased Integer_32;
      data      : aliased Float_Array (0 .. 5);
   end record
     with Convention => C_Pass_By_Copy;

   type SDL_QuitEvent_Data is record
      c_type    : aliased Unsigned_32;
      timestamp : aliased Unsigned_32;
   end record
     with Convention => C_Pass_By_Copy;

   type SDL_OSEvent_Data is record
      c_type    : aliased Unsigned_32;
      timestamp : aliased Unsigned_32;
   end record
     with Convention => C_Pass_By_Copy;

   type SDL_UserEvent_Data is record
      c_type    : aliased Unsigned_32;
      timestamp : aliased Unsigned_32;
      windowID  : aliased Unsigned_32;
      code      : aliased Integer_32;
      data1     : System.Address;
      data2     : System.Address;
   end record
     with Convention => C_Pass_By_Copy;

   type SDL_SysWMmsg is null record;   -- incomplete struct

   type SDL_SysWMEvent_Data is record
      c_type    : aliased Unsigned_32;
      timestamp : aliased Unsigned_32;
      msg       : access SDL_SysWMmsg;
   end record
     with Convention => C_Pass_By_Copy;

   type SDL_Event (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            c_type : aliased Unsigned_32;
         when 1 =>
            common : aliased SDL_CommonEvent_Data;
         when 2 =>
            display : aliased SDL_DisplayEvent_Data;
         when 3 =>
            window : aliased SDL_WindowEvent_Data;
         when 4 =>
            key : aliased SDL_KeyboardEvent_Data;
         when 5 =>
            edit : aliased SDL_TextEditingEvent_Data;
         when 6 =>
            text : aliased SDL_TextInputEvent_Data;
         when 7 =>
            motion : aliased SDL_MouseMotionEvent_Data;
         when 8 =>
            button : aliased SDL_MouseButtonEvent_Data;
         when 9 =>
            wheel : aliased SDL_MouseWheelEvent_Data;
         when 10 =>
            jaxis : aliased SDL_JoyAxisEvent_Data;
         when 11 =>
            jball : aliased SDL_JoyBallEvent_Data;
         when 12 =>
            jhat : aliased SDL_JoyHatEvent_Data;
         when 13 =>
            jbutton : aliased SDL_JoyButtonEvent_Data;
         when 14 =>
            jdevice : aliased SDL_JoyDeviceEvent_Data;
         when 15 =>
            caxis : aliased SDL_ControllerAxisEvent_Data;
         when 16 =>
            cbutton : aliased SDL_ControllerButtonEvent_Data;
         when 17 =>
            cdevice : aliased SDL_ControllerDeviceEvent_Data;
         when 18 =>
            adevice : aliased SDL_AudioDeviceEvent_Data;
         when 19 =>
            sensor : aliased SDL_SensorEvent_Data;
         when 20 =>
            quit : aliased SDL_QuitEvent_Data;
         when 21 =>
            user : aliased SDL_UserEvent_Data;
         when 22 =>
            syswm : aliased SDL_SysWMEvent_Data;
         when 23 =>
            tfinger : aliased SDL_TouchFingerEvent_Data;
         when 24 =>
            mgesture : aliased SDL_MultiGestureEvent_Data;
         when 25 =>
            dgesture : aliased SDL_DollarGestureEvent_Data;
         when 26 =>
            drop : aliased SDL_DropEvent_Data;
         when others =>
            padding : aliased Unsigned_8_Array (0 .. 55);
      end case;
   end record
     with Convention      => C_Pass_By_Copy,
          Unchecked_Union => True;

   procedure SDL_PumpEvents
     with Import, Convention => C, External_Name => "SDL_PumpEvents";

   type SDL_eventaction is
     (SDL_ADDEVENT,
      SDL_PEEKEVENT,
      SDL_GETEVENT)
     with Convention => C;

   function SDL_PeepEvents
     (events    : access SDL_Event;
      numevents : int;
      action    : SDL_eventaction;
      minType   : Unsigned_32;
      maxType   : Unsigned_32)
     return int
     with Import, Convention => C, External_Name => "SDL_PeepEvents";

   function SDL_HasEvent (c_type : Unsigned_32) return SDL_bool
     with Import, Convention => C, External_Name => "SDL_HasEvent";

   function SDL_HasEvents
     (minType : Unsigned_32;
      maxType : Unsigned_32)
     return SDL_bool
     with Import, Convention => C, External_Name => "SDL_HasEvents";

   procedure SDL_FlushEvent (c_type : Unsigned_32)
     with Import, Convention => C, External_Name => "SDL_FlushEvent";

   procedure SDL_FlushEvents
     (minType : Unsigned_32; maxType : Unsigned_32)
     with Import, Convention => C, External_Name => "SDL_FlushEvents";

   function SDL_PollEvent (event : access SDL_Event) return int
     with Import, Convention => C, External_Name => "SDL_PollEvent";

   function SDL_WaitEvent (event : access SDL_Event) return int
     with Import, Convention => C, External_Name => "SDL_WaitEvent";

   function SDL_WaitEventTimeout
     (event   : access SDL_Event;
      timeout : int)
     return int
     with Import, Convention => C, External_Name => "SDL_WaitEventTimeout";

   function SDL_PushEvent (event : access SDL_Event) return int
     with Import, Convention => C, External_Name => "SDL_PushEvent";

   type SDL_EventFilter is access function
     (userdata : System.Address;
      event    : access SDL_Event)
     return int with
      Convention => C;

   procedure SDL_SetEventFilter
     (filter : SDL_EventFilter; userdata : System.Address)
     with Import, Convention => C, External_Name => "SDL_SetEventFilter";

   function SDL_GetEventFilter
     (filter   : System.Address;
      userdata : System.Address)
     return SDL_bool
     with Import, Convention => C, External_Name => "SDL_GetEventFilter";

   procedure SDL_AddEventWatch
     (filter : SDL_EventFilter; userdata : System.Address)
     with Import, Convention => C, External_Name => "SDL_AddEventWatch";

   procedure SDL_DelEventWatch
     (filter : SDL_EventFilter; userdata : System.Address)
     with Import, Convention => C, External_Name => "SDL_DelEventWatch";

   procedure SDL_FilterEvents
     (filter : SDL_EventFilter; userdata : System.Address)
     with Import, Convention => C, External_Name => "SDL_FilterEvents";

   function SDL_EventState
     (c_type : Unsigned_32;
      state  : int)
     return Unsigned_8
     with Import, Convention => C, External_Name => "SDL_EventState";

   function SDL_GetEventState (c_type : Unsigned_32) return Unsigned_8 is
     (SDL_EventState (c_type, SDL_QUERY));

   function SDL_RegisterEvents (numevents : int) return Unsigned_32
     with Import, Convention => C, External_Name => "SDL_RegisterEvents";

end SDL.Events;
