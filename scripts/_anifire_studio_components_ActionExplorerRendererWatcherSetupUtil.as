package
{
   import anifire.studio.components.ActionExplorerRenderer;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_ActionExplorerRendererWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_ActionExplorerRendererWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ActionExplorerRenderer.watcherSetupUtil = new _anifire_studio_components_ActionExplorerRendererWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[1] = new PropertyWatcher("imageDisplay",{"propertyChange":true},[param4[1]],param2);
         param5[2] = new PropertyWatcher("enabled",{"enabledChanged":true},[param4[1]],null);
         param5[0] = new PropertyWatcher("toolTipContent",{"propertyChange":true},[param4[0]],param2);
         param5[1].updateParent(param1);
         param5[1].addChild(param5[2]);
         param5[0].updateParent(param1);
      }
   }
}
