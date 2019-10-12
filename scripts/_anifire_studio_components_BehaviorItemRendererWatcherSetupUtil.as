package
{
   import anifire.studio.components.BehaviorItemRenderer;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_BehaviorItemRendererWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_BehaviorItemRendererWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         BehaviorItemRenderer.watcherSetupUtil = new _anifire_studio_components_BehaviorItemRendererWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[1] = new PropertyWatcher("model",{"propertyChange":true},[param4[1],param4[2]],param2);
         param5[2] = new PropertyWatcher("enabled",{"propertyChange":true},[param4[1],param4[2]],null);
         param5[0] = new PropertyWatcher("displaySeparator",{"propertyChange":true},[param4[0],param4[3],param4[4],param4[5],param4[6],param4[7]],param2);
         param5[1].updateParent(param1);
         param5[1].addChild(param5[2]);
         param5[0].updateParent(param1);
      }
   }
}
