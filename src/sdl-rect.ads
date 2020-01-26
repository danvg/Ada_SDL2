package SDL.Rect is

   type SDL_Point is record
      x : aliased int;
      y : aliased int;
   end record
     with Convention => C_Pass_By_Copy;

   type SDL_FPoint is record
      x : aliased float;
      y : aliased float;
   end record
     with Convention => C_Pass_By_Copy;

   type SDL_Rect is record
      x : aliased int;
      y : aliased int;
      w : aliased int;
      h : aliased int;
   end record
     with Convention => C_Pass_By_Copy;

   type SDL_FRect is record
      x : aliased float;
      y : aliased float;
      w : aliased float;
      h : aliased float;
   end record
     with Convention => C_Pass_By_Copy;

   function SDL_PointInRect (p : SDL_Point; r : SDL_Rect) return SDL_bool is
     (if (p.x >= r.x and then p.x <= (r.x + r.w)
      and then p.y >= r.y and then p.y <= (r.y + r.h))
      then SDL_TRUE else SDL_FALSE);

   function SDL_RectEmpty (r : SDL_Rect) return SDL_bool is
     (if (r.w <= 0 or else r.h <= 0) then SDL_TRUE else SDL_FALSE);

   function SDL_RectEquals (a, b : SDL_Rect) return SDL_bool is
     (if a = b then SDL_TRUE else SDL_FALSE);

   function SDL_HasIntersection
     (A, B : access constant SDL_Rect) return SDL_bool
     with Import, Convention => C, External_Name => "SDL_HasIntersection";

   function SDL_IntersectRect
     (A, B   : access constant SDL_Rect;
      result : access SDL_Rect) return SDL_bool
     with Import, Convention => C, External_Name => "SDL_IntersectRect";

   procedure SDL_UnionRect
     (A, B   : access constant SDL_Rect;
      result : access SDL_Rect)
     with Import, Convention => C, External_Name => "SDL_UnionRect";

   function SDL_EnclosePoints
     (points : access constant SDL_Point;
      count  : int;
      clip   : access constant SDL_Rect;
      result : access SDL_Rect) return SDL_bool
     with Import, Convention => C, External_Name => "SDL_EnclosePoints";

   function SDL_IntersectRectAndLine
     (rect : access constant SDL_Rect;
      X1   : access int;
      Y1   : access int;
      X2   : access int;
      Y2   : access int) return SDL_bool
     with Import, Convention => C, External_Name => "SDL_IntersectRectAndLine";

end SDL.Rect;
