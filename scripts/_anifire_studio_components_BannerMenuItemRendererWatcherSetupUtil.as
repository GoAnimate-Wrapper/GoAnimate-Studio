package
{
   import anifire.studio.components.BannerMenuItemRenderer;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_BannerMenuItemRendererWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_BannerMenuItemRendererWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         BannerMenuItemRenderer.watcherSetupUtil = new _anifire_studio_components_BannerMenuItemRendererWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("model",{"propertyChange":true},[param4[0],param4[1]],param2);
         param5[1] = new PropertyWatcher("enabled",{"propertyChange":true},[param4[0],param4[1]],null);
         param5[0].updateParent(param1);
         param5[0].addChild(param5[1]);
      }
   }
}
