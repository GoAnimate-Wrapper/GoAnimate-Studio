package anifire.studio.assets.controllers
{
   import anifire.assets.transition.AssetTransitionConstants;
   import anifire.studio.assets.models.DestinationTransitionSetting;
   import anifire.studio.assets.models.HandDrawnTransitionSetting;
   import anifire.studio.assets.models.TransitionSetting;
   
   public class TransitionSettingFactory
   {
       
      
      public function TransitionSettingFactory()
      {
         super();
      }
      
      public static function createSetting(param1:String) : TransitionSetting
      {
         switch(param1)
         {
            case AssetTransitionConstants.TYPE_HAND_DRAWN:
               return new HandDrawnTransitionSetting();
            case AssetTransitionConstants.TYPE_HANDSLIDE:
            case AssetTransitionConstants.TYPE_SLIDE:
            case AssetTransitionConstants.TYPE_WIPE:
               return new DestinationTransitionSetting();
            default:
               return new TransitionSetting();
         }
      }
   }
}
