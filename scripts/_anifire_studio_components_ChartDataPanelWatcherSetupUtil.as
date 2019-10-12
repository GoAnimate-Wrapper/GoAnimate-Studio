package
{
   import anifire.studio.components.ChartDataPanel;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_ChartDataPanelWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_ChartDataPanelWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ChartDataPanel.watcherSetupUtil = new _anifire_studio_components_ChartDataPanelWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("widgetDataGridModel",{"propertyChange":true},[param4[0]],param2);
         param5[0].updateParent(param1);
      }
   }
}
