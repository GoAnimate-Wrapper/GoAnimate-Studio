package
{
   import anifire.studio.components.EffectPanel;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_EffectPanelWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_EffectPanelWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         EffectPanel.watcherSetupUtil = new _anifire_studio_components_EffectPanelWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}
