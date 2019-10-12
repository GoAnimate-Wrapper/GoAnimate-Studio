package
{
   import anifire.studio.components.TransitionItemRenderer;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_TransitionItemRendererWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_TransitionItemRendererWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         TransitionItemRenderer.watcherSetupUtil = new _anifire_studio_components_TransitionItemRendererWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[1] = new PropertyWatcher("thumbnailMask",{"propertyChange":true},[param4[1]],param2);
         param5[0] = new PropertyWatcher("_colorType",{"propertyChange":true},[param4[0],param4[2]],param2);
         param5[2] = new PropertyWatcher("_durationIconVisible",{"propertyChange":true},[param4[3],param4[4]],param2);
         param5[1].updateParent(param1);
         param5[0].updateParent(param1);
         param5[2].updateParent(param1);
      }
   }
}
