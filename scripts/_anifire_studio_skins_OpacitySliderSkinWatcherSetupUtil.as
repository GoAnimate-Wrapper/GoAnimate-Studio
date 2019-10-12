package
{
   import anifire.studio.components.OpacitySlider;
   import anifire.studio.skins.OpacitySliderSkin;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.binding.StaticPropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_skins_OpacitySliderSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_skins_OpacitySliderSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         OpacitySliderSkin.watcherSetupUtil = new _anifire_studio_skins_OpacitySliderSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("hostComponent",{"propertyChange":true},[param4[0],param4[1]],param2);
         param5[1] = new PropertyWatcher("baseColor",{"propertyChange":true},[param4[0]],null);
         param5[4] = new PropertyWatcher("value",{"valueCommit":true},[param4[1]],null);
         param5[3] = new StaticPropertyWatcher("PERCENTAGE_SYMBOL",{"propertyChange":true},[param4[1]],null);
         param5[0].updateParent(param1);
         param5[0].addChild(param5[1]);
         param5[0].addChild(param5[4]);
         param5[3].updateParent(OpacitySlider);
      }
   }
}
