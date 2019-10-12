package anifire.studio.core.sound
{
   import anifire.studio.core.SoundThumb;
   import flash.events.Event;
   
   public class SoundThumbEvent extends Event
   {
      
      public static const SOUND_CREATED:String = "SOUND_CREATED";
       
      
      public var soundThumb:SoundThumb;
      
      public var volume:Number = 1;
      
      public function SoundThumbEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}
