with SDL.Joystick; use SDL.Joystick;

package SDL.Haptic is

   SDL_HAPTIC_CONSTANT     : constant := (2**0);
   SDL_HAPTIC_SINE         : constant := (2**1);
   SDL_HAPTIC_LEFTRIGHT    : constant := (2**2);
   SDL_HAPTIC_TRIANGLE     : constant := (2**3);
   SDL_HAPTIC_SAWTOOTHUP   : constant := (2**4);
   SDL_HAPTIC_SAWTOOTHDOWN : constant := (2**5);
   SDL_HAPTIC_RAMP         : constant := (2**6);
   SDL_HAPTIC_SPRING       : constant := (2**7);
   SDL_HAPTIC_DAMPER       : constant := (2**8);
   SDL_HAPTIC_INERTIA      : constant := (2**9);
   SDL_HAPTIC_FRICTION     : constant := (2**10);
   SDL_HAPTIC_CUSTOM       : constant := (2**11);
   SDL_HAPTIC_GAIN         : constant := (2**12);
   SDL_HAPTIC_AUTOCENTER   : constant := (2**13);
   SDL_HAPTIC_STATUS       : constant := (2**14);
   SDL_HAPTIC_PAUSE        : constant := (2**15);
   SDL_HAPTIC_POLAR        : constant := 0;
   SDL_HAPTIC_CARTESIAN    : constant := 1;
   SDL_HAPTIC_SPHERICAL    : constant := 2;
   SDL_HAPTIC_INFINITY     : constant := 4294967295;

   type SDL_Haptic is null record;   -- incomplete struct

   type SDL_HapticDirection is record
      c_type : aliased Unsigned_8;
      dir    : aliased Unsigned_8_Array (0 .. 2);
   end record
     with Convention => C_Pass_By_Copy;

   type SDL_HapticConstant is record
      c_type        : aliased Unsigned_16;
      direction     : aliased SDL_HapticDirection;
      length        : aliased Unsigned_32;
      c_delay       : aliased Unsigned_16;
      button        : aliased Unsigned_16;
      interval      : aliased Unsigned_16;
      level         : aliased Integer_16;
      attack_length : aliased Unsigned_16;
      attack_level  : aliased Unsigned_16;
      fade_length   : aliased Unsigned_16;
      fade_level    : aliased Unsigned_16;
   end record
     with Convention => C_Pass_By_Copy;

   type SDL_HapticPeriodic is record
      c_type        : aliased Unsigned_16;
      direction     : aliased SDL_HapticDirection;
      length        : aliased Unsigned_32;
      c_delay       : aliased Unsigned_16;
      button        : aliased Unsigned_16;
      interval      : aliased Unsigned_16;
      period        : aliased Unsigned_16;
      magnitude     : aliased Integer_16;
      offset        : aliased Integer_16;
      phase         : aliased Unsigned_16;
      attack_length : aliased Unsigned_16;
      attack_level  : aliased Unsigned_16;
      fade_length   : aliased Unsigned_16;
      fade_level    : aliased Unsigned_16;
   end record
     with Convention => C_Pass_By_Copy;

   type SDL_HapticCondition is record
      c_type      : aliased Unsigned_16;
      direction   : aliased SDL_HapticDirection;
      length      : aliased Unsigned_32;
      c_delay     : aliased Unsigned_16;
      button      : aliased Unsigned_16;
      interval    : aliased Unsigned_16;
      right_sat   : aliased Unsigned_16_Array (0 .. 2);
      left_sat    : aliased Unsigned_16_Array (0 .. 2);
      right_coeff : aliased Integer_16_Array (0 .. 2);
      left_coeff  : aliased Integer_16_Array (0 .. 2);
      deadband    : aliased Unsigned_16_Array (0 .. 2);
      center      : aliased Integer_16_Array (0 .. 2);
   end record
     with Convention => C_Pass_By_Copy;

   type SDL_HapticRamp is record
      c_type        : aliased Unsigned_16;
      direction     : aliased SDL_HapticDirection;
      length        : aliased Unsigned_32;
      c_delay       : aliased Unsigned_16;
      button        : aliased Unsigned_16;
      interval      : aliased Unsigned_16;
      start         : aliased Integer_16;
      c_end         : aliased Integer_16;
      attack_length : aliased Unsigned_16;
      attack_level  : aliased Unsigned_16;
      fade_length   : aliased Unsigned_16;
      fade_level    : aliased Unsigned_16;
   end record
     with Convention => C_Pass_By_Copy;

   type SDL_HapticLeftRight is record
      c_type          : aliased Unsigned_16;
      length          : aliased Unsigned_32;
      large_magnitude : aliased Unsigned_16;
      small_magnitude : aliased Unsigned_16;
   end record
     with Convention => C_Pass_By_Copy;

   type SDL_HapticCustom is record
      c_type        : aliased Unsigned_16;
      direction     : aliased SDL_HapticDirection;
      length        : aliased Unsigned_32;
      c_delay       : aliased Unsigned_16;
      button        : aliased Unsigned_16;
      interval      : aliased Unsigned_16;
      channels      : aliased Unsigned_8;
      period        : aliased Unsigned_16;
      samples       : aliased Unsigned_16;
      data          : access Unsigned_16;
      attack_length : aliased Unsigned_16;
      attack_level  : aliased Unsigned_16;
      fade_length   : aliased Unsigned_16;
      fade_level    : aliased Unsigned_16;
   end record
     with Convention => C_Pass_By_Copy;

   type SDL_HapticEffect (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            c_type : aliased Unsigned_16;
         when 1 =>
            c_constant : aliased SDL_HapticConstant;
         when 2 =>
            periodic : aliased SDL_HapticPeriodic;
         when 3 =>
            condition : aliased SDL_HapticCondition;
         when 4 =>
            ramp : aliased SDL_HapticRamp;
         when 5 =>
            leftright : aliased SDL_HapticLeftRight;
         when others =>
            custom : aliased SDL_HapticCustom;
      end case;
   end record
     with Convention      => C_Pass_By_Copy,
          Unchecked_Union => True;

   function SDL_NumHaptics return int
     with Import, Convention => C, External_Name => "SDL_NumHaptics";

   function SDL_HapticName (device_index : int) return chars_ptr
     with Import, Convention => C, External_Name => "SDL_HapticName";

   function SDL_HapticOpen (device_index : int) return access SDL_Haptic
     with Import, Convention => C, External_Name => "SDL_HapticOpen";

   function SDL_HapticOpened (device_index : int) return int
     with Import, Convention => C, External_Name => "SDL_HapticOpened";

   function SDL_HapticIndex (haptic : access SDL_Haptic) return int
     with Import, Convention => C, External_Name => "SDL_HapticIndex";

   function SDL_MouseIsHaptic return int
     with Import, Convention => C, External_Name => "SDL_MouseIsHaptic";

   function SDL_HapticOpenFromMouse return access SDL_Haptic
     with Import, Convention => C, External_Name => "SDL_HapticOpenFromMouse";

   function SDL_JoystickIsHaptic
     (joystick : access SDL_Joystick) return int
     with Import, Convention => C, External_Name => "SDL_JoystickIsHaptic";

   function SDL_HapticOpenFromJoystick
     (joystick : access SDL_Joystick) return access SDL_Haptic
     with Import, Convention => C, External_Name => "SDL_HapticOpenFromJoystick";

   procedure SDL_HapticClose (haptic : access SDL_Haptic)
     with Import, Convention => C, External_Name => "SDL_HapticClose";

   function SDL_HapticNumEffects (haptic : access SDL_Haptic) return int
     with Import, Convention => C, External_Name => "SDL_HapticNumEffects";

   function SDL_HapticNumEffectsPlaying
     (haptic : access SDL_Haptic) return int
     with Import, Convention => C, External_Name => "SDL_HapticNumEffectsPlaying";

   function SDL_HapticQuery (haptic : access SDL_Haptic) return unsigned
     with Import, Convention => C, External_Name => "SDL_HapticQuery";

   function SDL_HapticNumAxes (haptic : access SDL_Haptic) return int
     with Import, Convention => C, External_Name => "SDL_HapticNumAxes";

   function SDL_HapticEffectSupported
     (haptic : access SDL_Haptic;
      effect : access SDL_HapticEffect)
     return int
     with Import, Convention => C, External_Name => "SDL_HapticEffectSupported";

   function SDL_HapticNewEffect
     (haptic : access SDL_Haptic;
      effect : access SDL_HapticEffect)
     return int
     with Import, Convention => C, External_Name => "SDL_HapticNewEffect";

   function SDL_HapticUpdateEffect
     (haptic : access SDL_Haptic;
      effect : int;
      data   : access SDL_HapticEffect)
     return int
     with Import, Convention => C, External_Name => "SDL_HapticUpdateEffect";

   function SDL_HapticRunEffect
     (haptic     : access SDL_Haptic;
      effect     : int;
      iterations : Unsigned_32)
     return int
     with Import, Convention => C, External_Name => "SDL_HapticRunEffect";

   function SDL_HapticStopEffect
     (haptic : access SDL_Haptic;
      effect : int)
     return int
     with Import, Convention => C, External_Name => "SDL_HapticStopEffect";

   procedure SDL_HapticDestroyEffect
     (haptic : access SDL_Haptic; effect : int)
     with Import, Convention => C, External_Name => "SDL_HapticDestroyEffect";

   function SDL_HapticGetEffectStatus
     (haptic : access SDL_Haptic;
      effect : int)
     return int
     with Import, Convention => C, External_Name => "SDL_HapticGetEffectStatus";

   function SDL_HapticSetGain
     (haptic : access SDL_Haptic;
      gain   : int)
     return int
     with Import, Convention => C, External_Name => "SDL_HapticSetGain";

   function SDL_HapticSetAutocenter
     (haptic     : access SDL_Haptic;
      autocenter : int)
     return int
     with Import, Convention => C, External_Name => "SDL_HapticSetAutocenter";

   function SDL_HapticPause (haptic : access SDL_Haptic) return int
     with Import, Convention => C, External_Name => "SDL_HapticPause";

   function SDL_HapticUnpause (haptic : access SDL_Haptic) return int
     with Import, Convention => C, External_Name => "SDL_HapticUnpause";

   function SDL_HapticStopAll (haptic : access SDL_Haptic) return int
     with Import, Convention => C, External_Name => "SDL_HapticStopAll";

   function SDL_HapticRumbleSupported
     (haptic : access SDL_Haptic) return int
     with Import, Convention => C, External_Name => "SDL_HapticRumbleSupported";

   function SDL_HapticRumbleInit (haptic : access SDL_Haptic) return int
     with Import, Convention => C, External_Name => "SDL_HapticRumbleInit";

   function SDL_HapticRumblePlay
     (haptic   : access SDL_Haptic;
      strength : Float;
      length   : Unsigned_32)
     return int
     with Import, Convention => C, External_Name => "SDL_HapticRumblePlay";

   function SDL_HapticRumbleStop (haptic : access SDL_Haptic) return int
     with Import, Convention => C, External_Name => "SDL_HapticRumbleStop";

end SDL.Haptic;
