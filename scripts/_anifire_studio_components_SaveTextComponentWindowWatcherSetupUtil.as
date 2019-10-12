package
{
   import anifire.studio.components.SaveTextComponentWindow;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_SaveTextComponentWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_SaveTextComponentWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         SaveTextComponentWindow.watcherSetupUtil = new _anifire_studio_components_SaveTextComponentWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[7] = new PropertyWatcher("_textComponents",{"propertyChange":true},[param4[6]],param2);
         param5[5] = new PropertyWatcher("replaceTextComponentCheckbox",{"propertyChange":true},[param4[5]],param2);
         param5[6] = new PropertyWatcher("selected",{"propertyChange":true},[param4[5]],null);
         param5[7].updateParent(param1);
         param5[5].updateParent(param1);
         param5[5].addChild(param5[6]);
      }
   }
}
