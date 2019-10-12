package
{
   import anifire.studio.components.SoundWaveformRenderer;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_SoundWaveformRendererWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_SoundWaveformRendererWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         SoundWaveformRenderer.watcherSetupUtil = new _anifire_studio_components_SoundWaveformRendererWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("_color",{"propertyChange":true},[param4[0],param4[3]],param2);
         param5[0].updateParent(param1);
      }
   }
}
