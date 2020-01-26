package SDL.BlendMode is

   type SDL_BlendMode is
     (SDL_BLENDMODE_NONE,
      SDL_BLENDMODE_BLEND,
      SDL_BLENDMODE_ADD,
      SDL_BLENDMODE_MOD,
      SDL_BLENDMODE_INVALID)
     with Convention => C;

   for SDL_BlendMode use
     (SDL_BLENDMODE_NONE    => 0,
      SDL_BLENDMODE_BLEND   => 1,
      SDL_BLENDMODE_ADD     => 2,
      SDL_BLENDMODE_MOD     => 4,
      SDL_BLENDMODE_INVALID => 2147483647);

   type SDL_BlendOperation is
     (SDL_BLENDOPERATION_ADD,
      SDL_BLENDOPERATION_SUBTRACT,
      SDL_BLENDOPERATION_REV_SUBTRACT,
      SDL_BLENDOPERATION_MINIMUM,
      SDL_BLENDOPERATION_MAXIMUM)
     with Convention => C;

   for SDL_BlendOperation use
     (SDL_BLENDOPERATION_ADD          => 1,
      SDL_BLENDOPERATION_SUBTRACT     => 2,
      SDL_BLENDOPERATION_REV_SUBTRACT => 3,
      SDL_BLENDOPERATION_MINIMUM      => 4,
      SDL_BLENDOPERATION_MAXIMUM      => 5);

   type SDL_BlendFactor is
     (SDL_BLENDFACTOR_ZERO,
      SDL_BLENDFACTOR_ONE,
      SDL_BLENDFACTOR_SRC_COLOR,
      SDL_BLENDFACTOR_ONE_MINUS_SRC_COLOR,
      SDL_BLENDFACTOR_SRC_ALPHA,
      SDL_BLENDFACTOR_ONE_MINUS_SRC_ALPHA,
      SDL_BLENDFACTOR_DST_COLOR,
      SDL_BLENDFACTOR_ONE_MINUS_DST_COLOR,
      SDL_BLENDFACTOR_DST_ALPHA,
      SDL_BLENDFACTOR_ONE_MINUS_DST_ALPHA)
     with Convention => C;

   for SDL_BlendFactor use
     (SDL_BLENDFACTOR_ZERO                => 1,
      SDL_BLENDFACTOR_ONE                 => 2,
      SDL_BLENDFACTOR_SRC_COLOR           => 3,
      SDL_BLENDFACTOR_ONE_MINUS_SRC_COLOR => 4,
      SDL_BLENDFACTOR_SRC_ALPHA           => 5,
      SDL_BLENDFACTOR_ONE_MINUS_SRC_ALPHA => 6,
      SDL_BLENDFACTOR_DST_COLOR           => 7,
      SDL_BLENDFACTOR_ONE_MINUS_DST_COLOR => 8,
      SDL_BLENDFACTOR_DST_ALPHA           => 9,
      SDL_BLENDFACTOR_ONE_MINUS_DST_ALPHA => 10);

   function SDL_ComposeCustomBlendMode
     (srcColorFactor : SDL_BlendFactor;
      dstColorFactor : SDL_BlendFactor;
      colorOperation : SDL_BlendOperation;
      srcAlphaFactor : SDL_BlendFactor;
      dstAlphaFactor : SDL_BlendFactor;
      alphaOperation : SDL_BlendOperation) return SDL_BlendMode
     with Import, Convention => C, External_Name => "SDL_ComposeCustomBlendMode";

end SDL.BlendMode;
