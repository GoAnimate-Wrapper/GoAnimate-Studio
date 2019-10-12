package
{
   import anifire.studio.components.SpeechPitchControl;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_SpeechPitchControlWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_SpeechPitchControlWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         SpeechPitchControl.watcherSetupUtil = new _anifire_studio_components_SpeechPitchControlWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[3] = new PropertyWatcher("pitch",{"propertyChange":true},[param4[3]],param2);
         param5[3].updateParent(param1);
      }
   }
}
