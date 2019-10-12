package
{
   import anifire.studio.components.WidgetTitleTextInput;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_WidgetTitleTextInputWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_WidgetTitleTextInputWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         WidgetTitleTextInput.watcherSetupUtil = new _anifire_studio_components_WidgetTitleTextInputWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[2] = new PropertyWatcher("_title",{"propertyChange":true},[param4[2]],param2);
         param5[2].updateParent(param1);
      }
   }
}
