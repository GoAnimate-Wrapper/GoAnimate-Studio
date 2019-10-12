package
{
   import anifire.studio.components.AssetControlBar;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_AssetControlBarWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_AssetControlBarWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         AssetControlBar.watcherSetupUtil = new _anifire_studio_components_AssetControlBarWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[2] = new PropertyWatcher("flipOnlyMode",{"propertyChange":true},[param4[3],param4[19],param4[32],param4[36],param4[40],param4[44],param4[48],param4[52],param4[55]],param2);
         param5[14] = new PropertyWatcher("displayFlipButton",{"propertyChange":true},[param4[26],param4[27]],param2);
         param5[19] = new PropertyWatcher("displayPreviewButton",{"propertyChange":true},[param4[37],param4[38]],param2);
         param5[27] = new PropertyWatcher("displayDeleteButton",{"propertyChange":true},[param4[53],param4[54]],param2);
         param5[7] = new PropertyWatcher("displaySlideButton",{"propertyChange":true},[param4[13],param4[14],param4[15],param4[16]],param2);
         param5[4] = new PropertyWatcher("displaySwapDropDown",{"propertyChange":true},[param4[5],param4[6],param4[11],param4[12]],param2);
         param5[8] = new PropertyWatcher("displayAddMovementDropDownList",{"propertyChange":true},[param4[13],param4[14],param4[20],param4[21]],param2);
         param5[0] = new PropertyWatcher("fadeIn",{"propertyChange":true},[param4[0]],param2);
         param5[23] = new PropertyWatcher("displayPasteButton",{"propertyChange":true},[param4[45],param4[46]],param2);
         param5[11] = new PropertyWatcher("isSliding",{"propertyChange":true},[param4[18]],param2);
         param5[9] = new PropertyWatcher("displayRemoveMovementDropDownList",{"propertyChange":true},[param4[13],param4[14],param4[23],param4[24]],param2);
         param5[16] = new PropertyWatcher("displayLayerButtons",{"propertyChange":true},[param4[29],param4[30],param4[33],param4[34]],param2);
         param5[3] = new PropertyWatcher("displaySwapButton",{"propertyChange":true},[param4[5],param4[6],param4[8],param4[9]],param2);
         param5[1] = new PropertyWatcher("isOnStage",{"propertyChange":true},[param4[1],param4[2],param4[4]],param2);
         param5[25] = new PropertyWatcher("displayClearButton",{"propertyChange":true},[param4[49],param4[50]],param2);
         param5[21] = new PropertyWatcher("displayCopyButton",{"propertyChange":true},[param4[41],param4[42]],param2);
         param5[2].updateParent(param1);
         param5[14].updateParent(param1);
         param5[19].updateParent(param1);
         param5[27].updateParent(param1);
         param5[7].updateParent(param1);
         param5[4].updateParent(param1);
         param5[8].updateParent(param1);
         param5[0].updateParent(param1);
         param5[23].updateParent(param1);
         param5[11].updateParent(param1);
         param5[9].updateParent(param1);
         param5[16].updateParent(param1);
         param5[3].updateParent(param1);
         param5[1].updateParent(param1);
         param5[25].updateParent(param1);
         param5[21].updateParent(param1);
      }
   }
}
