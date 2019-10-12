package
{
   import anifire.studio.skins.OpacitySliderTrackSkin;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_skins_OpacitySliderTrackSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_skins_OpacitySliderTrackSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         OpacitySliderTrackSkin.watcherSetupUtil = new _anifire_studio_skins_OpacitySliderTrackSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("maskGroup",{"propertyChange":true},[param4[0]],param2);
         param5[1] = new PropertyWatcher("hostComponent",{"propertyChange":true},[param4[1],param4[2]],param2);
         param5[2] = new PropertyWatcher("baseColor",{"propertyChange":true},[param4[1],param4[2]],null);
         param5[0].updateParent(param1);
         param5[1].updateParent(param1);
         param5[1].addChild(param5[2]);
      }
   }
}
