package anifire.event
{
   public class VideoNetStreamEvent extends ExtraDataEvent
   {
      
      public static const VIDEO_START_TO_PLAY:String = "video_start_to_play";
       
      
      public var playhead:Number;
      
      public function VideoNetStreamEvent(param1:String, param2:Object, param3:Object = null, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param2,param3,param4,param5);
      }
   }
}
