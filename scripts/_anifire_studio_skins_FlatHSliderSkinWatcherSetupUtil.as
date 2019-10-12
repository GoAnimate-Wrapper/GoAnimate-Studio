package
{
   import anifire.studio.skins.FlatHSliderSkin;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_skins_FlatHSliderSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_skins_FlatHSliderSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         FlatHSliderSkin.watcherSetupUtil = new _anifire_studio_skins_FlatHSliderSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("trackMask",{"propertyChange":true},[param4[0]],param2);
         param5[1] = new PropertyWatcher("thumb",{"propertyChange":true},[param4[1]],param2);
         param5[2] = new PropertyWatcher("x",{"xChanged":true},[param4[1]],null);
         param5[0].updateParent(param1);
         param5[1].updateParent(param1);
         param5[1].addChild(param5[2]);
      }
   }
}
