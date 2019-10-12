package anifire.event
{
   import flash.events.Event;
   
   public class StudioEvent extends Event
   {
      
      public static const BODY_MODEL_COMPLETE:String = "bodyModelComplete";
      
      public static const LOAD_THEME_ERROR:String = "loadThemeError";
      
      public static const UPGRADE_PENDING:String = "upgradePending";
      
      public static const UPGRADE_COMPLETE:String = "upgradeComplete";
      
      public static const UPGRADE_ERROR:String = "upgradeError";
      
      public static const POPUP_CONFIRM:String = "popupConfirm";
      
      public static const SELECT_SCENE_FROM_NOTE:String = "selectSceneFromNote";
      
      public static const HEARTBEAT_TAKEOVER:String = "heartbeatTakeover";
      
      public static const HEARTBEAT_LOST:String = "heartbeatLost";
      
      public static const WORK_NOTE_VISIBILITY_CHANGE:String = "workNoteVisibilityChange";
      
      public static const OPEN_YOUR_LIBRARY:String = "openYourLibrary";
      
      public static const CLOSE_SUGGESTION_POP_UP:String = "closeSuggestionPopUp";
       
      
      public var data;
      
      public function StudioEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}
