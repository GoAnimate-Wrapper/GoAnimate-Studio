package
{
   import anifire.studio.components.MicRecordingComponent;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_MicRecordingComponentWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_MicRecordingComponentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         MicRecordingComponent.watcherSetupUtil = new _anifire_studio_components_MicRecordingComponentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[20] = new PropertyWatcher("errorMessage",{"propertyChange":true},[param4[18]],param2);
         param5[8] = new PropertyWatcher("_addVoiceButtonLabel",{"propertyChange":true},[param4[6]],param2);
         param5[0] = new PropertyWatcher("mainInfoPanel",{"propertyChange":true},[param4[0],param4[1]],param2);
         param5[10] = new PropertyWatcher("micLevelMask",{"propertyChange":true},[param4[8]],param2);
         param5[1] = new PropertyWatcher("buttonGroup",{"propertyChange":true},[param4[0],param4[1]],param2);
         param5[4] = new PropertyWatcher("mainInfoText",{"propertyChange":true},[param4[2]],param2);
         param5[9] = new PropertyWatcher("_lineChanged",{"propertyChange":true},[param4[7]],param2);
         param5[2] = new PropertyWatcher("mainRecordPanel",{"propertyChange":true},[param4[0],param4[1]],param2);
         param5[3] = new PropertyWatcher("mainInfoPanelText",{"propertyChange":true},[param4[0],param4[1]],param2);
         param5[5] = new PropertyWatcher("sliderGroup",{"propertyChange":true},[param4[3]],param2);
         param5[20].updateParent(param1);
         param5[8].updateParent(param1);
         param5[0].updateParent(param1);
         param5[10].updateParent(param1);
         param5[1].updateParent(param1);
         param5[4].updateParent(param1);
         param5[9].updateParent(param1);
         param5[2].updateParent(param1);
         param5[3].updateParent(param1);
         param5[5].updateParent(param1);
      }
   }
}
