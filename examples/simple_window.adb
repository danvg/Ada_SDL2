with SDL;        use SDL;
with SDL.Video;  use SDL.Video;
with SDL.Events; use SDL.Events;
with SDL.Error;  use SDL.Error;

with Interfaces;           use Interfaces;
with Interfaces.C;         use Interfaces.C;
with Interfaces.C.Strings; use Interfaces.C.Strings;

procedure Simple_Window is

   Window : access SDL_Window := null;
   Event  : aliased SDL_Event;
   Flags  : constant Unsigned_32 := SDL_WINDOW_SHOWN or
                                    SDL_WINDOW_ALLOW_HIGHDPI or
                                    SDL_WINDOW_OPENGL;

begin

   if SDL_Init (SDL_INIT_VIDEO) < 0 then
      raise Program_Error with Value (SDL_GetError);
   end if;

   Window := SDL_CreateWindow (To_C ("Ada SDL2"),
                               SDL_WINDOWPOS_CENTERED,
                               SDL_WINDOWPOS_CENTERED,
                               800, 600,
                               Flags);
   if Window = null then
      SDL.SDL_Quit;
      raise Program_Error with Value (SDL_GetError);
   end if;

   Main_Loop : loop

      while SDL_PollEvent (Event'Access) = 1 loop
         case Event.c_type is
            when SDL.Events.SDL_QUIT =>
               exit Main_Loop;
            when others =>
               null;
         end case;
         delay 0.0001;
      end loop;

   end loop Main_Loop;

   SDL.SDL_Quit;

end Simple_Window;
