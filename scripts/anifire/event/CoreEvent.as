package anifire.event
{
   public class CoreEvent extends ExtraDataEvent
   {
      
      public static const LOAD_ASSET_COMPLETE:String = "load_asset_complete";
      
      public static const ADD_ASSET_COMPLETE:String = "add_asset_complete";
      
      public static const LOAD_THUMB_COMPLETE:String = "load_thumb_complete";
      
      public static const LOAD_STATE_COMPLETE:String = "load_state_complete";
      
      public static const LOAD_THEME_COMPLETE:String = "load_theme_complete";
      
      public static const ADDED_TO_STAGE_BY_TIMER:String = "addedToStageByTimer";
      
      public static const LOAD_ALL_THEME_COMPLETE:String = "loadAllThemeComplete";
      
      public static const LOAD_MOVIE_ASSET_COMPLETE:String = "load_movie_asset_complete";
      
      public static const LOAD_CC_CHAR_COMPLETE:String = "load_cc_char_complete";
      
      public static const LOAD_COMMUNITY_ASSET_COMPLETE:String = "load_community_asset_complete";
      
      public static const LOAD_THEME_BACKGROUND_COMPLETE:String = "load_theme_background_complete";
      
      public static const LOAD_ALL_THUMBS_COMPLETE:String = "load_all_thumbs_complete";
      
      public static const LOAD_THEME_PROP_COMPLETE:String = "load_theme_prop_complete";
      
      public static const LOAD_THEME_CHAR_COMPLETE:String = "load_theme_prop_complete";
      
      public static const LOAD_THEMELIST_COMPLETE:String = "load_themelist_complete";
      
      public static const LOAD_THEMETREE_COMPLETE:String = "load_themetree_complete";
      
      public static const DESERIALIZE_THEME_COMPLETE:String = "deserialize_theme_complete";
      
      public static const SWITCH_TO_USER_THEME_COMPLETE:String = "switch_to_user_theme_complete";
      
      public static const SWITCH_TO_SHARED_THEME_COMPLETE:String = "switchToSharedThemeComplete";
      
      public static const SWITCH_TO_TEAM_THEME_COMPLETE:String = "switchToTeamThemeComplete";
      
      public static const SWITCH_TO_COMMUNITY_THEME_COMPLETE:String = "switch_to_community_theme_complete";
      
      public static const SWITCH_TO_MOVIE_THEME_COMPLETE:String = "switch_to_movie_theme_complete";
      
      public static const SAVE_MOVIE_COMPLETE:String = "save_movie_complete";
      
      public static const SAVE_MOVIE_ERROR_OCCUR:String = "save_movie_error_occur";
      
      public static const SAVE_STARTER_COMPLETE:String = "saveStarterComplete";
      
      public static const SAVE_STARTER_ERROR:String = "saveStarterError";
      
      public static const SAVE_TEXT_COMPONENT_COMPLETE:String = "saveTextComponentComplete";
      
      public static const SAVE_TEXT_COMPONENT_ERROR:String = "saveTextComponentError";
      
      public static const LOAD_MOVIE_COMPLETE:String = "load_movie_complete";
      
      public static const PREPARE_MOVIE_COMPLETE:String = "prepare_movie_complete";
      
      public static const LOAD_EFFECT_COMPLETE:String = "load_effect_complete";
      
      public static const UPDATE_ASSET_COMPLETE:String = "update_asset_complete";
      
      public static const PLAY_SOUND_COMPLETE:String = "play_sound_complete";
      
      public static const USER_LOGIN_COMPLETE:String = "user_login_complete";
      
      public static const USER_LOGIN_CANCEL:String = "user_login_cancel";
      
      public static const SERIALIZE_COMPLETE:String = "serialize_complete";
      
      public static const DESERIALIZE_SCENE_COMPLETE:String = "deserialize_scene_complete";
      
      public static const DESERIALIZE_THUMB_COMPLETE:String = "deserialize_thumb_complete";
      
      public static const LOAD_ALL_ASSETS_COMPLETE:String = "load_all_assets_complete";
      
      public static const UNLOCK_ASSET:String = "unlock_asset";
      
      public static const COMMUNITY_SEARCH_COMPLETE:String = "communitySearchComplete";
      
      public static const COMMUNITY_SEARCH_DATA_READY:String = "communitySearchDataReady";
      
      public static const USER_SOUND_COMPLETE:String = "userSoundComplete";
      
      public static const USER_SOUND_ADDED:String = "userSoundAdded";
      
      public static const USER_SOUND_REMOVED:String = "userSoundRemoved";
      
      public static const USER_PROP_COMPLETE:String = "userPropComplete";
      
      public static const USER_PROP_ADDED:String = "userPropAdded";
      
      public static const USER_PROP_REMOVED:String = "userPropRemoved";
      
      public static const USER_CHAR_COMPLETE:String = "userCharComplete";
      
      public static const USER_BACKGROUND_ADDED:String = "userBackgroundAdded";
      
      public static const USER_BACKGROUND_REMOVED:String = "userBackgroundRemoved";
      
      public static const USER_BACKGROUND_COMPLETE:String = "userBackgroundComplete";
      
      public static const USER_VIDEO_ADDED:String = "userVideoAdded";
      
      public static const USER_VIDEO_REMOVED:String = "userVideoRemoved";
      
      public static const USER_VIDEO_COMPLETE:String = "userVideoComplete";
      
      public static const USER_BUBBLE_ADDED:String = "userBubbleAdded";
      
      public static const USER_BUBBLE_COMPLETE:String = "userBubbleComplete";
      
      public static const USER_BUBBLE_REMOVED:String = "userBubbleRemoved";
      
      public static const USER_STARTER_ADDED:String = "userStarterAdded";
      
      public static const USER_STARTER_REMOVED:String = "userStarterRemoved";
      
      public static const USER_STARTER_COMPLETE:String = "userStarterComplete";
      
      public static const SHARED_BACKGROUND_COMPLETE:String = "sharedBackgroundComplete";
      
      public static const SHARED_PROP_COMPLETE:String = "sharedPropComplete";
      
      public static const SHARED_BUBBLE_COMPLETE:String = "sharedBubbleComplete";
      
      public static const SHARED_SOUND_COMPLETE:String = "sharedSoundComplete";
      
      public static const SHARED_VIDEO_COMPLETE:String = "sharedVideoComplete";
      
      public static const SHARED_STARTER_COMPLETE:String = "sharedStarterComplete";
      
      public static const THEME_STARTER_COMPLETE:String = "themeStarterComplete";
      
      public static const MOVIE_FONT_LOADED:String = "movieFontLoaded";
      
      public static const CFF_FONT_LOADED:String = "cffFontLoaded";
      
      public static const CFF_FONT_ERROR:String = "cffFontError";
      
      public static const CFF_FONT_LIST_LOADED:String = "cffFontListLoaded";
      
      public static const FONT_LOADED:String = "fontLoaded";
      
      public static const TEXT_COMPONENT_LIST_LOADED:String = "textComponentListLoaded";
      
      public static const TEXT_COMPONENT_LOADED:String = "textComponentLoaded";
       
      
      public function CoreEvent(param1:String, param2:Object, param3:Object = null, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param2,param3,param4,param5);
      }
   }
}
