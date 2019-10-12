package
{
   import anifire.studio.components.GoToolBar;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_GoToolBarWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_GoToolBarWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         GoToolBar.watcherSetupUtil = new _anifire_studio_components_GoToolBarWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[1] = new PropertyWatcher("copyEnabled",{"propertyChange":true},[param4[1]],param2);
         param5[3] = new PropertyWatcher("pasteEnabled",{"propertyChange":true},[param4[3]],param2);
         param5[8] = new PropertyWatcher("_showExitButton",{"propertyChange":true},[param4[8],param4[9]],param2);
         param5[1].updateParent(param1);
         param5[3].updateParent(param1);
         param5[8].updateParent(param1);
      }
   }
}
