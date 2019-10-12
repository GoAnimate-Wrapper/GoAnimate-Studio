package
{
   import anifire.studio.components.ColorPickerSwatchRenderer;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_ColorPickerSwatchRendererWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_ColorPickerSwatchRendererWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ColorPickerSwatchRenderer.watcherSetupUtil = new _anifire_studio_components_ColorPickerSwatchRendererWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("data",{"dataChange":true},[param4[0],param4[1],param4[2],param4[3],param4[5],param4[6]],param2);
         param5[1] = new PropertyWatcher("isAddColorButton",null,[param4[0],param4[1],param4[3],param4[5],param4[6]],null);
         param5[2] = new PropertyWatcher("color",null,[param4[2]],null);
         param5[0].updateParent(param1);
         param5[0].addChild(param5[1]);
         param5[0].addChild(param5[2]);
      }
   }
}
