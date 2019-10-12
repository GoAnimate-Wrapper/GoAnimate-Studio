package anifire.studio.core.sound
{
   import flash.events.Event;
   
   public class AnimeSoundEvent extends Event
   {
      
      public static const VOLUME_CHANGE:String = "volumeChange";
      
      public static const START_FRAME_CHANGE:String = "startFrameChange";
      
      public static const TOTAL_FRAME_CHANGE:String = "totalFrameChange";
      
      public static const DEFAULT_TOTAL_FRAME_CHANGE:String = "defaultTotalFrameChange";
      
      public static const TRIMMED_START_FRAME_CHANGE:String = "trimmedStartFrameChange";
      
      public static const TRIMMED_END_FRAME_CHANGE:String = "trimmedEndFrameChange";
      
      public static const TRACK_CHANGE:String = "trackChange";
      
      public static const SCENE_ATTACHMENT_CHANGE:String = "sceneAttachmentChange";
      
      public static const WAVEFORM_DELAY_CHANGE:String = "waveformDelayChange";
      
      public static const SOUND_THUMB_CHANGE:String = "soundThumbChange";
      
      public static const OVERLAP_CHANGE:String = "overlapChange";
      
      public static const FADING_CHANGE:String = "fadingChange";
       
      
      public function AnimeSoundEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}
