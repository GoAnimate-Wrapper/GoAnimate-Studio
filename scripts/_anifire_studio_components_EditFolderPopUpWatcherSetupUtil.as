package
{
   import anifire.studio.components.EditFolderPopUp;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_EditFolderPopUpWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_EditFolderPopUpWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         EditFolderPopUp.watcherSetupUtil = new _anifire_studio_components_EditFolderPopUpWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[4] = new PropertyWatcher("confirmText",{"propertyChange":true},[param4[3]],param2);
         param5[0] = new PropertyWatcher("nameInput",{"propertyChange":true},[param4[0]],param2);
         param5[3] = new PropertyWatcher("cancelText",{"propertyChange":true},[param4[2]],param2);
         param5[5] = new PropertyWatcher("_nameLabel",{"propertyChange":true},[param4[4]],param2);
         param5[4].updateParent(param1);
         param5[0].updateParent(param1);
         param5[3].updateParent(param1);
         param5[5].updateParent(param1);
      }
   }
}
