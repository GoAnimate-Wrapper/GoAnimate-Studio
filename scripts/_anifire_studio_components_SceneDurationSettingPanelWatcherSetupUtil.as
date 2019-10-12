package
{
   import anifire.studio.components.SceneDurationSettingPanel;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_SceneDurationSettingPanelWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_SceneDurationSettingPanelWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         SceneDurationSettingPanel.watcherSetupUtil = new _anifire_studio_components_SceneDurationSettingPanelWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[9] = new PropertyWatcher("isAllChecked",{"propertyChange":true},[param4[8]],param2);
         param5[7] = new PropertyWatcher("_duration",{"propertyChange":true},[param4[7]],param2);
         param5[9].updateParent(param1);
         param5[7].updateParent(param1);
      }
   }
}
