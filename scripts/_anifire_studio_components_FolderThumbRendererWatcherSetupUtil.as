package
{
   import anifire.studio.components.FolderThumbRenderer;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_FolderThumbRendererWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_FolderThumbRendererWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         FolderThumbRenderer.watcherSetupUtil = new _anifire_studio_components_FolderThumbRendererWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[2] = new PropertyWatcher("_editable",{"propertyChange":true},[param4[2]],param2);
         param5[0] = new PropertyWatcher("_labelText",{"propertyChange":true},[param4[0]],param2);
         param5[1] = new PropertyWatcher("_importedDateText",{"propertyChange":true},[param4[1]],param2);
         param5[2].updateParent(param1);
         param5[0].updateParent(param1);
         param5[1].updateParent(param1);
      }
   }
}
