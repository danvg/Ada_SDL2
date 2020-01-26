package SDL.Hints is

   SDL_HINT_FRAMEBUFFER_ACCELERATION : aliased constant String := "SDL_FRAMEBUFFER_ACCELERATION" & ASCII.NUL;
   SDL_HINT_RENDER_DRIVER : aliased constant String := "SDL_RENDER_DRIVER" & ASCII.NUL;
   SDL_HINT_RENDER_OPENGL_SHADERS : aliased constant String := "SDL_RENDER_OPENGL_SHADERS" & ASCII.NUL;
   SDL_HINT_RENDER_DIRECT3D_THREADSAFE : aliased constant String := "SDL_RENDER_DIRECT3D_THREADSAFE" & ASCII.NUL;
   SDL_HINT_RENDER_DIRECT3D11_DEBUG : aliased constant String := "SDL_RENDER_DIRECT3D11_DEBUG" & ASCII.NUL;
   SDL_HINT_RENDER_LOGICAL_SIZE_MODE : aliased constant String := "SDL_RENDER_LOGICAL_SIZE_MODE" & ASCII.NUL;
   SDL_HINT_RENDER_SCALE_QUALITY : aliased constant String := "SDL_RENDER_SCALE_QUALITY" & ASCII.NUL;
   SDL_HINT_RENDER_VSYNC : aliased constant String := "SDL_RENDER_VSYNC" & ASCII.NUL;
   SDL_HINT_VIDEO_ALLOW_SCREENSAVER : aliased constant String := "SDL_VIDEO_ALLOW_SCREENSAVER" & ASCII.NUL;
   SDL_HINT_VIDEO_X11_XVIDMODE : aliased constant String := "SDL_VIDEO_X11_XVIDMODE" & ASCII.NUL;
   SDL_HINT_VIDEO_X11_XINERAMA : aliased constant String := "SDL_VIDEO_X11_XINERAMA" & ASCII.NUL;
   SDL_HINT_VIDEO_X11_XRANDR : aliased constant String := "SDL_VIDEO_X11_XRANDR" & ASCII.NUL;
   SDL_HINT_VIDEO_X11_NET_WM_PING : aliased constant String := "SDL_VIDEO_X11_NET_WM_PING" & ASCII.NUL;
   SDL_HINT_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR : aliased constant String := "SDL_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR" & ASCII.NUL;
   SDL_HINT_WINDOW_FRAME_USABLE_WHILE_CURSOR_HIDDEN : aliased constant String := "SDL_WINDOW_FRAME_USABLE_WHILE_CURSOR_HIDDEN" & ASCII.NUL;
   SDL_HINT_WINDOWS_INTRESOURCE_ICON : aliased constant String := "SDL_WINDOWS_INTRESOURCE_ICON" & ASCII.NUL;
   SDL_HINT_WINDOWS_INTRESOURCE_ICON_SMALL : aliased constant String := "SDL_WINDOWS_INTRESOURCE_ICON_SMALL" & ASCII.NUL;
   SDL_HINT_WINDOWS_ENABLE_MESSAGELOOP : aliased constant String := "SDL_WINDOWS_ENABLE_MESSAGELOOP" & ASCII.NUL;
   SDL_HINT_GRAB_KEYBOARD : aliased constant String := "SDL_GRAB_KEYBOARD" & ASCII.NUL;
   SDL_HINT_MOUSE_DOUBLE_CLICK_TIME : aliased constant String := "SDL_MOUSE_DOUBLE_CLICK_TIME" & ASCII.NUL;
   SDL_HINT_MOUSE_DOUBLE_CLICK_RADIUS : aliased constant String := "SDL_MOUSE_DOUBLE_CLICK_RADIUS" & ASCII.NUL;
   SDL_HINT_MOUSE_NORMAL_SPEED_SCALE : aliased constant String := "SDL_MOUSE_NORMAL_SPEED_SCALE" & ASCII.NUL;
   SDL_HINT_MOUSE_RELATIVE_SPEED_SCALE : aliased constant String := "SDL_MOUSE_RELATIVE_SPEED_SCALE" & ASCII.NUL;
   SDL_HINT_MOUSE_RELATIVE_MODE_WARP : aliased constant String := "SDL_MOUSE_RELATIVE_MODE_WARP" & ASCII.NUL;
   SDL_HINT_MOUSE_FOCUS_CLICKTHROUGH : aliased constant String := "SDL_MOUSE_FOCUS_CLICKTHROUGH" & ASCII.NUL;
   SDL_HINT_TOUCH_MOUSE_EVENTS : aliased constant String := "SDL_TOUCH_MOUSE_EVENTS" & ASCII.NUL;
   SDL_HINT_MOUSE_TOUCH_EVENTS : aliased constant String := "SDL_MOUSE_TOUCH_EVENTS" & ASCII.NUL;
   SDL_HINT_VIDEO_MINIMIZE_ON_FOCUS_LOSS : aliased constant String := "SDL_VIDEO_MINIMIZE_ON_FOCUS_LOSS" & ASCII.NUL;
   SDL_HINT_IDLE_TIMER_DISABLED : aliased constant String := "SDL_IOS_IDLE_TIMER_DISABLED" & ASCII.NUL;
   SDL_HINT_ORIENTATIONS : aliased constant String := "SDL_IOS_ORIENTATIONS" & ASCII.NUL;
   SDL_HINT_APPLE_TV_CONTROLLER_UI_EVENTS : aliased constant String := "SDL_APPLE_TV_CONTROLLER_UI_EVENTS" & ASCII.NUL;
   SDL_HINT_APPLE_TV_REMOTE_ALLOW_ROTATION : aliased constant String := "SDL_APPLE_TV_REMOTE_ALLOW_ROTATION" & ASCII.NUL;
   SDL_HINT_IOS_HIDE_HOME_INDICATOR : aliased constant String := "SDL_IOS_HIDE_HOME_INDICATOR" & ASCII.NUL;
   SDL_HINT_ACCELEROMETER_AS_JOYSTICK : aliased constant String := "SDL_ACCELEROMETER_AS_JOYSTICK" & ASCII.NUL;
   SDL_HINT_TV_REMOTE_AS_JOYSTICK : aliased constant String := "SDL_TV_REMOTE_AS_JOYSTICK" & ASCII.NUL;
   SDL_HINT_XINPUT_ENABLED : aliased constant String := "SDL_XINPUT_ENABLED" & ASCII.NUL;
   SDL_HINT_XINPUT_USE_OLD_JOYSTICK_MAPPING : aliased constant String := "SDL_XINPUT_USE_OLD_JOYSTICK_MAPPING" & ASCII.NUL;
   SDL_HINT_GAMECONTROLLERCONFIG : aliased constant String := "SDL_GAMECONTROLLERCONFIG" & ASCII.NUL;
   SDL_HINT_GAMECONTROLLERCONFIG_FILE : aliased constant String := "SDL_GAMECONTROLLERCONFIG_FILE" & ASCII.NUL;
   SDL_HINT_GAMECONTROLLER_IGNORE_DEVICES : aliased constant String := "SDL_GAMECONTROLLER_IGNORE_DEVICES" & ASCII.NUL;
   SDL_HINT_GAMECONTROLLER_IGNORE_DEVICES_EXCEPT : aliased constant String := "SDL_GAMECONTROLLER_IGNORE_DEVICES_EXCEPT" & ASCII.NUL;
   SDL_HINT_JOYSTICK_ALLOW_BACKGROUND_EVENTS : aliased constant String := "SDL_JOYSTICK_ALLOW_BACKGROUND_EVENTS" & ASCII.NUL;
   SDL_HINT_JOYSTICK_HIDAPI : aliased constant String := "SDL_JOYSTICK_HIDAPI" & ASCII.NUL;
   SDL_HINT_JOYSTICK_HIDAPI_PS4 : aliased constant String := "SDL_JOYSTICK_HIDAPI_PS4" & ASCII.NUL;
   SDL_HINT_JOYSTICK_HIDAPI_PS4_RUMBLE : aliased constant String := "SDL_JOYSTICK_HIDAPI_PS4_RUMBLE" & ASCII.NUL;
   SDL_HINT_JOYSTICK_HIDAPI_STEAM : aliased constant String := "SDL_JOYSTICK_HIDAPI_STEAM" & ASCII.NUL;
   SDL_HINT_JOYSTICK_HIDAPI_SWITCH : aliased constant String := "SDL_JOYSTICK_HIDAPI_SWITCH" & ASCII.NUL;
   SDL_HINT_JOYSTICK_HIDAPI_XBOX : aliased constant String := "SDL_JOYSTICK_HIDAPI_XBOX" & ASCII.NUL;
   SDL_HINT_ENABLE_STEAM_CONTROLLERS : aliased constant String := "SDL_ENABLE_STEAM_CONTROLLERS" & ASCII.NUL;
   SDL_HINT_ALLOW_TOPMOST : aliased constant String := "SDL_ALLOW_TOPMOST" & ASCII.NUL;
   SDL_HINT_TIMER_RESOLUTION : aliased constant String := "SDL_TIMER_RESOLUTION" & ASCII.NUL;
   SDL_HINT_QTWAYLAND_CONTENT_ORIENTATION : aliased constant String := "SDL_QTWAYLAND_CONTENT_ORIENTATION" & ASCII.NUL;
   SDL_HINT_QTWAYLAND_WINDOW_FLAGS : aliased constant String := "SDL_QTWAYLAND_WINDOW_FLAGS" & ASCII.NUL;
   SDL_HINT_THREAD_STACK_SIZE : aliased constant String := "SDL_THREAD_STACK_SIZE" & ASCII.NUL;
   SDL_HINT_VIDEO_HIGHDPI_DISABLED : aliased constant String := "SDL_VIDEO_HIGHDPI_DISABLED" & ASCII.NUL;
   SDL_HINT_MAC_CTRL_CLICK_EMULATE_RIGHT_CLICK : aliased constant String := "SDL_MAC_CTRL_CLICK_EMULATE_RIGHT_CLICK" & ASCII.NUL;
   SDL_HINT_VIDEO_WIN_D3DCOMPILER : aliased constant String := "SDL_VIDEO_WIN_D3DCOMPILER" & ASCII.NUL;
   SDL_HINT_VIDEO_WINDOW_SHARE_PIXEL_FORMAT : aliased constant String := "SDL_VIDEO_WINDOW_SHARE_PIXEL_FORMAT" & ASCII.NUL;
   SDL_HINT_WINRT_PRIVACY_POLICY_URL : aliased constant String := "SDL_WINRT_PRIVACY_POLICY_URL" & ASCII.NUL;
   SDL_HINT_WINRT_PRIVACY_POLICY_LABEL : aliased constant String := "SDL_WINRT_PRIVACY_POLICY_LABEL" & ASCII.NUL;
   SDL_HINT_WINRT_HANDLE_BACK_BUTTON : aliased constant String := "SDL_WINRT_HANDLE_BACK_BUTTON" & ASCII.NUL;
   SDL_HINT_VIDEO_MAC_FULLSCREEN_SPACES : aliased constant String := "SDL_VIDEO_MAC_FULLSCREEN_SPACES" & ASCII.NUL;
   SDL_HINT_MAC_BACKGROUND_APP : aliased constant String := "SDL_MAC_BACKGROUND_APP" & ASCII.NUL;
   SDL_HINT_ANDROID_APK_EXPANSION_MAIN_FILE_VERSION : aliased constant String := "SDL_ANDROID_APK_EXPANSION_MAIN_FILE_VERSION" & ASCII.NUL;
   SDL_HINT_ANDROID_APK_EXPANSION_PATCH_FILE_VERSION : aliased constant String := "SDL_ANDROID_APK_EXPANSION_PATCH_FILE_VERSION" & ASCII.NUL;
   SDL_HINT_IME_INTERNAL_EDITING : aliased constant String := "SDL_IME_INTERNAL_EDITING" & ASCII.NUL;
   SDL_HINT_ANDROID_TRAP_BACK_BUTTON : aliased constant String := "SDL_ANDROID_TRAP_BACK_BUTTON" & ASCII.NUL;
   SDL_HINT_ANDROID_BLOCK_ON_PAUSE : aliased constant String := "SDL_ANDROID_BLOCK_ON_PAUSE" & ASCII.NUL;
   SDL_HINT_RETURN_KEY_HIDES_IME : aliased constant String := "SDL_RETURN_KEY_HIDES_IME" & ASCII.NUL;
   SDL_HINT_EMSCRIPTEN_KEYBOARD_ELEMENT : aliased constant String := "SDL_EMSCRIPTEN_KEYBOARD_ELEMENT" & ASCII.NUL;
   SDL_HINT_NO_SIGNAL_HANDLERS : aliased constant String := "SDL_NO_SIGNAL_HANDLERS" & ASCII.NUL;
   SDL_HINT_WINDOWS_NO_CLOSE_ON_ALT_F4 : aliased constant String := "SDL_WINDOWS_NO_CLOSE_ON_ALT_F4" & ASCII.NUL;
   SDL_HINT_BMP_SAVE_LEGACY_FORMAT : aliased constant String := "SDL_BMP_SAVE_LEGACY_FORMAT" & ASCII.NUL;
   SDL_HINT_WINDOWS_DISABLE_THREAD_NAMING : aliased constant String := "SDL_WINDOWS_DISABLE_THREAD_NAMING" & ASCII.NUL;
   SDL_HINT_RPI_VIDEO_LAYER : aliased constant String := "SDL_RPI_VIDEO_LAYER" & ASCII.NUL;
   SDL_HINT_VIDEO_DOUBLE_BUFFER : aliased constant String := "SDL_VIDEO_DOUBLE_BUFFER" & ASCII.NUL;
   SDL_HINT_OPENGL_ES_DRIVER : aliased constant String := "SDL_OPENGL_ES_DRIVER" & ASCII.NUL;
   SDL_HINT_AUDIO_RESAMPLING_MODE : aliased constant String := "SDL_AUDIO_RESAMPLING_MODE" & ASCII.NUL;
   SDL_HINT_AUDIO_CATEGORY : aliased constant String := "SDL_AUDIO_CATEGORY" & ASCII.NUL;
   SDL_HINT_RENDER_BATCHING : aliased constant String := "SDL_RENDER_BATCHING" & ASCII.NUL;
   SDL_HINT_EVENT_LOGGING : aliased constant String := "SDL_EVENT_LOGGING" & ASCII.NUL;
   SDL_HINT_WAVE_RIFF_CHUNK_SIZE : aliased constant String := "SDL_WAVE_RIFF_CHUNK_SIZE" & ASCII.NUL;
   SDL_HINT_WAVE_TRUNCATION : aliased constant String := "SDL_WAVE_TRUNCATION" & ASCII.NUL;
   SDL_HINT_WAVE_FACT_CHUNK : aliased constant String := "SDL_WAVE_FACT_CHUNK" & ASCII.NUL;

   type SDL_HintPriority is
     (SDL_HINT_DEFAULT,
      SDL_HINT_NORMAL,
      SDL_HINT_OVERRIDE)
     with Convention => C;

   function SDL_SetHintWithPriority
     (name, value : char_array; priority : SDL_HintPriority) return SDL_bool
     with Import, Convention => C, External_Name => "SDL_SetHintWithPriority";

   function SDL_SetHint (name, value : char_array) return SDL_bool
     with Import, Convention => C, External_Name => "SDL_SetHint";

   function SDL_GetHint (name : char_array) return chars_ptr
     with Import, Convention => C, External_Name => "SDL_GetHint";

   function SDL_GetHintBoolean
     (name : char_array; default_value : SDL_bool) return SDL_bool
     with Import, Convention => C, External_Name => "SDL_GetHintBoolean";

   type SDL_HintCallback is access procedure
     (userdata : System.Address;
      name     : chars_ptr;
      oldValue : chars_ptr;
      newValue : chars_ptr)
     with Convention => C;

   procedure SDL_AddHintCallback
     (name     : char_array;
      callback : SDL_HintCallback;
      userdata : System.Address)
     with Import, Convention => C, External_Name => "SDL_AddHintCallback";

   procedure SDL_DelHintCallback
     (name     : char_array;
      callback : SDL_HintCallback;
      userdata : System.Address)
     with Import, Convention => C, External_Name => "SDL_DelHintCallback";

   procedure SDL_ClearHints
     with Import, Convention => C, External_Name => "SDL_ClearHints";

end SDL.Hints;
