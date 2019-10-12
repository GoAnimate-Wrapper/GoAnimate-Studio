package
{
   import anifire.studio.components.FileUploadComponent;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_FileUploadComponentWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_FileUploadComponentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         FileUploadComponent.watcherSetupUtil = new _anifire_studio_components_FileUploadComponentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[6] = new PropertyWatcher("_addVoiceButtonLabel",{"propertyChange":true},[param4[6]],param2);
         param5[0] = new PropertyWatcher("uploadingGroup",{"propertyChange":true},[param4[0]],param2);
         param5[5] = new PropertyWatcher("_lineChanged",{"propertyChange":true},[param4[5]],param2);
         param5[1] = new PropertyWatcher("finishGroup",{"propertyChange":true},[param4[1]],param2);
         param5[2] = new PropertyWatcher("browseButton",{"propertyChange":true},[param4[2]],param2);
         param5[6].updateParent(param1);
         param5[0].updateParent(param1);
         param5[5].updateParent(param1);
         param5[1].updateParent(param1);
         param5[2].updateParent(param1);
      }
   }
}
