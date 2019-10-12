package anifire.constant
{
   import anifire.managers.AppConfigManager;
   import anifire.managers.ExternalLinkManager;
   import anifire.util.UtilHashArray;
   import flash.external.ExternalInterface;
   import flash.geom.Rectangle;
   
   public class LicenseConstants
   {
      
      public static const PUBLISH_ALL:Number = 0;
      
      public static const PUBLISH_PRIVATE_ONLY:Number = 1;
      
      public static const PUBLISH_SHARING_MUST_ON:Number = 2;
      
      public static const PUBLISH_PRIVATE_OFF_ONLY:Number = 4;
      
      public static const PUBLISH_PRIVATE_ON_ONLY:Number = 5;
      
      public static const PUBLISH_PUBLIC_ONLY:Number = 6;
      
      public static var TEST_API_SERVERS:Array = ["alvin.goanimate.org","alvincn.goanimate.org"];
      
      public static var THUMBNAIL_HINT_API_SERVERS:Array = ["staging.goanimate.org","bernard.goanimate.org","bernardcn.goanimate.org","alvin.goanimate.org","alvincn.goanimate.org"];
      
      private static var _specialModes:Object = {};
       
      
      public function LicenseConstants()
      {
         super();
      }
      
      public static function isThumbnailTestHost() : Boolean
      {
         return isHostMatch(THUMBNAIL_HINT_API_SERVERS,"thumb");
      }
      
      public static function isTestHost() : Boolean
      {
         return isHostMatch(TEST_API_SERVERS,"default");
      }
      
      private static function isHostMatch(param1:Array, param2:String) : Boolean
      {
         var apiserver:String = null;
         var list:Array = param1;
         var cat:String = param2;
         if(int(_specialModes[cat]) != 0)
         {
            return int(_specialModes[cat]) > 0;
         }
         var permittedHosts:Array = list;
         apiserver = AppConfigManager.instance.getValue(ServerConstants.FLASHVAR_APISERVER);
         var result:Boolean = permittedHosts.some(function(param1:*, param2:int, param3:Array):Boolean
         {
            return apiserver.indexOf(param1 as String) >= 0;
         });
         _specialModes[cat] = !!result?1:-1;
         return result;
      }
      
      public static function visitStudioByTheme(param1:String) : void
      {
         var _loc2_:String = AppConfigManager.instance.getValue(ServerConstants.FLASHVAR_SITE_ID);
         var _loc3_:String = "";
         if(_loc2_ == "ed")
         {
            _loc3_ = ServerConstants.STUDIO_PAGE_PATH_NEW;
            _loc3_ = _loc3_ + ("full/" + param1);
         }
         else if(_loc2_ != "go")
         {
            _loc3_ = ServerConstants.STUDIO_PAGE_PATH;
            _loc3_ = _loc3_ + ("theme/" + param1);
         }
         else
         {
            _loc3_ = ServerConstants.STUDIO_FULLSCREEN_PAGE_PATH;
            _loc3_ = _loc3_ + ("theme/" + param1);
            if(ExternalInterface.available)
            {
               ExternalInterface.call("fullscreenStudio",_loc3_);
            }
            return;
         }
         ExternalLinkManager.instance.navigateWithSession(_loc3_);
      }
      
      public static function getScreenRatio() : Number
      {
         if(isWideScreen())
         {
            return AnimeConstants.SCREEN_WIDTH / AnimeConstants.WIDE_SCREEN_HEIGHT;
         }
         return AnimeConstants.SCREEN_WIDTH / AnimeConstants.SCREEN_HEIGHT;
      }
      
      public static function getStageRect() : Rectangle
      {
         var _loc1_:Rectangle = new Rectangle(AnimeConstants.SCREEN_X,AnimeConstants.SCREEN_Y,AnimeConstants.SCREEN_WIDTH,AnimeConstants.SCREEN_HEIGHT);
         var _loc2_:Rectangle = new Rectangle(AnimeConstants.SCREEN_X,AnimeConstants.WIDE_SCREEN_Y,AnimeConstants.SCREEN_WIDTH,AnimeConstants.WIDE_SCREEN_HEIGHT);
         return !!isWideScreen()?_loc2_:_loc1_;
      }
      
      public static function isWideScreen() : Boolean
      {
         var _loc1_:String = AppConfigManager.instance.getValue(ServerConstants.FLASHVAR_IS_WIDE);
         return _loc1_ == "true" || _loc1_ == "1";
      }
      
      public static function get BAN_SOUND_UPLOAD_LICENSE_IDS() : Array
      {
         var _loc1_:Array = new Array();
         _loc1_.push("3");
         _loc1_.push("5");
         return _loc1_;
      }
      
      public static function get DONT_SHOW_COMMON_SOUND_THEME_IDS() : Array
      {
         var _loc1_:Array = new Array();
         _loc1_.push("akon");
         _loc1_.push("sf");
         _loc1_.push("underdog");
         _loc1_.push("willie");
         return _loc1_;
      }
      
      public static function get DONT_SHOW_COMMON_PROP_THEME_IDS() : Array
      {
         var _loc1_:Array = new Array();
         _loc1_.push("ben10");
         _loc1_.push("chowder");
         _loc1_.push("toonadv");
         _loc1_.push(ThemeConstants.BUSINESS_THEME_ID);
         _loc1_.push(ThemeConstants.ANIME_THEME_ID);
         _loc1_.push(ThemeConstants.NINJAANIME_THEME_ID);
         _loc1_.push(ThemeConstants.STICKLY_BIZ_THEME_ID);
         _loc1_.push(ThemeConstants.COMMON_CRAFT_THEME_ID);
         _loc1_.push(ThemeConstants.BIZ_MODEL_THEME_ID);
         _loc1_.push(ThemeConstants.SPACE_CITIZEN_THEME_ID);
         _loc1_.push(ThemeConstants.WHITEBOARD_THEME_ID);
         return _loc1_;
      }
      
      public static function get DONT_SHOW_COMMON_BG_THEME_IDS() : Array
      {
         var _loc1_:Array = new Array();
         _loc1_.push("ben10");
         _loc1_.push("chowder");
         _loc1_.push("toonadv");
         _loc1_.push(ThemeConstants.BUSINESS_THEME_ID);
         _loc1_.push(ThemeConstants.ANIME_THEME_ID);
         _loc1_.push(ThemeConstants.NINJAANIME_THEME_ID);
         _loc1_.push(ThemeConstants.STICKLY_BIZ_THEME_ID);
         _loc1_.push(ThemeConstants.COMMON_CRAFT_THEME_ID);
         _loc1_.push(ThemeConstants.BIZ_MODEL_THEME_ID);
         _loc1_.push(ThemeConstants.SPACE_CITIZEN_THEME_ID);
         _loc1_.push(ThemeConstants.WHITEBOARD_THEME_ID);
         return _loc1_;
      }
      
      public static function get DONT_SHOW_HEAD_SECTION_IN_THUMBTRAY() : Array
      {
         var _loc1_:Array = new Array();
         _loc1_.push("7");
         _loc1_.push("8");
         _loc1_.push("10");
         return _loc1_;
      }
      
      public static function get DONT_SHOW_HANDGEAR_SECTION_IN_THUMBTRAY_LICENSE_ID() : Array
      {
         var _loc1_:Array = new Array();
         return _loc1_;
      }
      
      public static function get DONT_SHOW_HEADGEAR_SECTION_IN_THUMBTRAY_LICENSE_ID() : Array
      {
         var _loc1_:Array = new Array();
         _loc1_.push("10");
         return _loc1_;
      }
      
      public static function get DONT_SHOW_HEADGEAR_SECTION_IN_THUMBTRAY_THEME_ID() : Array
      {
         var _loc1_:Array = new Array();
         _loc1_.push("0pBZ9UF7FrRU");
         return _loc1_;
      }
      
      public static function get SHOULD_USE_EXTERNAL_PREVIEW_PLAYER() : Array
      {
         var _loc1_:Array = new Array();
         return _loc1_;
      }
      
      public static function get DONT_ALLOW_TAKING_SCREENSHOT() : Array
      {
         var _loc1_:Array = new Array();
         _loc1_.push("8");
         return _loc1_;
      }
      
      public static function get SHOULD_SHOW_EFFECT_CHANGED_TIP() : Array
      {
         var _loc1_:Array = new Array();
         _loc1_.push("0");
         _loc1_.push("1");
         _loc1_.push("2");
         _loc1_.push("3");
         _loc1_.push("4");
         _loc1_.push("5");
         _loc1_.push("6");
         _loc1_.push("9");
         _loc1_.push("10");
         return _loc1_;
      }
      
      public static function get PUBLISH_LEVEL() : UtilHashArray
      {
         var _loc1_:UtilHashArray = new UtilHashArray();
         _loc1_.push("8",PUBLISH_SHARING_MUST_ON);
         return _loc1_;
      }
   }
}
