package
{
   import anifire.studio.components.VoiceLineLabelGroup;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_VoiceLineLabelGroupWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_VoiceLineLabelGroupWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         VoiceLineLabelGroup.watcherSetupUtil = new _anifire_studio_components_VoiceLineLabelGroupWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("text",{"propertyChange":true},[param4[0],param4[2]],param2);
         param5[1] = new PropertyWatcher("_shouldDisplayToolTip",{"propertyChange":true},[param4[1]],param2);
         param5[0].updateParent(param1);
         param5[1].updateParent(param1);
      }
   }
}
