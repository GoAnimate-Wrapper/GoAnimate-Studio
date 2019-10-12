package
{
   import anifire.studio.components.PublishWindow;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_PublishWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_PublishWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         PublishWindow.watcherSetupUtil = new _anifire_studio_components_PublishWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("movieTitleInput",{"propertyChange":true},[param4[0]],param2);
         param5[2] = new PropertyWatcher("movieDescriptionInput",{"propertyChange":true},[param4[2]],param2);
         param5[1] = new PropertyWatcher("movieTagsInput",{"propertyChange":true},[param4[1]],param2);
         param5[23] = new PropertyWatcher("showWatermark",{"propertyChange":true},[param4[24],param4[25]],param2);
         param5[0].updateParent(param1);
         param5[2].updateParent(param1);
         param5[1].updateParent(param1);
         param5[23].updateParent(param1);
      }
   }
}
