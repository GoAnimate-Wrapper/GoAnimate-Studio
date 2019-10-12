package
{
   import anifire.studio.components.UserVoiceLibComponent;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_UserVoiceLibComponentWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_UserVoiceLibComponentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         UserVoiceLibComponent.watcherSetupUtil = new _anifire_studio_components_UserVoiceLibComponentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[6] = new PropertyWatcher("_lineChanged",{"propertyChange":true},[param4[5]],param2);
         param5[5] = new PropertyWatcher("_addVoiceButtonLabel",{"propertyChange":true},[param4[4]],param2);
         param5[3] = new PropertyWatcher("userSoundExplorer",{"propertyChange":true},[param4[3]],param2);
         param5[4] = new PropertyWatcher("selectedProduct",{"propertyChange":true},[param4[3]],null);
         param5[11] = new PropertyWatcher("_userAssetManager",{"propertyChange":true},[param4[10]],param2);
         param5[12] = new PropertyWatcher("voiceTabSoundSource",{
            "userSoundAdded":true,
            "userSoundComplete":true,
            "userSoundRemoved":true
         },[param4[10]],null);
         param5[6].updateParent(param1);
         param5[5].updateParent(param1);
         param5[3].updateParent(param1);
         param5[3].addChild(param5[4]);
         param5[11].updateParent(param1);
         param5[11].addChild(param5[12]);
      }
   }
}
