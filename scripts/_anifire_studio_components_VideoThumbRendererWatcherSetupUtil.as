package
{
   import anifire.studio.components.VideoThumbRenderer;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_VideoThumbRendererWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_VideoThumbRendererWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         VideoThumbRenderer.watcherSetupUtil = new _anifire_studio_components_VideoThumbRendererWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("_editable",{"propertyChange":true},[param4[0]],param2);
         param5[0].updateParent(param1);
      }
   }
}
