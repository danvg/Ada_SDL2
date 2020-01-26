package SDL.Sensor is

   SDL_STANDARD_GRAVITY : constant := 9.80665;

   type SDL_Sensor is null record;   -- incomplete struct
   subtype SDL_SensorID is Integer_32;

   type SDL_SensorType is
     (SDL_SENSOR_INVALID,
      SDL_SENSOR_UNKNOWN,
      SDL_SENSOR_ACCEL,
      SDL_SENSOR_GYRO)
     with Convention => C;

   for SDL_SensorType use
     (SDL_SENSOR_INVALID => -1,
      SDL_SENSOR_UNKNOWN => 0,
      SDL_SENSOR_ACCEL   => 1,
      SDL_SENSOR_GYRO    => 2);

   function SDL_NumSensors return int
     with Import, Convention => C, External_Name => "SDL_NumSensors";

   function SDL_SensorGetDeviceName
     (device_index : int) return chars_ptr
     with Import, Convention => C, External_Name => "SDL_SensorGetDeviceName";

   function SDL_SensorGetDeviceType
     (device_index : int) return SDL_SensorType
     with Import, Convention => C, External_Name => "SDL_SensorGetDeviceType";

   function SDL_SensorGetDeviceNonPortableType
     (device_index : int) return int
     with Import, Convention => C, External_Name => "SDL_SensorGetDeviceNonPortableType";

   function SDL_SensorGetDeviceInstanceID
     (device_index : int) return SDL_SensorID
     with Import, Convention => C, External_Name => "SDL_SensorGetDeviceInstanceID";

   function SDL_SensorOpen (device_index : int) return access SDL_Sensor
     with Import, Convention => C, External_Name => "SDL_SensorOpen";

   function SDL_SensorFromInstanceID
     (instance_id : SDL_SensorID) return access SDL_Sensor
     with Import, Convention => C, External_Name => "SDL_SensorFromInstanceID";

   function SDL_SensorGetName
     (sensor : access SDL_Sensor) return chars_ptr
     with Import, Convention => C, External_Name => "SDL_SensorGetName";

   function SDL_SensorGetType
     (sensor : access SDL_Sensor) return SDL_SensorType
     with Import, Convention => C, External_Name => "SDL_SensorGetType";

   function SDL_SensorGetNonPortableType
     (sensor : access SDL_Sensor) return int
     with Import, Convention => C, External_Name => "SDL_SensorGetNonPortableType";

   function SDL_SensorGetInstanceID
     (sensor : access SDL_Sensor) return SDL_SensorID
     with Import, Convention => C, External_Name => "SDL_SensorGetInstanceID";

   function SDL_SensorGetData
     (sensor     : access SDL_Sensor;
      data       : access Float;
      num_values : int)
     return int
     with Import, Convention => C, External_Name => "SDL_SensorGetData";

   procedure SDL_SensorClose (sensor : access SDL_Sensor)
     with Import, Convention => C, External_Name => "SDL_SensorClose";

   procedure SDL_SensorUpdate
     with Import, Convention => C, External_Name => "SDL_SensorUpdate";

end SDL.Sensor;
