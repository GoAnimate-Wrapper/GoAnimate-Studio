package anifire.managers
{
   import flash.external.ExternalInterface;
   
   public class AmplitudeAnalyticsManager
   {
      
      public static const EVENT_PROPERTIES_FAVORITE:String = "favorite";
      
      public static const EVENT_PROPERTIES_UNFAVORITE:String = "un-favorite";
      
      public static const EVENT_PROPERTIES_PARTIAL_PREVIEW:String = "partial";
      
      public static const EVENT_PROPERTIES_NUM_SCENES:String = "scenes";
      
      public static const EVENT_PROPERTIES_NUM_MODIFIED_SCENES:String = "scenes_modified";
      
      public static const EVENT_PROPERTIES_NUM_FRAMES:String = "frames";
      
      public static const EVENT_PROPERTIES_NUM_MODIFIED_FRAMES:String = "frames_modified";
      
      public static const EVENT_PROPERTIES_MOVIE_ID:String = "movie";
      
      public static const EVENT_PROPERTIES_EMBED_VIDEO_ID:String = "embedded_video";
      
      public static const EVENT_PROPERTIES_OWNER_ID:String = "owner";
      
      public static const EVENT_PROPERTIES_TOOLTIP_ADD_SCENE:String = "adding_scenes";
      
      public static const EVENT_PROPERTIES_TOOLTIP_USE_TEMPLATE:String = "using_templates";
      
      public static const EVENT_PROPERTIES_TOOLTIP_CUSTOMIZATION:String = "customization";
      
      public static const EVENT_PROPERTIES_TRIGGER_MANUAL:String = "manual";
      
      public static const EVENT_PROPERTIES_TRIGGER_AUTO:String = "auto";
      
      public static const EVENT_PROPERTIES_TUTORIAL:String = "tutorial";
      
      public static const EVENT_NAME_CREATED_CHARACTER:String = "Created character";
      
      public static const EVENT_NAME_SAVED_STARTER:String = "Saved starter";
      
      public static const EVENT_NAME_SAVED_VIDEO:String = "Saved video";
      
      public static const EVENT_NAME_CHOSE_TEMPLATE_CATEGORY:String = "Chose template category";
      
      public static const EVENT_NAME_FAVORITED_TEMPLATE_CATEGORY:String = "Favorited template category";
      
      public static const EVENT_NAME_SWAPPED_ASSET:String = "Swapped asset";
      
      public static const EVENT_NAME_BEGIN_TUTORIAL:String = "Begin Tutorial";
      
      public static const EVENT_NAME_SKIP_TUTORIAL:String = "Skip Tutorial";
      
      public static const EVENT_NAME_COMPLETED_TUTORIAL:String = "Completed Tutorial";
      
      public static const EVENT_NAME_PREVIEW_VIDEO:String = "Preview video";
      
      public static const EVENT_NAME_ADD_SCENE:String = "Add scene";
      
      public static const EVENT_NAME_SWITCH_CHAR_ACTION:String = "Switch character action";
      
      public static const EVENT_NAME_ADD_VOICE_TO_SCENE:String = "Add voice to scene";
      
      public static const EVENT_NAME_ADD_ASSET_TO_STAGE:String = "Add asset to stage";
      
      public static const EVENT_NAME_TOGGLE_ATTACH_VOICE_TO_STAGE:String = "Toggle attach voice to scene";
      
      public static const EVENT_NAME_ADD_SCENE_TEMPLATE:String = "Add a scene template";
      
      public static const EVENT_NAME_SEARCH_ASSETS_TEMPLATES:String = "Search assets or templates";
      
      public static const EVENT_NAME_PLAY_VIDEO:String = "Plays video";
      
      public static const EVENT_NAME_TOGGLE_FULLSCREEN:String = "Toggle fullscreen";
      
      public static const EVENT_NAME_WATCH_EMBED_VIDEO:String = "Watched embedded video";
      
      public static const EVENT_NAME_CLOSE_TUTORIAL_TOOLTIP:String = "Close tutorial tooltip";
      
      public static const EVENT_NAME_DELETE_SCENE:String = "Delete a scene";
      
      public static const EVENT_NAME_FONT_MIX:String = "Font mix";
      
      public static const EVENT_NAME_FONT_CHECK:String = "Font check";
      
      private static var __instance:AmplitudeAnalyticsManager;
       
      
      public function AmplitudeAnalyticsManager()
      {
         super();
      }
      
      public static function get instance() : AmplitudeAnalyticsManager
      {
         if(!__instance)
         {
            __instance = new AmplitudeAnalyticsManager();
         }
         return __instance;
      }
      
      public function incrementUserProperty(param1:String, param2:int) : void
      {
         if(ExternalInterface.available)
         {
            ExternalInterface.call("amplitudeIncrementUserProperty",param1,param2);
         }
      }
      
      public function log(param1:String, param2:Object = null, param3:Object = null) : void
      {
         if(ExternalInterface.available)
         {
            ExternalInterface.call("logAmplitudeEvent",param1,param2,param3);
         }
      }
   }
}
