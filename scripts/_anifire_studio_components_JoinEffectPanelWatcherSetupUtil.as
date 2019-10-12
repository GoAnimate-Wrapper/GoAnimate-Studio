package
{
   import anifire.studio.components.JoinEffectPanel;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_JoinEffectPanelWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_JoinEffectPanelWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         JoinEffectPanel.watcherSetupUtil = new _anifire_studio_components_JoinEffectPanelWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("base",{"propertyChange":true},[param4[0],param4[1]],param2);
         param5[1] = new PropertyWatcher("_displayPresentationSettings",{"propertyChange":true},[param4[2],param4[3]],param2);
         param5[0].updateParent(param1);
         param5[1].updateParent(param1);
      }
   }
}
