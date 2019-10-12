package
{
   import anifire.studio.components.CameraPanel;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_CameraPanelWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_CameraPanelWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         CameraPanel.watcherSetupUtil = new _anifire_studio_components_CameraPanelWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[8] = new PropertyWatcher("_hasCameraPan",{"propertyChange":true},[param4[8],param4[9],param4[17]],param2);
         param5[8].updateParent(param1);
      }
   }
}
