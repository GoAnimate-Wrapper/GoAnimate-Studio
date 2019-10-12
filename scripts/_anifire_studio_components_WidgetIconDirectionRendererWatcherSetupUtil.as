package
{
   import anifire.studio.components.WidgetIconDirectionRenderer;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_WidgetIconDirectionRendererWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_WidgetIconDirectionRendererWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         WidgetIconDirectionRenderer.watcherSetupUtil = new _anifire_studio_components_WidgetIconDirectionRendererWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[1] = new PropertyWatcher("model",{"propertyChange":true},[param4[1],param4[2],param4[8],param4[9],param4[10]],param2);
         param5[4] = new PropertyWatcher("icon",{"propertyChange":true},[param4[8],param4[9],param4[10]],null);
         param5[2] = new PropertyWatcher("enabled",{"propertyChange":true},[param4[1],param4[2]],null);
         param5[0] = new PropertyWatcher("displayOverlay",{"propertyChange":true},[param4[0],param4[3]],param2);
         param5[3] = new PropertyWatcher("displaySeparator",{"propertyChange":true},[param4[4],param4[5],param4[6],param4[7]],param2);
         param5[1].updateParent(param1);
         param5[1].addChild(param5[4]);
         param5[1].addChild(param5[2]);
         param5[0].updateParent(param1);
         param5[3].updateParent(param1);
      }
   }
}
