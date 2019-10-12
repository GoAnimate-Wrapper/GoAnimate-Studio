package
{
   import anifire.studio.components.ChartStylePanel;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_ChartStylePanelWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_ChartStylePanelWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ChartStylePanel.watcherSetupUtil = new _anifire_studio_components_ChartStylePanelWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[7] = new PropertyWatcher("_displayAxisOption",{"propertyChange":true},[param4[10],param4[11]],param2);
         param5[2] = new PropertyWatcher("_displayCounterOption",{"propertyChange":true},[param4[2],param4[3]],param2);
         param5[5] = new PropertyWatcher("_displayLegendOption",{"propertyChange":true},[param4[7],param4[8]],param2);
         param5[3] = new PropertyWatcher("_displayPercentageOption",{"propertyChange":true},[param4[4],param4[5]],param2);
         param5[9] = new PropertyWatcher("_layoutList",{"propertyChange":true},[param4[13],param4[14]],param2);
         param5[10] = new PropertyWatcher("length",{"collectionChange":true},[param4[13]],null);
         param5[7].updateParent(param1);
         param5[2].updateParent(param1);
         param5[5].updateParent(param1);
         param5[3].updateParent(param1);
         param5[9].updateParent(param1);
         param5[9].addChild(param5[10]);
      }
   }
}
