package
{
   import anifire.studio.components.WidgetGridHeaderRenderer;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_WidgetGridHeaderRendererWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_WidgetGridHeaderRendererWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         WidgetGridHeaderRenderer.watcherSetupUtil = new _anifire_studio_components_WidgetGridHeaderRendererWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("_selected",{"propertyChange":true},[param4[0],param4[2]],param2);
         param5[7] = new PropertyWatcher("_colorPickerVisible",{"propertyChange":true},[param4[8],param4[9],param4[14],param4[15]],param2);
         param5[6] = new PropertyWatcher("_color",{"propertyChange":true},[param4[7]],param2);
         param5[0].updateParent(param1);
         param5[7].updateParent(param1);
         param5[6].updateParent(param1);
      }
   }
}
