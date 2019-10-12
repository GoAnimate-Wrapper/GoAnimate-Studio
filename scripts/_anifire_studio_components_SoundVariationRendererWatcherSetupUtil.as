package
{
   import anifire.studio.components.SoundVariationRenderer;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_SoundVariationRendererWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_SoundVariationRendererWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         SoundVariationRenderer.watcherSetupUtil = new _anifire_studio_components_SoundVariationRendererWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[2] = new PropertyWatcher("_labelText",{"propertyChange":true},[param4[5]],param2);
         param5[0] = new PropertyWatcher("_durationText",{"propertyChange":true},[param4[0]],param2);
         param5[5] = new PropertyWatcher("_playing",{"propertyChange":true},[param4[11],param4[12]],param2);
         param5[1] = new PropertyWatcher("_previewOnly",{"propertyChange":true},[param4[1],param4[2],param4[3],param4[4],param4[6],param4[7],param4[8],param4[9]],param2);
         param5[2].updateParent(param1);
         param5[0].updateParent(param1);
         param5[5].updateParent(param1);
         param5[1].updateParent(param1);
      }
   }
}
