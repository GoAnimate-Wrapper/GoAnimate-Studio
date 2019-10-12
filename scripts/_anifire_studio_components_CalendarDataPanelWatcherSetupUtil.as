package
{
   import anifire.studio.components.CalendarDataPanel;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_CalendarDataPanelWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_CalendarDataPanelWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         CalendarDataPanel.watcherSetupUtil = new _anifire_studio_components_CalendarDataPanelWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[13] = new PropertyWatcher("_endDayList",{"propertyChange":true},[param4[13]],param2);
         param5[5] = new PropertyWatcher("_yearList",{"propertyChange":true},[param4[5]],param2);
         param5[11] = new PropertyWatcher("_dayList",{"propertyChange":true},[param4[11]],param2);
         param5[7] = new PropertyWatcher("_monthList",{"propertyChange":true},[param4[7]],param2);
         param5[13].updateParent(param1);
         param5[5].updateParent(param1);
         param5[11].updateParent(param1);
         param5[7].updateParent(param1);
      }
   }
}
