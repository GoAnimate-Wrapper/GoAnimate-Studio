package
{
   import anifire.studio.components.CharacterPropPanel;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_CharacterPropPanelWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_CharacterPropPanelWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         CharacterPropPanel.watcherSetupUtil = new _anifire_studio_components_CharacterPropPanelWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("title",{"propertyChange":true},[param4[0]],param2);
         param5[2] = new PropertyWatcher("_propStates",{"propertyChange":true},[param4[3]],param2);
         param5[1] = new PropertyWatcher("displayClearButton",{"propertyChange":true},[param4[1],param4[2]],param2);
         param5[0].updateParent(param1);
         param5[2].updateParent(param1);
         param5[1].updateParent(param1);
      }
   }
}
