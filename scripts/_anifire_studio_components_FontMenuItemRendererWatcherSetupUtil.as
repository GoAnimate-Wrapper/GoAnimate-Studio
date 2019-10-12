package
{
   import anifire.studio.components.FontMenuItemRenderer;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_FontMenuItemRendererWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_FontMenuItemRendererWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         FontMenuItemRenderer.watcherSetupUtil = new _anifire_studio_components_FontMenuItemRendererWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[1] = new PropertyWatcher("model",{"propertyChange":true},[param4[1],param4[2]],param2);
         param5[2] = new PropertyWatcher("enabled",{"propertyChange":true},[param4[1],param4[2]],null);
         param5[0] = new PropertyWatcher("displayOverlay",{"propertyChange":true},[param4[0],param4[3]],param2);
         param5[3] = new PropertyWatcher("displayImage",{"propertyChange":true},[param4[4],param4[6]],param2);
         param5[4] = new PropertyWatcher("_imageSource",{"propertyChange":true},[param4[5]],param2);
         param5[1].updateParent(param1);
         param5[1].addChild(param5[2]);
         param5[0].updateParent(param1);
         param5[3].updateParent(param1);
         param5[4].updateParent(param1);
      }
   }
}
