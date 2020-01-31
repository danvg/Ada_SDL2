with Interfaces;
with Interfaces.C;
with SDL;
with SDL.Video;
with SDL.Events;
with SDL.Keycode;
with SDL.Log;

procedure Test_Touch is

   use SDL, SDL.Log, SDL.Video, SDL.Events, SDL.Keycode;
   use Interfaces.C;
   use type Interfaces.Integer_32;

   procedure Print (X : SDL_TouchFingerEvent_Data) is
   begin
      SDL_Log (To_C ("Touch ID  : " & X.touchId'Img));
      SDL_Log (To_C ("Finger ID : " & X.fingerId'Img));
      SDL_Log (To_C ("X         : " & X.x'Img));
      SDL_Log (To_C ("Y         : " & X.y'Img));
      SDL_Log (To_C ("dX        : " & X.dx'Img));
      SDL_Log (To_C ("dY        : " & X.dy'Img));
      SDL_Log (To_C ("Pressure  : " & X.pressure'Img));
   end Print;

   Should_Exit : Boolean := False;
   Event : aliased SDL_Event;
   Window : access SDL_Window;

begin

   if SDL_Init (SDL_INIT_VIDEO) < 0 then
      SDL_Log (To_C ("Failed to initialize SDL"));
      return;
   end if;

   Window := SDL_CreateWindow (To_C ("SDL2 Window"),
                               SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED,
                               640, 480,
                               SDL_WINDOW_SHOWN);

   if Window = null then
      SDL_Log (To_C ("Failed to create window"));
      SDL.SDL_Quit;
      return;
   end if;

   while not Should_Exit loop

      if SDL_WaitEvent(Event'Access) = 1 then
         case Event.c_type is
            when SDL.Events.SDL_QUIT =>
               Should_Exit := true;
            when SDL_KEYDOWN =>
               if Event.key.keysym.sym = SDLK_Q then
                  Should_Exit := true;
               end if;
            when SDL_FINGERMOTION | SDL_FINGERDOWN | SDL_FINGERUP =>
               Print (Event.tfinger);
            when others =>
               null;
         end case;
      end if;

   end loop;

   SDL_DestroyWindow (Window);
   SDL.SDL_Quit;

end Test_Touch;
