package
{
   import anifire.studio.components.PropertiesWindow;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_PropertiesWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_PropertiesWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         PropertiesWindow.watcherSetupUtil = new _anifire_studio_components_PropertiesWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[3] = new PropertyWatcher("navPanel",{"propertyChange":true},[param4[4]],param2);
         param5[0] = new PropertyWatcher("loading",{"propertyChange":true},[param4[0],param4[1]],param2);
         param5[2] = new PropertyWatcher("title",{"propertyChange":true},[param4[3]],param2);
         param5[1] = new PropertyWatcher("slideContainerGroup",{"propertyChange":true},[param4[2]],param2);
         param5[3].updateParent(param1);
         param5[0].updateParent(param1);
         param5[2].updateParent(param1);
         param5[1].updateParent(param1);
      }
   }
}
