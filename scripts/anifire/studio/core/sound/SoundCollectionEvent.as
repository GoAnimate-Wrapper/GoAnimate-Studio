package anifire.studio.core.sound
{
   import flash.events.Event;
   
   public class SoundCollectionEvent extends Event
   {
      
      public static const SOUND_ADDED:String = "soundAdded";
      
      public static const SOUND_REMOVED:String = "soundRemoved";
      
      public static const SOUND_MOVED:String = "soundMoved";
       
      
      public function SoundCollectionEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}
