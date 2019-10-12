package
{
   import anifire.studio.components.NumberFormatRenderer;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_NumberFormatRendererWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_NumberFormatRendererWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         NumberFormatRenderer.watcherSetupUtil = new _anifire_studio_components_NumberFormatRendererWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("validItem",{"propertyChange":true},[param4[0],param4[1],param4[2],param4[3],param4[4],param4[5],param4[6],param4[7]],param2);
         param5[0].updateParent(param1);
      }
   }
}
