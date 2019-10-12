package anifire.studio.managers
{
   import anifire.managers.AppConfigManager;
   import anifire.util.UtilUser;
   
   public class AccessRightManager
   {
      
      private static var _instance:AccessRightManager;
      
      public static const ACCESS_RIGHT_CUSTOM_FONT:String = "accessRightCustomFont";
      
      public static const ACCESS_RIGHT_TEAM_SHARING:String = "accessRightTeamSharing";
      
      public static const ACCESS_RIGHT_TEAM_ADMIN:String = "accessRightTeamAdmin";
      
      public static const ACCESS_RIGHT_WATERMARK:String = "accessRightWatermark";
      
      public static const ACCESS_RIGHT_PRESENTATION_MODE:String = "accessRightPresentationMode";
      
      public static const ACCESS_RIGHT_ADMIN:String = "accessRightAdmin";
      
      public static const ACCESS_TEAM_ONLY_PREMIUM_TRACK:String = "accessTeamOnlyPremiumTrack";
      
      private static const FLASHVAR_COLLAB:String = "collab";
      
      private static const FLASHVAR_TEAM_ADMIN:String = "teamadmin";
       
      
      private var _configManager:AppConfigManager;
      
      public function AccessRightManager()
      {
         this._configManager = AppConfigManager.instance;
         super();
      }
      
      public static function get instance() : AccessRightManager
      {
         if(!_instance)
         {
            _instance = new AccessRightManager();
         }
         return _instance;
      }
      
      public function getAccess(param1:String) : Boolean
      {
         if(UtilUser.hasAdminFeatures)
         {
            return true;
         }
         switch(param1)
         {
            case ACCESS_RIGHT_CUSTOM_FONT:
               return this.isCustomFontEnabled();
            case ACCESS_RIGHT_TEAM_SHARING:
               return this.isTeamSharingEnabled();
            case ACCESS_RIGHT_TEAM_ADMIN:
               return this.isTeamAdmin();
            case ACCESS_RIGHT_WATERMARK:
               return this.isWatermarkChangable();
            case ACCESS_RIGHT_PRESENTATION_MODE:
               return this.presentationModeEnabled();
            case ACCESS_TEAM_ONLY_PREMIUM_TRACK:
               return this.isTeamSharingEnabled();
            default:
               return false;
         }
      }
      
      private function isCustomFontEnabled() : Boolean
      {
         return this._configManager.getValue(FLASHVAR_COLLAB) == "1";
      }
      
      private function isTeamSharingEnabled() : Boolean
      {
         return this._configManager.getValue(FLASHVAR_COLLAB) == "1";
      }
      
      private function presentationModeEnabled() : Boolean
      {
         return false;
      }
      
      private function isTeamAdmin() : Boolean
      {
         return this._configManager.getValue(FLASHVAR_TEAM_ADMIN) == "1";
      }
      
      private function isWatermarkChangable() : Boolean
      {
         return UtilUser.hasCommFeatures() && !UtilUser.isFreeTrial;
      }
   }
}
