package
{
   import anifire.studio.components.BackgroundThumbRenderer;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_BackgroundThumbRendererWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_BackgroundThumbRendererWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         BackgroundThumbRenderer.watcherSetupUtil = new _anifire_studio_components_BackgroundThumbRendererWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[5] = new PropertyWatcher("_sceneNumberText",{"propertyChange":true},[param4[5]],param2);
         param5[6] = new PropertyWatcher("_editable",{"propertyChange":true},[param4[6]],param2);
         param5[3] = new PropertyWatcher("_isStarter",{"propertyChange":true},[param4[3]],param2);
         param5[0] = new PropertyWatcher("wideMode",{"propertyChange":true},[param4[0]],param2);
         param5[2] = new PropertyWatcher("_starterIdText",{"propertyChange":true},[param4[2]],param2);
         param5[4] = new PropertyWatcher("_isMultipleScenesStarter",{"propertyChange":true},[param4[4]],param2);
         param5[7] = new PropertyWatcher("_shouldAllowDelete",{"propertyChange":true},[param4[7]],param2);
         param5[1] = new PropertyWatcher("_showId",{"propertyChange":true},[param4[1]],param2);
         param5[5].updateParent(param1);
         param5[6].updateParent(param1);
         param5[3].updateParent(param1);
         param5[0].updateParent(param1);
         param5[2].updateParent(param1);
         param5[4].updateParent(param1);
         param5[7].updateParent(param1);
         param5[1].updateParent(param1);
      }
   }
}
