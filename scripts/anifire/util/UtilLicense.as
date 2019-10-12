package anifire.util
{
   import anifire.constant.LicenseConstants;
   import anifire.constant.ServerConstants;
   import anifire.constant.ThemeConstants;
   import anifire.managers.AppConfigManager;
   
   public class UtilLicense
   {
       
      
      public function UtilLicense()
      {
         super();
      }
      
      public static function get isSoundUploadable() : Boolean
      {
         var _loc1_:Array = LicenseConstants.BAN_SOUND_UPLOAD_LICENSE_IDS;
         var _loc2_:String = AppConfigManager.instance.getValue("siteId");
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_.length)
         {
            if(_loc1_[_loc3_] as String == _loc2_)
            {
               return false;
            }
            _loc3_++;
         }
         return true;
      }
      
      public static function isEffectChangeTipsShouldBeShown(param1:String) : Boolean
      {
         var _loc2_:Array = LicenseConstants.SHOULD_SHOW_EFFECT_CHANGED_TIP;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            if(_loc2_[_loc3_] as String == param1)
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      public static function isCommonSoundShouldBeShown(param1:String) : Boolean
      {
         var _loc2_:Array = LicenseConstants.DONT_SHOW_COMMON_SOUND_THEME_IDS;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            if(_loc2_[_loc3_] as String == param1)
            {
               return false;
            }
            _loc3_++;
         }
         return true;
      }
      
      public static function isUploadedAssetsEnabled() : Boolean
      {
         return AppConfigManager.instance.getValue("upl") == "1";
      }
      
      public static function isCommonPropShouldBeShown(param1:String) : Boolean
      {
         var _loc2_:Array = LicenseConstants.DONT_SHOW_COMMON_PROP_THEME_IDS;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            if(_loc2_[_loc3_] as String == param1)
            {
               return false;
            }
            _loc3_++;
         }
         return true;
      }
      
      public static function isCommonBackgroundShouldBeShown(param1:String) : Boolean
      {
         var _loc2_:Array = LicenseConstants.DONT_SHOW_COMMON_BG_THEME_IDS;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            if(_loc2_[_loc3_] as String == param1)
            {
               return false;
            }
            _loc3_++;
         }
         return true;
      }
      
      public static function isHeadSectionShouldBeShownInThumbtray(param1:String) : Boolean
      {
         var _loc2_:Array = LicenseConstants.DONT_SHOW_HEAD_SECTION_IN_THUMBTRAY;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            if(_loc2_[_loc3_] as String == param1)
            {
               return false;
            }
            _loc3_++;
         }
         return true;
      }
      
      public static function isHandGearSectionShouldBeShownInThumbtray(param1:String) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:Array = LicenseConstants.DONT_SHOW_HANDGEAR_SECTION_IN_THUMBTRAY_LICENSE_ID;
         _loc2_ = 0;
         while(_loc2_ < _loc3_.length)
         {
            if(_loc3_[_loc2_] as String == param1)
            {
               return false;
            }
            _loc2_++;
         }
         var _loc4_:String = AppConfigManager.instance.getValue(ServerConstants.FLASHVAR_THEME_ID);
         _loc3_ = LicenseConstants.DONT_SHOW_HEADGEAR_SECTION_IN_THUMBTRAY_THEME_ID;
         _loc2_ = 0;
         while(_loc2_ < _loc3_.length)
         {
            if(_loc3_[_loc2_] as String == _loc4_)
            {
               return false;
            }
            _loc2_++;
         }
         return true;
      }
      
      public static function isHeadGearSectionShouldBeShownInThumbtray(param1:String) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:Array = LicenseConstants.DONT_SHOW_HEADGEAR_SECTION_IN_THUMBTRAY_LICENSE_ID;
         _loc2_ = 0;
         while(_loc2_ < _loc3_.length)
         {
            if(_loc3_[_loc2_] as String == param1)
            {
               return false;
            }
            _loc2_++;
         }
         var _loc4_:String = AppConfigManager.instance.getValue(ServerConstants.FLASHVAR_THEME_ID);
         _loc3_ = LicenseConstants.DONT_SHOW_HEADGEAR_SECTION_IN_THUMBTRAY_THEME_ID;
         _loc2_ = 0;
         while(_loc2_ < _loc3_.length)
         {
            if(_loc3_[_loc2_] as String == _loc4_)
            {
               return false;
            }
            _loc2_++;
         }
         return true;
      }
      
      public static function isExternalPreviewPlayerShouldBeUsed(param1:String) : Boolean
      {
         var _loc2_:Array = LicenseConstants.SHOULD_USE_EXTERNAL_PREVIEW_PLAYER;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            if(_loc2_[_loc3_] as String == param1)
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      public static function getCurrentLicenseId() : String
      {
         var _loc1_:AppConfigManager = AppConfigManager.instance;
         var _loc2_:String = _loc1_.getValue(ServerConstants.FLASHVAR_CLIENT_THEME_CODE);
         if(_loc2_)
         {
            if(_loc2_ == "domo")
            {
               return "7";
            }
            if(_loc2_ == "cn")
            {
               return "8";
            }
         }
         var _loc3_:String = _loc1_.getValue(ServerConstants.FLASHVAR_MOVIE_LICENSE_ID);
         if(_loc3_ && _loc3_ != "")
         {
            return _loc3_;
         }
         var _loc4_:String = _loc1_.getValue(ServerConstants.FLASHVAR_SITE_ID);
         if(_loc4_ && _loc4_ != "")
         {
            return _loc4_;
         }
         return "0";
      }
      
      public static function isSchoolEnvironment() : Boolean
      {
         return AppConfigManager.instance.getValue(ServerConstants.PARAM_U_INFO_SCHOOL) != null;
      }
      
      public static function isBubbleI18NPermitted() : Boolean
      {
         var _loc1_:AppConfigManager = AppConfigManager.instance;
         var _loc2_:String = _loc1_.getValue(ServerConstants.FLASHVAR_CLIENT_THEME_CODE);
         var _loc3_:String = _loc1_.getValue(ServerConstants.FLASHVAR_CLIENT_THEME_LANG_CODE);
         return _loc2_ == "go" || _loc2_ == "school" || _loc3_ != "en_US";
      }
      
      public static function isInitBizTheme() : Boolean
      {
         var _loc1_:AppConfigManager = AppConfigManager.instance;
         var _loc2_:String = _loc1_.getValue(ServerConstants.FLASHVAR_DEFAULT_TRAYTHEME);
         switch(_loc2_)
         {
            case ThemeConstants.BUSINESS_THEME_ID:
            case ThemeConstants.BIZ_MODEL_THEME_ID:
            case ThemeConstants.STICKLY_BIZ_THEME_ID:
            case ThemeConstants.WHITEBOARD_THEME_ID:
            case ThemeConstants.INFOGRAPHICS_THEME_ID:
               return true;
            default:
               return false;
         }
      }
   }
}
