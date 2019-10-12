package
{
   import anifire.skins.ColorInputPanelSkin;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_skins_ColorInputPanelSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_skins_ColorInputPanelSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ColorInputPanelSkin.watcherSetupUtil = new _anifire_skins_ColorInputPanelSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("maskGroup",{"propertyChange":true},[param4[0]],param2);
         param5[0].updateParent(param1);
      }
   }
}
