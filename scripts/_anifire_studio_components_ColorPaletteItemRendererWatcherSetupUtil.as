package
{
   import anifire.studio.components.ColorPaletteItemRenderer;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_ColorPaletteItemRendererWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_ColorPaletteItemRendererWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ColorPaletteItemRenderer.watcherSetupUtil = new _anifire_studio_components_ColorPaletteItemRendererWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("data",{"dataChange":true},[param4[0]],param2);
         param5[0].updateParent(param1);
      }
   }
}
