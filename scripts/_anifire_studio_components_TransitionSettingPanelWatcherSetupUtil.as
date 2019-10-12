package
{
   import anifire.studio.components.TransitionSettingPanel;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_TransitionSettingPanelWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_TransitionSettingPanelWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         TransitionSettingPanel.watcherSetupUtil = new _anifire_studio_components_TransitionSettingPanelWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[12] = new PropertyWatcher("_timingSource",{"propertyChange":true},[param4[15]],param2);
         param5[8] = new PropertyWatcher("_destinationSource",{"propertyChange":true},[param4[11]],param2);
         param5[5] = new PropertyWatcher("_showActionName",{"propertyChange":true},[param4[5],param4[6],param4[7],param4[8]],param2);
         param5[6] = new PropertyWatcher("_actionName",{"propertyChange":true},[param4[9]],param2);
         param5[11] = new PropertyWatcher("_selectedTimingItem",{"propertyChange":true},[param4[14]],param2);
         param5[1] = new PropertyWatcher("_directionSource",{"propertyChange":true},[param4[1]],param2);
         param5[2] = new PropertyWatcher("_sectionSource",{"propertyChange":true},[param4[2]],param2);
         param5[4] = new PropertyWatcher("_typeSource",{"propertyChange":true},[param4[4]],param2);
         param5[12].updateParent(param1);
         param5[8].updateParent(param1);
         param5[5].updateParent(param1);
         param5[6].updateParent(param1);
         param5[11].updateParent(param1);
         param5[1].updateParent(param1);
         param5[2].updateParent(param1);
         param5[4].updateParent(param1);
      }
   }
}
