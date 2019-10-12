package
{
   import anifire.studio.components.VoiceAssignedItemRenderer;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_VoiceAssignedItemRendererWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_VoiceAssignedItemRendererWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         VoiceAssignedItemRenderer.watcherSetupUtil = new _anifire_studio_components_VoiceAssignedItemRendererWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[2] = new PropertyWatcher("_showVoiceLineLabelGroup",{"propertyChange":true},[param4[2],param4[3]],param2);
         param5[1] = new PropertyWatcher("_lineText",{"propertyChange":true},[param4[1]],param2);
         param5[2].updateParent(param1);
         param5[1].updateParent(param1);
      }
   }
}
