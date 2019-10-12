package anifire.studio.managers
{
   public class UserExperimentManager
   {
      
      public static const FLASH_VARS_KEY:String = "exp";
      
      public static const ADD_SCENE_BUTTON_EXPERIMENT_ID:int = 1;
      
      private static var __instance:UserExperimentManager;
       
      
      public var experimentId:int;
      
      public function UserExperimentManager()
      {
         super();
      }
      
      public static function get instance() : UserExperimentManager
      {
         if(!__instance)
         {
            __instance = new UserExperimentManager();
         }
         return __instance;
      }
   }
}
