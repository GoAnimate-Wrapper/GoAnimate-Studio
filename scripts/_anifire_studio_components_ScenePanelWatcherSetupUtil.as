package
{
   import anifire.studio.components.ScenePanel;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_ScenePanelWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_ScenePanelWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ScenePanel.watcherSetupUtil = new _anifire_studio_components_ScenePanelWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[1] = new PropertyWatcher("normalPage",{"propertyChange":true},[param4[1]],param2);
         param5[2] = new PropertyWatcher("width",{"widthChanged":true},[param4[1]],null);
         param5[0] = new PropertyWatcher("containerGroup",{"propertyChange":true},[param4[0]],param2);
         param5[1].updateParent(param1);
         param5[1].addChild(param5[2]);
         param5[0].updateParent(param1);
      }
   }
}
