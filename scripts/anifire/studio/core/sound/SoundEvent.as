package anifire.studio.core.sound
{
   import anifire.event.ExtraDataEvent;
   
   public class SoundEvent extends ExtraDataEvent
   {
      
      public static const READY_TO_PLAY:String = "ready_to_play";
      
      public static const PLAY_COMPLETE:String = "play_complete";
      
      public static const ADDED:String = "added";
      
      public static const REMOVED:String = "removed";
      
      public static const UPDATED:String = "updated";
      
      public static const PLAYED:String = "PLAYED";
      
      public static const STOPPED:String = "STOPPED";
      
      public static const SOUND_LOADED:String = "SOUND_LOADED";
      
      public static const ON_PROGRESS:String = "onProgress";
      
      public static const WAVEFORM_LOADED:String = "WAVEFORM_LOADED";
      
      public static const WAVEFORM_LOAD_ERROR:String = "waveformLoadError";
       
      
      public var sceneId:String;
      
      public var soundId:String;
      
      public var progress:Number;
      
      public function SoundEvent(param1:String, param2:Object, param3:Object = null, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param2,param3,param4,param5);
      }
   }
}
