package anifire.event
{
   public class AVM1SoundEvent extends ExtraDataEvent
   {
      
      public static const SOUND_COMPLETE:String = "soundComplete";
      
      public static const SOUND_INIT_COMPLETE:String = "soundInitComplete";
      
      public static const SOUND_DURATION_RECEIVE:String = "soundDurationReceive";
       
      
      public function AVM1SoundEvent(param1:String, param2:Object, param3:Object = null, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param2,param3,param4,param5);
      }
   }
}
