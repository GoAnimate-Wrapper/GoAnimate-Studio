package anifire.util
{
   import anifire.constant.ServerConstants;
   import anifire.managers.AppConfigManager;
   
   public class UtilUser
   {
      
      public static const BASIC_USER:Number = 10;
      
      public static const PLUS_USER:Number = 20;
      
      public static const PUBLISH_USER:Number = 23;
      
      public static const PRO_USER:Number = 25;
      
      public static const COMM_USER:Number = 30;
      
      public static const BETA_USER:Number = 40;
      
      public static const BETA2_USER:Number = 50;
      
      public static const ADMIN_USER:Number = 60;
      
      private static var _type:Number = -1;
      
      private static var _loggedIn:Number = -1;
      
      private static var _isTrialAccount:Number = -1;
      
      private static var _isContentAdmin:Number = -1;
       
      
      public function UtilUser()
      {
         super();
      }
      
      public static function hasPlusFeatures() : Boolean
      {
         return userType >= PLUS_USER;
      }
      
      public static function hasCommFeatures() : Boolean
      {
         return userType >= COMM_USER;
      }
      
      public static function hasBetaFeatures() : Boolean
      {
         return userType >= BETA_USER;
      }
      
      public static function get hasAdminFeatures() : Boolean
      {
         return userType >= ADMIN_USER;
      }
      
      public static function get hasProFeatures() : Boolean
      {
         return userType >= PRO_USER;
      }
      
      public static function get hasBizFeatures() : Boolean
      {
         return userType > PRO_USER;
      }
      
      public static function get hasBusinessFeatures() : Boolean
      {
         return userType >= PUBLISH_USER;
      }
      
      public static function get userType() : Number
      {
         var _loc1_:String = null;
         if(_type == -1)
         {
            _loc1_ = AppConfigManager.instance.getValue("ut");
            switch(_loc1_)
            {
               case "10":
                  _type = BASIC_USER;
                  break;
               case "20":
                  _type = PLUS_USER;
                  break;
               case "23":
                  _type = PUBLISH_USER;
                  break;
               case "25":
                  _type = PRO_USER;
                  break;
               case "30":
                  _type = COMM_USER;
                  break;
               case "40":
                  _type = BETA_USER;
                  break;
               case "50":
                  _type = BETA2_USER;
                  break;
               case "60":
                  _type = ADMIN_USER;
                  break;
               default:
                  _type = BASIC_USER;
            }
         }
         return _type;
      }
      
      public static function updateUserType(param1:Number) : void
      {
         _type = param1;
         AppConfigManager.instance.setValue("ut",String(param1));
      }
      
      public static function get loggedIn() : Boolean
      {
         var _loc1_:String = null;
         if(_loggedIn == -1)
         {
            _loc1_ = AppConfigManager.instance.getValue("userId");
            if(_loc1_ == null || _loc1_ == "")
            {
               _loggedIn = 0;
            }
            else
            {
               _loggedIn = 1;
            }
         }
         return _loggedIn == 1;
      }
      
      public static function get isTrialAccount() : Boolean
      {
         var _loc1_:String = null;
         if(_isTrialAccount == -1)
         {
            _loc1_ = AppConfigManager.instance.getValue("trial");
            if(_loc1_ == "1")
            {
               _isTrialAccount = 1;
            }
            else
            {
               _isTrialAccount = 0;
            }
         }
         return _isTrialAccount == 1;
      }
      
      public static function get isFreeTrial() : Boolean
      {
         return AppConfigManager.instance.getValue(ServerConstants.FLASHVAR_IS_FREE_TRIAL) == "1";
      }
      
      public static function get isContentAdmin() : Boolean
      {
         if(_isContentAdmin == -1)
         {
            _isContentAdmin = AppConfigManager.instance.getValue(ServerConstants.FLASHVAR_IS_CONTENT_ADMIN) == "1"?Number(1):Number(0);
         }
         return _isContentAdmin == 1;
      }
   }
}
