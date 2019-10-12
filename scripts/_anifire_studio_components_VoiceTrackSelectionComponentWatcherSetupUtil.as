package
{
   import anifire.studio.components.VoiceTrackSelectionComponent;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_VoiceTrackSelectionComponentWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_VoiceTrackSelectionComponentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         VoiceTrackSelectionComponent.watcherSetupUtil = new _anifire_studio_components_VoiceTrackSelectionComponentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[3] = new PropertyWatcher("soundsCollection",{"propertyChange":true},[param4[3]],param2);
         param5[3].updateParent(param1);
      }
   }
}
