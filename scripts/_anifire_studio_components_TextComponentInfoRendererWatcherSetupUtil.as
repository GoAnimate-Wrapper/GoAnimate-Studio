package
{
   import anifire.studio.components.TextComponentInfoRenderer;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_TextComponentInfoRendererWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_TextComponentInfoRendererWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         TextComponentInfoRenderer.watcherSetupUtil = new _anifire_studio_components_TextComponentInfoRendererWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("_textComponentName",{"propertyChange":true},[param4[0]],param2);
         param5[1] = new PropertyWatcher("_textComponentId",{"propertyChange":true},[param4[1]],param2);
         param5[0].updateParent(param1);
         param5[1].updateParent(param1);
      }
   }
}
