package
{
   import anifire.studio.components.EditAssetPopUp;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_EditAssetPopUpWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_EditAssetPopUpWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         EditAssetPopUp.watcherSetupUtil = new _anifire_studio_components_EditAssetPopUpWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[10] = new PropertyWatcher("showTags",{"propertyChange":true},[param4[10],param4[11]],param2);
         param5[6] = new PropertyWatcher("showIDLabel",{"propertyChange":true},[param4[5],param4[6]],param2);
         param5[0] = new PropertyWatcher("nameInput",{"propertyChange":true},[param4[0]],param2);
         param5[3] = new PropertyWatcher("cancelText",{"propertyChange":true},[param4[2]],param2);
         param5[7] = new PropertyWatcher("nameLabel",{"propertyChange":true},[param4[7]],param2);
         param5[18] = new PropertyWatcher("optionPublicLabel",{"propertyChange":true},[param4[23]],param2);
         param5[4] = new PropertyWatcher("confirmText",{"propertyChange":true},[param4[3]],param2);
         param5[17] = new PropertyWatcher("showPublishOptions",{"propertyChange":true},[param4[21],param4[22]],param2);
         param5[16] = new PropertyWatcher("showTeamSelection",{"propertyChange":true},[param4[19],param4[20]],param2);
         param5[8] = new PropertyWatcher("nameLabelEditable",{"propertyChange":true},[param4[8]],param2);
         param5[19] = new PropertyWatcher("optionPrivateLabel",{"propertyChange":true},[param4[24]],param2);
         param5[14] = new PropertyWatcher("_showPublicCheckBox",{"propertyChange":true},[param4[16],param4[17]],param2);
         param5[15] = new PropertyWatcher("sharingLabel",{"propertyChange":true},[param4[18]],param2);
         param5[9] = new PropertyWatcher("tagsLabel",{"propertyChange":true},[param4[9]],param2);
         param5[12] = new PropertyWatcher("_showCategoryInput",{"propertyChange":true},[param4[13],param4[14]],param2);
         param5[10].updateParent(param1);
         param5[6].updateParent(param1);
         param5[0].updateParent(param1);
         param5[3].updateParent(param1);
         param5[7].updateParent(param1);
         param5[18].updateParent(param1);
         param5[4].updateParent(param1);
         param5[17].updateParent(param1);
         param5[16].updateParent(param1);
         param5[8].updateParent(param1);
         param5[19].updateParent(param1);
         param5[14].updateParent(param1);
         param5[15].updateParent(param1);
         param5[9].updateParent(param1);
         param5[12].updateParent(param1);
      }
   }
}
