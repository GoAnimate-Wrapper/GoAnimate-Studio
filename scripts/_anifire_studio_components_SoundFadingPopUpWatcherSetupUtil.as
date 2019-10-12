package
{
   import anifire.studio.components.SoundFadingPopUp;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_SoundFadingPopUpWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_SoundFadingPopUpWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         SoundFadingPopUp.watcherSetupUtil = new _anifire_studio_components_SoundFadingPopUpWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[9] = new PropertyWatcher("_isPlaying",{"propertyChange":true},[param4[10]],param2);
         param5[8] = new PropertyWatcher("sound",{"propertyChange":true},[param4[8],param4[9]],param2);
         param5[9].updateParent(param1);
         param5[8].updateParent(param1);
      }
   }
}
