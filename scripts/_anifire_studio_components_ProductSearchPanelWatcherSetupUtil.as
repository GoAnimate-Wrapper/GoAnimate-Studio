package
{
   import anifire.studio.components.ProductSearchPanel;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_ProductSearchPanelWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_ProductSearchPanelWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ProductSearchPanel.watcherSetupUtil = new _anifire_studio_components_ProductSearchPanelWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[5] = new PropertyWatcher("_resultCollection",{"propertyChange":true},[param4[6]],param2);
         param5[2] = new PropertyWatcher("_selectedThemeId",{"propertyChange":true},[param4[3]],param2);
         param5[1] = new PropertyWatcher("_showThemeSelectButton",{"propertyChange":true},[param4[1],param4[2]],param2);
         param5[3] = new PropertyWatcher("_themeSource",{"propertyChange":true},[param4[4]],param2);
         param5[5].updateParent(param1);
         param5[2].updateParent(param1);
         param5[1].updateParent(param1);
         param5[3].updateParent(param1);
      }
   }
}
