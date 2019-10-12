package
{
   import anifire.studio.components.FlowFrameStylePanel;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_FlowFrameStylePanelWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_FlowFrameStylePanelWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         FlowFrameStylePanel.watcherSetupUtil = new _anifire_studio_components_FlowFrameStylePanelWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[9] = new PropertyWatcher("_propSource",{"propertyChange":true},[param4[9]],param2);
         param5[3] = new PropertyWatcher("_showScaleButton",{"propertyChange":true},[param4[3]],param2);
         param5[0] = new PropertyWatcher("containerGroup",{"propertyChange":true},[param4[0]],param2);
         param5[9].updateParent(param1);
         param5[3].updateParent(param1);
         param5[0].updateParent(param1);
      }
   }
}
