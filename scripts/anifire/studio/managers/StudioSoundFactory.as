package anifire.studio.managers
{
   import anifire.studio.core.AnimeSound;
   import anifire.studio.core.SoundThumb;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   
   public class StudioSoundFactory extends EventDispatcher
   {
       
      
      public function StudioSoundFactory(param1:IEventDispatcher = null)
      {
         super(param1);
      }
      
      public static function createSound(param1:SoundThumb) : AnimeSound
      {
         var _loc2_:AnimeSound = new AnimeSound();
         return _loc2_;
      }
   }
}
