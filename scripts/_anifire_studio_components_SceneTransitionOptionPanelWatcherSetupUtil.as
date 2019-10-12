package
{
   import anifire.studio.components.SceneTransitionOptionPanel;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_SceneTransitionOptionPanelWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_SceneTransitionOptionPanelWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         SceneTransitionOptionPanel.watcherSetupUtil = new _anifire_studio_components_SceneTransitionOptionPanelWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[12] = new PropertyWatcher("_sizeSource",{"propertyChange":true},[param4[9]],param2);
         param5[49] = new PropertyWatcher("_colorSource",{"propertyChange":true},[param4[28]],param2);
         param5[3] = new PropertyWatcher("_selectedTrans",{"propertyChange":true},[param4[3],param4[4]],param2);
         param5[50] = new PropertyWatcher("_directionSource",{"propertyChange":true},[param4[29]],param2);
         param5[12].updateParent(param1);
         param5[49].updateParent(param1);
         param5[3].updateParent(param1);
         param5[50].updateParent(param1);
      }
   }
}
