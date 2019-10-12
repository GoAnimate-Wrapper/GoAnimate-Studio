package
{
   import anifire.studio.components.StarterInfoRenderer;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_StarterInfoRendererWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_StarterInfoRendererWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         StarterInfoRenderer.watcherSetupUtil = new _anifire_studio_components_StarterInfoRendererWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[1] = new PropertyWatcher("_starterId",{"propertyChange":true},[param4[1]],param2);
         param5[0] = new PropertyWatcher("_starterTitle",{"propertyChange":true},[param4[0]],param2);
         param5[1].updateParent(param1);
         param5[0].updateParent(param1);
      }
   }
}
