package
{
   import anifire.studio.components.DialogPanel;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_DialogPanelWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_DialogPanelWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         DialogPanel.watcherSetupUtil = new _anifire_studio_components_DialogPanelWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[1] = new PropertyWatcher("_showOverlapWarning",{"propertyChange":true},[param4[1],param4[2]],param2);
         param5[4] = new PropertyWatcher("unassignedVoiceCollection",{"propertyChange":true},[param4[5]],param2);
         param5[3] = new PropertyWatcher("assignedVoiceCollection",{"propertyChange":true},[param4[4]],param2);
         param5[1].updateParent(param1);
         param5[4].updateParent(param1);
         param5[3].updateParent(param1);
      }
   }
}
