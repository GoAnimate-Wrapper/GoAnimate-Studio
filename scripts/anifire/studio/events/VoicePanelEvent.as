package anifire.studio.events
{
   import flash.events.Event;
   
   public class VoicePanelEvent extends Event
   {
      
      public static const EDIT_VOICE:String = "editVoice";
      
      public static const PLAY_VOICE:String = "playVoice";
      
      public static const STOP_VOICE:String = "stopVoice";
      
      public static const DELETE_VOICE:String = "deleteVoice";
       
      
      public function VoicePanelEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}
