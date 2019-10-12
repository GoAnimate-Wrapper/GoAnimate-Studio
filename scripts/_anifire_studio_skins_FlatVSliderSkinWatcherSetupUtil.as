package
{
   import anifire.studio.skins.FlatVSliderSkin;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_skins_FlatVSliderSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_skins_FlatVSliderSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         FlatVSliderSkin.watcherSetupUtil = new _anifire_studio_skins_FlatVSliderSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("trackMask",{"propertyChange":true},[param4[0]],param2);
         param5[1] = new PropertyWatcher("height",{"heightChanged":true},[param4[1]],param2);
         param5[2] = new PropertyWatcher("thumb",{"propertyChange":true},[param4[1]],param2);
         param5[3] = new PropertyWatcher("y",{"yChanged":true},[param4[1]],null);
         param5[0].updateParent(param1);
         param5[1].updateParent(param1);
         param5[2].updateParent(param1);
         param5[2].addChild(param5[3]);
      }
   }
}
