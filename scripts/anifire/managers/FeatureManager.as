package anifire.managers
{
   import anifire.util.UtilSite;
   import anifire.util.UtilUser;
   
   public class FeatureManager
   {
       
      
      public function FeatureManager()
      {
         super();
      }
      
      public static function get maxCharacterPerScene() : Number
      {
         if(UtilSite.siteId == UtilSite.YOUTUBE)
         {
            return 3;
         }
         return 999;
      }
      
      public static function get maxMovieDuration() : Number
      {
         if(UtilUser.userType == UtilUser.BASIC_USER)
         {
            return 120;
         }
         return 60 * 60 * 60;
      }
      
      public static function get shouldBubbleUrlBeEditable() : Boolean
      {
         if(UtilSite.siteId == UtilSite.YOUTUBE || UtilSite.siteId == UtilSite.SKOLETUBE)
         {
            return false;
         }
         return true;
      }
   }
}
