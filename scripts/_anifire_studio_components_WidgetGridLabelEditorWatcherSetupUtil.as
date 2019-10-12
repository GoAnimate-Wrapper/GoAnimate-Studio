package
{
   import anifire.studio.components.WidgetGridLabelEditor;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_WidgetGridLabelEditorWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_WidgetGridLabelEditorWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         WidgetGridLabelEditor.watcherSetupUtil = new _anifire_studio_components_WidgetGridLabelEditorWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[4] = new PropertyWatcher("_colorPickerVisible",{"propertyChange":true},[param4[5],param4[6]],param2);
         param5[4].updateParent(param1);
      }
   }
}
