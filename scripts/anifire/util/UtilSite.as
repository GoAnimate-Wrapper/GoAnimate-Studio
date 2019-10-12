package anifire.util
{
   import anifire.constant.ServerConstants;
   import anifire.managers.AppConfigManager;
   
   public class UtilSite
   {
      
      public static const GOANIMATE:Number = 0;
      
      public static const CN:Number = 1;
      
      public static const DOMO:Number = 2;
      
      public static const SCHOOL:Number = 3;
      
      public static const YOUTUBE:Number = 4;
      
      public static const SKOLETUBE:Number = 12;
      
      public static const ED:Number = 14;
      
      public static const SCHOOLOGY:Number = 16;
      
      public static const WIX:Number = 17;
      
      public static const SITE_ID_GOANIMATE:String = "0";
      
      public static const SITE_ID_WIX:String = "17";
      
      private static var _id:Number = -1;
      
      private static var _apiServer:String;
      
      private static var _tlang:String;
      
      private static var __licenseId:String;
       
      
      public function UtilSite()
      {
         super();
      }
      
      public static function get siteId() : int
      {
         var _loc1_:String = null;
         var _loc2_:String = null;
         if(_id == -1)
         {
            _loc1_ = apiServer;
            if(_loc1_.search("youtube") > 0)
            {
               _id = YOUTUBE;
            }
            else if(_loc1_.search("skoletube") > 0)
            {
               _id = SKOLETUBE;
            }
            else
            {
               _loc2_ = AppConfigManager.instance.getValue("siteId");
               switch(_loc2_)
               {
                  case "8":
                     _id = CN;
                     break;
                  case "7":
                     _id = DOMO;
                     break;
                  case "11":
                  case "school":
                     _id = SCHOOL;
                     break;
                  case "14":
                     _id = ED;
                     break;
                  case "16":
                     _id = SCHOOLOGY;
                     break;
                  case SITE_ID_WIX:
                     _id = WIX;
                     break;
                  default:
                     _id = GOANIMATE;
               }
            }
         }
         return _id;
      }
      
      public static function get apiServer() : String
      {
         if(!_apiServer)
         {
            _apiServer = AppConfigManager.instance.getValue(ServerConstants.FLASHVAR_APISERVER);
         }
         return _apiServer;
      }
      
      public static function get domainName() : String
      {
         return apiServer;
      }
      
      public static function get isDevelopmentSite() : Boolean
      {
         var _loc1_:String = domainName;
         if(_loc1_)
         {
            return _loc1_.search("goanimate.org") > 0 || _loc1_.search("staging") > 0 || _loc1_.search("demo") > 0 || _loc1_.search("alvin") > 0;
         }
         return false;
      }
      
      public static function get isSchoolSite() : Boolean
      {
         return siteId == SCHOOL || siteId == SKOLETUBE || siteId == ED || siteId == SCHOOLOGY;
      }
      
      public static function get isG4S() : Boolean
      {
         return siteId == SCHOOL;
      }
      
      public static function get isWix() : Boolean
      {
         return ServerConstants.IS_WIX;
      }
      
      public static function get tlang() : String
      {
         if(!_tlang)
         {
            _tlang = AppConfigManager.instance.getValue(ServerConstants.FLASHVAR_CLIENT_THEME_LANG_CODE);
         }
         return _tlang;
      }
      
      public static function get isGoLite() : Boolean
      {
         var _loc1_:String = AppConfigManager.instance.getValue(ServerConstants.FLASHVAR_IS_GOLITE_PREVIEW);
         return _loc1_ == "1";
      }
      
      public static function get isGoAnimate() : Boolean
      {
         if(__licenseId == null)
         {
            __licenseId = AppConfigManager.instance.getValue(ServerConstants.FLASHVAR_LICENSE_ID);
         }
         return __licenseId == SITE_ID_GOANIMATE;
      }
   }
}
