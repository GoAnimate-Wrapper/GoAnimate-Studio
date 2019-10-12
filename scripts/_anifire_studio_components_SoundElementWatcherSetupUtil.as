package
{
   import anifire.studio.components.SoundElement;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_SoundElementWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_SoundElementWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         SoundElement.watcherSetupUtil = new _anifire_studio_components_SoundElementWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[2] = new PropertyWatcher("animeSound",{"propertyChange":true},[param4[1]],param2);
         param5[1] = new PropertyWatcher("_displayVolume",{"propertyChange":true},[param4[0]],param2);
         param5[0] = new PropertyWatcher("hovered",{"propertyChange":true},[param4[0]],param2);
         param5[3] = new PropertyWatcher("displayError",{"propertyChange":true},[param4[2]],param2);
         param5[2].updateParent(param1);
         param5[1].updateParent(param1);
         param5[0].updateParent(param1);
         param5[3].updateParent(param1);
      }
   }
}
