package anifire.studio.assets.controllers
{
   import anifire.studio.assets.models.AssetTransition;
   
   public class AssetTransitionFactory
   {
      
      public static const SUGGESTED_TRANSITIONS_PER_SCENE:uint = 10;
       
      
      public function AssetTransitionFactory()
      {
         super();
      }
      
      public static function create(param1:String, param2:String, param3:String) : AssetTransition
      {
         return new AssetTransition(param1,param2,param3);
      }
      
      public static function get maxTransitionsPerScene() : uint
      {
         return 999;
      }
   }
}
