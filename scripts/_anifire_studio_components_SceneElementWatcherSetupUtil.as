package
{
   import anifire.studio.components.SceneElement;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_SceneElementWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_SceneElementWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         SceneElement.watcherSetupUtil = new _anifire_studio_components_SceneElementWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[4] = new PropertyWatcher("_label",{"propertyChange":true},[param4[3]],param2);
         param5[2] = new PropertyWatcher("scene",{"propertyChange":true},[param4[2]],param2);
         param5[3] = new PropertyWatcher("chapterBreak",{"propertyChange":true},[param4[2]],null);
         param5[0] = new PropertyWatcher("cce",{"propertyChange":true},[param4[0]],param2);
         param5[1] = new PropertyWatcher("_isThumbnailReady",{"propertyChange":true},[param4[1]],param2);
         param5[4].updateParent(param1);
         param5[2].updateParent(param1);
         param5[2].addChild(param5[3]);
         param5[0].updateParent(param1);
         param5[1].updateParent(param1);
      }
   }
}
