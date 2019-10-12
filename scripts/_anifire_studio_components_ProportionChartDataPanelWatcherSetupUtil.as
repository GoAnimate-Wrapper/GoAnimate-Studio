package
{
   import anifire.studio.components.ProportionChartDataPanel;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_ProportionChartDataPanelWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_ProportionChartDataPanelWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ProportionChartDataPanel.watcherSetupUtil = new _anifire_studio_components_ProportionChartDataPanelWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}
