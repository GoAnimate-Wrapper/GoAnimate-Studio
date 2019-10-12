package
{
   import anifire.studio.components.Timeline;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_TimelineWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_TimelineWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         Timeline.watcherSetupUtil = new _anifire_studio_components_TimelineWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("scrollContentHeight",{"propertyChange":true},[param4[0]],param2);
         param5[1] = new PropertyWatcher("processingStarter",{"propertyChange":true},[param4[1]],param2);
         param5[0].updateParent(param1);
         param5[1].updateParent(param1);
      }
   }
}
