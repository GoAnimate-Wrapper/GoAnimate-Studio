package
{
   import anifire.studio.components.OverTray;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_OverTrayWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_OverTrayWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         OverTray.watcherSetupUtil = new _anifire_studio_components_OverTrayWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("chromeGroup",{"propertyChange":true},[param4[0],param4[1]],param2);
         param5[1] = new PropertyWatcher("width",{"widthChanged":true},[param4[1]],null);
         param5[0].updateParent(param1);
         param5[0].addChild(param5[1]);
      }
   }
}
