package
{
   import anifire.studio.components.TTSComponent;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_TTSComponentWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_TTSComponentWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         TTSComponent.watcherSetupUtil = new _anifire_studio_components_TTSComponentWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[12] = new PropertyWatcher("languageSource",{"propertyChange":true},[param4[12]],param2);
         param5[6] = new PropertyWatcher("_addVoiceButtonLabel",{"propertyChange":true},[param4[6]],param2);
         param5[0] = new PropertyWatcher("btnGroup",{"propertyChange":true},[param4[0],param4[1],param4[2]],param2);
         param5[9] = new PropertyWatcher("_text",{"propertyChange":true},[param4[9]],param2);
         param5[13] = new PropertyWatcher("voiceSource",{"propertyChange":true},[param4[13]],param2);
         param5[1] = new PropertyWatcher("infoGroup",{"propertyChange":true},[param4[3]],param2);
         param5[11] = new PropertyWatcher("genderSource",{"propertyChange":true},[param4[11]],param2);
         param5[8] = new PropertyWatcher("_charLeftText",{"propertyChange":true},[param4[8]],param2);
         param5[12].updateParent(param1);
         param5[6].updateParent(param1);
         param5[0].updateParent(param1);
         param5[9].updateParent(param1);
         param5[13].updateParent(param1);
         param5[1].updateParent(param1);
         param5[11].updateParent(param1);
         param5[8].updateParent(param1);
      }
   }
}
