package
{
   import anifire.studio.components.DefaultDropDownListItemRenderer;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_DefaultDropDownListItemRendererWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_DefaultDropDownListItemRendererWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         DefaultDropDownListItemRenderer.watcherSetupUtil = new _anifire_studio_components_DefaultDropDownListItemRendererWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("displaySeparator",{"propertyChange":true},[param4[0],param4[1],param4[2],param4[3],param4[4]],param2);
         param5[2] = new PropertyWatcher("data",{"dataChange":true},[param4[5],param4[6]],param2);
         param5[0].updateParent(param1);
         param5[2].updateParent(param1);
      }
   }
}
