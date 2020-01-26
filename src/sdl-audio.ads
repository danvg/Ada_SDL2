with SDL.Rwops; use SDL.Rwops;

package SDL.Audio is

   SDL_AUDIO_MASK_BITSIZE  : constant := (16#FF#);
   SDL_AUDIO_MASK_DATATYPE : constant := (2**8);
   SDL_AUDIO_MASK_ENDIAN   : constant := (2**12);
   SDL_AUDIO_MASK_SIGNED   : constant := (2**15);

   subtype SDL_AudioFormat is Unsigned_16;

   AUDIO_U8     : constant SDL_AudioFormat := 16#0008#;
   AUDIO_S8     : constant SDL_AudioFormat := 16#8008#;
   AUDIO_U16LSB : constant SDL_AudioFormat := 16#0010#;
   AUDIO_S16LSB : constant SDL_AudioFormat := 16#8010#;
   AUDIO_U16MSB : constant SDL_AudioFormat := 16#1010#;
   AUDIO_S16MSB : constant SDL_AudioFormat := 16#9010#;
   AUDIO_U16    : constant SDL_AudioFormat := AUDIO_U16LSB;
   AUDIO_S16    : constant SDL_AudioFormat := AUDIO_S16LSB;

   AUDIO_S32LSB : constant SDL_AudioFormat := 16#8020#;
   AUDIO_S32MSB : constant SDL_AudioFormat := 16#9020#;
   AUDIO_S32    : constant SDL_AudioFormat := AUDIO_S32LSB;

   AUDIO_F32LSB : constant SDL_AudioFormat := 16#8120#;
   AUDIO_F32MSB : constant SDL_AudioFormat := 16#9120#;
   AUDIO_F32    : constant SDL_AudioFormat := AUDIO_F32LSB;

--  #if SDL_BYTEORDER = SDL_LIL_ENDIAN
   AUDIO_U16SYS : constant SDL_AudioFormat := AUDIO_U16LSB;
   AUDIO_S16SYS : constant SDL_AudioFormat := AUDIO_S16LSB;
   AUDIO_S32SYS : constant SDL_AudioFormat := AUDIO_S32LSB;
   AUDIO_F32SYS : constant SDL_AudioFormat := AUDIO_F32LSB;
--  #else
--     AUDIO_U16SYS : constant SDL_AudioFormat := AUDIO_U16MSB;
--     AUDIO_S16SYS : constant SDL_AudioFormat := AUDIO_S16MSB;
--     AUDIO_S32SYS : constant SDL_AudioFormat := AUDIO_S32MSB;
--     AUDIO_F32SYS : constant SDL_AudioFormat := AUDIO_F32MSB;
--  #end if

   SDL_AUDIO_ALLOW_FREQUENCY_CHANGE : constant := 16#00000001#;
   SDL_AUDIO_ALLOW_FORMAT_CHANGE    : constant := 16#00000002#;
   SDL_AUDIO_ALLOW_CHANNELS_CHANGE  : constant := 16#00000004#;
   SDL_AUDIO_ALLOW_SAMPLES_CHANGE   : constant := 16#00000008#;

   SDL_AUDIO_ALLOW_ANY_CHANGE : constant unsigned :=
     SDL_AUDIO_ALLOW_FREQUENCY_CHANGE or SDL_AUDIO_ALLOW_FORMAT_CHANGE or
     SDL_AUDIO_ALLOW_CHANNELS_CHANGE or SDL_AUDIO_ALLOW_SAMPLES_CHANGE;

   SDL_AUDIOCVT_MAX_FILTERS : constant := 9;

   SDL_MIX_MAXVOLUME : constant := 128;

   function SDL_AUDIO_BITSIZE (x : SDL_AudioFormat) return int is
     (int (x and SDL_AUDIO_MASK_BITSIZE));

   function SDL_AUDIO_ISFLOAT (x : SDL_AudioFormat) return SDL_bool is
     (if ((x and SDL_AUDIO_MASK_DATATYPE) /= 0) then SDL_TRUE else SDL_FALSE);

   function SDL_AUDIO_ISBIGENDIAN (x : SDL_AudioFormat) return SDL_bool is
     (if ((x and SDL_AUDIO_MASK_ENDIAN) /= 0) then SDL_TRUE else SDL_FALSE);

   function SDL_AUDIO_ISSIGNED (x : SDL_AudioFormat) return SDL_bool is
     (if ((x and SDL_AUDIO_MASK_SIGNED) /= 0) then SDL_TRUE else SDL_FALSE);

   function SDL_AUDIO_ISINT (x : SDL_AudioFormat) return SDL_bool is
     (if (SDL_AUDIO_ISFLOAT (x) = SDL_FALSE) then SDL_TRUE else SDL_FALSE);

   function SDL_AUDIO_ISLITTLEENDIAN (x : SDL_AudioFormat) return SDL_bool is
     (if (SDL_AUDIO_ISBIGENDIAN (x) = SDL_FALSE) then SDL_TRUE else SDL_FALSE);

   function SDL_AUDIO_ISUNSIGNED (x : SDL_AudioFormat) return SDL_bool is
     (if (SDL_AUDIO_ISSIGNED (x) = SDL_FALSE) then SDL_TRUE else SDL_FALSE);

   type SDL_AudioCallback is access procedure
     (userdata : System.Address;
      stream   : access Unsigned_8;
      len      : int)
     with Convention => C;

   type SDL_AudioSpec is record
      freq     : aliased int;
      format   : aliased SDL_AudioFormat;
      channels : aliased Unsigned_8;
      silence  : aliased Unsigned_8;
      samples  : aliased Unsigned_16;
      padding  : aliased Unsigned_16;
      size     : aliased Unsigned_32;
      callback : SDL_AudioCallback;
      userdata : System.Address;
   end record
     with Convention => C_Pass_By_Copy;

   type SDL_AudioCVT;
   type SDL_AudioFilter is access procedure
     (cvt : access SDL_AudioCVT; format : SDL_AudioFormat)
     with Convention => C;

   type SDL_AudioFilter_Array is
     array (size_t range <>) of aliased SDL_AudioFilter;

   type SDL_AudioCVT is record
      needed       : aliased int;
      src_format   : aliased SDL_AudioFormat;
      dst_format   : aliased SDL_AudioFormat;
      rate_incr    : aliased double;
      buf          : access Unsigned_8;
      len          : aliased int;
      len_cvt      : aliased int;
      len_mult     : aliased int;
      len_ratio    : aliased double;
      filters      : aliased SDL_AudioFilter_Array (0 .. 9);
      filter_index : aliased int;
   end record
     with Convention => C_Pass_By_Copy;

   function SDL_GetNumAudioDrivers return int
     with Import, Convention => C, External_Name => "SDL_GetNumAudioDrivers";

   function SDL_GetAudioDriver (index : int) return chars_ptr
     with Import, Convention => C, External_Name => "SDL_GetAudioDriver";

   function SDL_AudioInit (driver_name : char_array) return int
     with Import, Convention => C, External_Name => "SDL_AudioInit";

   procedure SDL_AudioQuit
     with Import, Convention => C, External_Name => "SDL_AudioQuit";

   function SDL_GetCurrentAudioDriver return chars_ptr
     with Import, Convention => C, External_Name => "SDL_GetCurrentAudioDriver";

   function SDL_OpenAudio
     (desired  : access SDL_AudioSpec;
      obtained : access SDL_AudioSpec)
     return int
     with Import, Convention => C, External_Name => "SDL_OpenAudio";

   subtype SDL_AudioDeviceID is Unsigned_32;

   function SDL_GetNumAudioDevices (iscapture : int) return int
     with Import, Convention => C, External_Name => "SDL_GetNumAudioDevices";

   function SDL_GetAudioDeviceName
     (index     : int;
      iscapture : int)
     return chars_ptr
     with Import, Convention => C, External_Name => "SDL_GetAudioDeviceName";

   function SDL_OpenAudioDevice
     (device          : char_array;
      iscapture       : int;
      desired         : access constant SDL_AudioSpec;
      obtained        : access SDL_AudioSpec;
      allowed_changes : int)
     return SDL_AudioDeviceID
     with Import, Convention => C, External_Name => "SDL_OpenAudioDevice";

   type SDL_AudioStatus is
     (SDL_AUDIO_STOPPED,
      SDL_AUDIO_PLAYING,
      SDL_AUDIO_PAUSED)
     with Convention => C;

   function SDL_GetAudioStatus return SDL_AudioStatus
     with Import, Convention => C, External_Name => "SDL_GetAudioStatus";

   function SDL_GetAudioDeviceStatus
     (dev : SDL_AudioDeviceID) return SDL_AudioStatus
     with Import, Convention => C, External_Name => "SDL_GetAudioDeviceStatus";

   procedure SDL_PauseAudio (pause_on : int)
     with Import, Convention => C, External_Name => "SDL_PauseAudio";

   procedure SDL_PauseAudioDevice
     (dev : SDL_AudioDeviceID; pause_on : int)
     with Import, Convention => C, External_Name => "SDL_PauseAudioDevice";

   function SDL_LoadWAV_RW
     (src       : access SDL_RWops;
      freesrc   : int;
      spec      : access SDL_AudioSpec;
      audio_buf : System.Address;
      audio_len : access Unsigned_32)
     return access SDL_AudioSpec
     with Import, Convention => C, External_Name => "SDL_LoadWAV_RW";

   function SDL_LoadWAV
     (file      : char_array;
      spec      : access SDL_AudioSpec;
      audio_buf : System.Address;
      audio_len : access Unsigned_32)
     return access SDL_AudioSpec is
     (SDL_LoadWAV_RW (SDL_RWFromFile (file, "rb"), 1, spec, audio_buf, audio_len));

   procedure SDL_FreeWAV (audio_buf : access Unsigned_8)
     with Import, Convention => C, External_Name => "SDL_FreeWAV";

   function SDL_BuildAudioCVT
     (cvt          : access SDL_AudioCVT;
      src_format   : SDL_AudioFormat;
      src_channels : Unsigned_8;
      src_rate     : int;
      dst_format   : SDL_AudioFormat;
      dst_channels : Unsigned_8;
      dst_rate     : int)
     return int
     with Import, Convention => C, External_Name => "SDL_BuildAudioCVT";

   function SDL_ConvertAudio (cvt : access SDL_AudioCVT) return int
     with Import, Convention => C, External_Name => "SDL_ConvertAudio";

   type SDL_AudioStream is null record; -- incomplete type

   function SDL_NewAudioStream
     (src_format   : SDL_AudioFormat;
      src_channels : Unsigned_8;
      src_rate     : int;
      dst_format   : SDL_AudioFormat;
      dst_channels : Unsigned_8;
      dst_rate     : int)
     return access SDL_AudioStream
     with Import, Convention => C, External_Name => "SDL_NewAudioStream";

   function SDL_AudioStreamPut
     (stream : access SDL_AudioStream;
      buf    : System.Address;
      len    : int)
     return int
     with Import, Convention => C, External_Name => "SDL_AudioStreamPut";

   function SDL_AudioStreamGet
     (stream : access SDL_AudioStream;
      buf    : System.Address;
      len    : int)
     return int
     with Import, Convention => C, External_Name => "SDL_AudioStreamGet";

   function SDL_AudioStreamAvailable
     (stream : access SDL_AudioStream) return int
     with Import, Convention => C, External_Name => "SDL_AudioStreamAvailable";

   function SDL_AudioStreamFlush
     (stream : access SDL_AudioStream) return int
     with Import, Convention => C, External_Name => "SDL_AudioStreamFlush";

   procedure SDL_AudioStreamClear (stream : access SDL_AudioStream)
     with Import, Convention => C, External_Name => "SDL_AudioStreamClear";

   procedure SDL_FreeAudioStream (stream : access SDL_AudioStream)
     with Import, Convention => C, External_Name => "SDL_FreeAudioStream";

   procedure SDL_MixAudio
     (dst    : access Unsigned_8;
      src    : access Unsigned_8;
      len    : Unsigned_32;
      volume : int)
     with Import, Convention => C, External_Name => "SDL_MixAudio";

   procedure SDL_MixAudioFormat
     (dst    : access Unsigned_8;
      src    : access Unsigned_8;
      format : SDL_AudioFormat;
      len    : Unsigned_32;
      volume : int)
     with Import, Convention => C, External_Name => "SDL_MixAudioFormat";

   function SDL_QueueAudio
     (dev  : SDL_AudioDeviceID;
      data : System.Address;
      len  : Unsigned_32)
     return int
     with Import, Convention => C, External_Name => "SDL_QueueAudio";

   function SDL_DequeueAudio
     (dev  : SDL_AudioDeviceID;
      data : System.Address;
      len  : Unsigned_32)
     return Unsigned_32
     with Import, Convention => C, External_Name => "SDL_DequeueAudio";

   function SDL_GetQueuedAudioSize
     (dev : SDL_AudioDeviceID) return Unsigned_32
     with Import, Convention => C, External_Name => "SDL_GetQueuedAudioSize";

   procedure SDL_ClearQueuedAudio (dev : SDL_AudioDeviceID)
     with Import, Convention => C, External_Name => "SDL_ClearQueuedAudio";

   procedure SDL_LockAudio
     with Import, Convention => C, External_Name => "SDL_LockAudio";

   procedure SDL_LockAudioDevice (dev : SDL_AudioDeviceID)
     with Import, Convention => C, External_Name => "SDL_LockAudioDevice";

   procedure SDL_UnlockAudio
     with Import, Convention => C, External_Name => "SDL_UnlockAudio";

   procedure SDL_UnlockAudioDevice (dev : SDL_AudioDeviceID)
     with Import, Convention => C, External_Name => "SDL_UnlockAudioDevice";

   procedure SDL_CloseAudio
     with Import, Convention => C, External_Name => "SDL_CloseAudio";

   procedure SDL_CloseAudioDevice (dev : SDL_AudioDeviceID)
     with Import, Convention => C, External_Name => "SDL_CloseAudioDevice";

end SDL.Audio;
