package
{
   import anifire.studio.components.CommunityPanel;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_CommunityPanelWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_CommunityPanelWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         CommunityPanel.watcherSetupUtil = new _anifire_studio_components_CommunityPanelWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[4] = new PropertyWatcher("manager",{"propertyChange":true},[param4[5],param4[8],param4[11]],param2);
         param5[5] = new PropertyWatcher("propSource",{"load_community_asset_complete":true},[param4[5]],null);
         param5[10] = new PropertyWatcher("characterSource",{"load_community_asset_complete":true},[param4[11]],null);
         param5[8] = new PropertyWatcher("backgroundSource",{"load_community_asset_complete":true},[param4[8]],null);
         param5[6] = new PropertyWatcher("loading",{"propertyChange":true},[param4[6],param4[9],param4[12]],param2);
         param5[0] = new PropertyWatcher("tabNavigator",{"propertyChange":true},[param4[0]],param2);
         param5[1] = new PropertyWatcher("displaySearchBox",{"propertyChange":true},[param4[1],param4[2]],param2);
         param5[4].updateParent(param1);
         param5[4].addChild(param5[5]);
         param5[4].addChild(param5[10]);
         param5[4].addChild(param5[8]);
         param5[6].updateParent(param1);
         param5[0].updateParent(param1);
         param5[1].updateParent(param1);
      }
   }
}
