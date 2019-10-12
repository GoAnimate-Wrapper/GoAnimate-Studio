package
{
   import anifire.studio.components.WidgetGridLabelRenderer;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_WidgetGridLabelRendererWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_WidgetGridLabelRendererWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         WidgetGridLabelRenderer.watcherSetupUtil = new _anifire_studio_components_WidgetGridLabelRendererWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[1] = new PropertyWatcher("_selected",{"propertyChange":true},[param4[1],param4[3]],param2);
         param5[8] = new PropertyWatcher("_colorPickerVisible",{"propertyChange":true},[param4[8],param4[9]],param2);
         param5[6] = new PropertyWatcher("data",{"dataChange":true},[param4[7]],param2);
         param5[7] = new PropertyWatcher("color",null,[param4[7]],null);
         param5[1].updateParent(param1);
         param5[8].updateParent(param1);
         param5[6].updateParent(param1);
         param5[6].addChild(param5[7]);
      }
   }
}
