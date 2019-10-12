package
{
   import anifire.studio.components.SwapAssetPanel;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_SwapAssetPanelWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_SwapAssetPanelWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         SwapAssetPanel.watcherSetupUtil = new _anifire_studio_components_SwapAssetPanelWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[7] = new PropertyWatcher("_characterSource",{"propertyChange":true},[param4[8]],param2);
         param5[4] = new PropertyWatcher("_propSource",{"propertyChange":true},[param4[4]],param2);
         param5[5] = new PropertyWatcher("_flowFrameSource",{"propertyChange":true},[param4[6]],param2);
         param5[3] = new PropertyWatcher("_suggestionEnabled",{"propertyChange":true},[param4[3],param4[5],param4[9]],param2);
         param5[2] = new PropertyWatcher("_backdropSource",{"propertyChange":true},[param4[2]],param2);
         param5[6] = new PropertyWatcher("_widgetSource",{"propertyChange":true},[param4[7]],param2);
         param5[7].updateParent(param1);
         param5[4].updateParent(param1);
         param5[5].updateParent(param1);
         param5[3].updateParent(param1);
         param5[2].updateParent(param1);
         param5[6].updateParent(param1);
      }
   }
}
