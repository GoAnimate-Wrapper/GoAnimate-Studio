package
{
   import anifire.studio.components.FontDropDownListItemRenderer;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_FontDropDownListItemRendererWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_FontDropDownListItemRendererWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         FontDropDownListItemRenderer.watcherSetupUtil = new _anifire_studio_components_FontDropDownListItemRendererWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("_displayImage",{"propertyChange":true},[param4[0],param4[2]],param2);
         param5[1] = new PropertyWatcher("_imageSource",{"propertyChange":true},[param4[1]],param2);
         param5[0].updateParent(param1);
         param5[1].updateParent(param1);
      }
   }
}
