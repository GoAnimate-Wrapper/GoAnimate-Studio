package anifire.constant
{
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class AnimeConstants
   {
      
      public static const MOVIE_VERSION:Number = 4;
      
      public static const SCREEN_X:Number = 47;
      
      public static const SCREEN_Y:Number = 24;
      
      public static const SCREEN_WIDTH:Number = 550;
      
      public static const SCREEN_HEIGHT:Number = 354;
      
      public static const WIDE_SCREEN_HEIGHT:Number = 310;
      
      public static const SCREEN_HEIGHT_DIFF:Number = SCREEN_HEIGHT - WIDE_SCREEN_HEIGHT;
      
      public static const WIDE_SCREEN_Y:Number = 46;
      
      public static const CONVERT_TO_AVI_HEIGHT:Number = 720;
      
      public static const CONVERT_TO_AVI_WIDTH:Number = 1280;
      
      public static const FACING_LEFT:String = "left";
      
      public static const FACING_RIGHT:String = "right";
      
      public static const FACING_UNKNOW:String = "unknown";
      
      public static const MENU_ITEM_TYPE_MOVEMENT_TAG:String = "movement";
      
      public static const MOVEMENT_SLIDE:String = "Slide";
      
      public static const MOTION_FORWARD:String = "forward";
      
      public static const MOTION_BACKWARD:String = "backward";
      
      public static const FRAME_PER_SEC:Number = 24;
      
      public static const FRAME_PER_SEC_FAST:Number = 24;
      
      public static const FRAME_PER_PIXEL:Number = 1 / PIXEL_PER_FRAME;
      
      public static const PIXEL_PER_FRAME:Number = 2;
      
      public static const PIXEL_PER_SEC:Number = PIXEL_PER_FRAME * FRAME_PER_SEC;
      
      public static const PIXEL_PER_MILLISEC:Number = PIXEL_PER_SEC * 0.001;
      
      public static const FRAME_PER_BUBBLE_WORD:uint = 9;
      
      public static const MOTION_DURATION:Number = 2;
      
      public static const ASSET_MOVE_TOLERANCE:Number = 15;
      
      public static const DEFAULT_CAMERA_ZOOM_DURATION:int = 12;
      
      public static const AUTOSAVE_INTERVAL:int = 10 * 60;
      
      public static const DEFAULT_MOVIE_NAME:String = "Untitled";
      
      public static const DEFAULT_VOLUME:Number = 1;
      
      public static const DEFAULT_INNER_VOLUME:Number = 1;
      
      public static const SCENE_DURATION_MINIMUM:Number = SCENE_FRAME_MINIMUM / FRAME_PER_SEC;
      
      public static const SCENE_LENGTH_MINIMUM:Number = SCENE_FRAME_MINIMUM * PIXEL_PER_FRAME;
      
      public static const SCENE_FRAME_MINIMUM:Number = 6;
      
      public static const SCENE_FRAME_MAXIMUM:Number = 5760;
      
      public static const SCENE_SNAP_INTERVAL:Number = SCENE_FRAME_INTERVAL * PIXEL_PER_FRAME;
      
      public static const SCENE_FRAME_INTERVAL:Number = 3;
      
      public static const SCENE_TIME_SNAP:Number = SCENE_FRAME_INTERVAL / FRAME_PER_SEC;
      
      public static const SOUND_FRAME_INTERVAL:int = 3;
      
      public static const SOUND_FADING_DURATION_SNAP_INTERVAL:int = 3;
      
      public static const SOUND_VOLUME_SNAP_INTERVAL:Number = 0.01;
      
      public static const SOUND_LENGTH_MINIMUM:int = SCENE_LENGTH_MINIMUM;
      
      public static const SOUND_FRAME_MINIMUM:int = 6;
      
      public static const SCENE_DURATION_DEFAULT:Number = SCENE_FRAME_DEFAULT / FRAME_PER_SEC;
      
      public static const SCENE_LENGTH_DEFAULT:Number = SCENE_FRAME_DEFAULT * PIXEL_PER_FRAME;
      
      public static const SCENE_FRAME_DEFAULT:Number = 60;
      
      public static const MOVIE_XML_FILENAME:String = "movie.xml";
      
      public static const THEME_SEGMENT_ONE:int = 1;
      
      public static const THEME_SEGMENT_TWO:int = 2;
      
      public static const PLAYER_WIDTH:int = 550;
      
      public static const PLAYER_HEIGHT:int = 354;
      
      public static const STAGE_X:int = 0;
      
      public static const STAGE_Y:int = 68;
      
      public static const STAGE_WIDTH:int = 645;
      
      public static const STAGE_HEIGHT:int = 402;
      
      public static const STAGE_PADDING:int = 250;
      
      public static const STAGE_SCALEX:Number = 0.75;
      
      public static const STAGE_SCALEY:Number = 0.75;
      
      public static const MOVIE_THUMBNAIL_WIDTH:int = 160;
      
      public static const MOVIE_THUMBNAIL_HEIGHT:int = 90;
      
      public static const MOVIE_THUMBNAIL_LARGE_WIDTH:int = 640;
      
      public static const MOVIE_THUMBNAIL_LARGE_HEIGHT:int = 360;
      
      public static const STARTER_THUMBNAIL_WIDTH:int = 180;
      
      public static const STARTER_THUMBNAIL_HEIGHT:int = 120;
      
      public static const MAX_CONCURRENT_NETWORK_CONNECTION:int = 4;
      
      public static const MIN_TIME_TO_BUFFER:Number = 15000;
      
      public static const STUDIO_WIDTH_MIN:Number = 954;
      
      public static const STUDIO_HEIGHT_MIN:Number = 640;
      
      public static const STUDIO_WIDTH_DEFAULT:Number = STUDIO_WIDTH_MIN;
      
      public static const STUDIO_HEIGHT_DEFAULT:Number = STUDIO_HEIGHT_MIN;
      
      public static const TILE_CHAR_WIDTH:Number = 85;
      
      public static const TILE_CHAR_HEIGHT:Number = 85;
      
      public static const TILE_BUBBLE_WIDTH:Number = 60;
      
      public static const TILE_BUBBLE_HEIGHT:Number = 60;
      
      public static const TILE_PROP_WIDTH:Number = 60;
      
      public static const TILE_PROP_HEIGHT:Number = 60;
      
      public static const TILE_BACKGROUND_WIDTH:Number = 120;
      
      public static const TILE_BACKGROUND_HEIGHT:Number = 80;
      
      public static const TILE_INSETS:Number = 5;
      
      public static const TAB_DIVIDEND_CHAR:int = 2;
      
      public static const TAB_DIVIDEND_BACKGROUND:int = 5;
      
      public static const TAB_DIVIDENT_PROP:int = 2;
      
      public static const TAB_INDEX_CHAR:int = 0;
      
      public static const TAB_INDEX_BACKGROUND:int = 1;
      
      public static const TAB_INDEX_PROP:int = 4;
      
      public static const TAB_INDEX_SOUND:int = 3;
      
      public static const STAGE_DIVIDEN_CHAR:Number = 1.5;
      
      public static const STAGE_DIVIDEN_BACKGROUND:Number = 1.5;
      
      public static const LOADER_NAME:String = "imageLoader";
      
      public static const IMAGE_OBJECT_NAME:String = "imageObject";
      
      public static const SEARCH_ASSET_PAGE_SIZE:int = 1000;
      
      public static const ASSET_TYPE_UNKNOWN:String = "Unknown";
      
      public static const ASSET_TYPE_BG:String = "bg";
      
      public static const ASSET_TYPE_TEMPLATE:String = "movie";
      
      public static const ASSET_TYPE_CHAR:String = "char";
      
      public static const ASSET_TYPE_BUBBLE:String = "bubble";
      
      public static const ASSET_TYPE_FX:String = "effect";
      
      public static const ASSET_TYPE_PROP:String = "prop";
      
      public static const ASSET_TYPE_PROP_HEAD:String = "Prop - used as a character\'s head";
      
      public static const ASSET_TYPE_PROP_HELD_BY_CHAR:String = "Prop - held by a character";
      
      public static const ASSET_TYPE_PROP_PLACEABLE:String = "Prop - place on stage";
      
      public static const ASSET_TYPE_PROP_VIDEO:String = "video";
      
      public static const DOWNLOAD_TYPE_FLV:String = "flv";
      
      public static const ASSET_TYPE_SOUND:String = "sound";
      
      public static const ASSET_TYPE_SOUND_SUBTYPE_BG_MUSIC:String = "bgmusic";
      
      public static const ASSET_TYPE_SOUND_SUBTYPE_SOUND_EFFECT:String = "soundeffect";
      
      public static const ASSET_TYPE_SOUND_SUBTYPE_VOICE_OVER:String = "voiceover";
      
      public static const ASSET_TYPE_SOUND_SUBTYPE_TTS:String = "tts";
      
      public static const ASSET_TYPE_SOUND_SUBTYPE_TRIBE_OF_NOISE:String = "tribeofnoise";
      
      public static const DOWNLOAD_TYPE_EMBED:String = "embed";
      
      public static const DOWNLOAD_TYPE_PROGRESSIVE:String = "progressive";
      
      public static const DOWNLOAD_TYPE_STREAM:String = "stream";
      
      public static const TIME_OUT:int = 30000;
      
      public static const MATH_DOT_NUM:int = 1;
      
      public static const DOUBLE_CLICK_DURATION:int = 500;
      
      public static const ERR_BLANK:String = "constant_warningtitle";
      
      public static const ERR_BLANK_TAG:String = "constant_warningtag";
      
      public static const ERR_BAD:String = "constant_warningbad";
      
      public static const GA_ACTION__AUTO_SAVE:String = "/gostudio/autoSave";
      
      public static const MAGIC_KEY:String = "n0t t0 sh0w";
      
      public static const COMBO_REMINDER:String = "constant_combo";
      
      public static const NETWORK_ERROR_MESSAGE:String = "constant_connecterr";
      
      public static const SOUND_NON_UPLOADABLE_MSG:String = "constant_disabled";
      
      public static const SOUND_UPLOADABLE_MSG:String = "constant_othertheme";
      
      public static const LANGUAGE_CODE_ENGLISH:String = "en";
      
      public static const MOVIECLIP_DEFAULT_HEAD:String = "defaultHead";
      
      public static const MOVIECLIP_CUSTOM_HEAD:String = "customHead";
      
      public static const MOVIECLIP_DEFAULT_MOUTH:String = "defaultMouth";
      
      public static const MOVIECLIP_CUSTOM_MOUTH:String = "customMouth";
      
      public static const MOVIECLIP_THE_MOUTH:String = "theMouth";
      
      public static const MOVIECLIP_DEFAULT_TAIL:String = "defaultTail";
      
      public static const MOVIECLIP_THE_HEAD:String = "theHead";
      
      public static const MOVIECLIP_THE_PROP:String = "theProp";
      
      public static const MOVIECLIP_THE_WEAR:String = "theWear";
      
      public static const MOVIECLIP_THE_TAIL:String = "theTail";
      
      public static const MOVIECLIP_CUSTOM_WEAR:String = "customWear";
      
      public static const CLASS_GOPROP:String = "GoProp";
      
      public static const CLASS_GOHAND:String = "GoHands";
      
      public static const HAND:String = "Hand";
      
      public static const RIGHT:String = "Right";
      
      public static const CLASS_GOLEFTLOWERHAND:String = "GoLeftLowerHand";
      
      public static const CLASS_GORIGHTLOWERHAND:String = "GoRightLowerHand";
      
      public static const MESSAGE_NETWORK_FAIL:String = "Network connection failed";
      
      public static const SCREEN_MODE_NORMAL:String = "normal_screen_node";
      
      public static const SCREEN_MODE_WIDE:String = "wide_screen_mode";
      
      public static const TAG_MY_FAV_THUMB:String = "__sys__myFAV_";
       
      
      public function AnimeConstants()
      {
         super();
      }
      
      public static function get screenY() : Number
      {
         if(LicenseConstants.isWideScreen())
         {
            return WIDE_SCREEN_Y;
         }
         return SCREEN_Y;
      }
      
      public static function get screenHeight() : Number
      {
         if(LicenseConstants.isWideScreen())
         {
            return WIDE_SCREEN_HEIGHT;
         }
         return SCREEN_HEIGHT;
      }
      
      public static function get screenCenter() : Point
      {
         return new Point(SCREEN_X + SCREEN_WIDTH / 2,screenY + screenHeight / 2);
      }
      
      public static function get screenRect() : Rectangle
      {
         return new Rectangle(SCREEN_X,screenY,SCREEN_WIDTH,screenHeight);
      }
   }
}
