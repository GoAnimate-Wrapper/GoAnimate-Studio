package
{
   import anifire.studio.components.IconWidgetStylePanel;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_IconWidgetStylePanelWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_IconWidgetStylePanelWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         IconWidgetStylePanel.watcherSetupUtil = new _anifire_studio_components_IconWidgetStylePanelWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[10] = new PropertyWatcher("_propSource",{"propertyChange":true},[param4[11]],param2);
         param5[4] = new PropertyWatcher("showGridOptions",{"propertyChange":true},[param4[4],param4[5]],param2);
         param5[0] = new PropertyWatcher("containerGroup",{"propertyChange":true},[param4[0]],param2);
         param5[10].updateParent(param1);
         param5[4].updateParent(param1);
         param5[0].updateParent(param1);
      }
   }
}
