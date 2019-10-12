package
{
   import anifire.studio.components.VoiceThumbRenderer;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_VoiceThumbRendererWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_VoiceThumbRendererWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         VoiceThumbRenderer.watcherSetupUtil = new _anifire_studio_components_VoiceThumbRendererWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("_labelText",{"propertyChange":true},[param4[0]],param2);
         param5[1] = new PropertyWatcher("_durationText",{"propertyChange":true},[param4[1]],param2);
         param5[2] = new PropertyWatcher("_playing",{"propertyChange":true},[param4[2],param4[3]],param2);
         param5[0].updateParent(param1);
         param5[1].updateParent(param1);
         param5[2].updateParent(param1);
      }
   }
}
