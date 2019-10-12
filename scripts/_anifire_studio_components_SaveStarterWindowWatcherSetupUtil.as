package
{
   import anifire.studio.components.SaveStarterWindow;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_SaveStarterWindowWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_SaveStarterWindowWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         SaveStarterWindow.watcherSetupUtil = new _anifire_studio_components_SaveStarterWindowWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[9] = new PropertyWatcher("_themeStarters",{"propertyChange":true},[param4[9]],param2);
         param5[6] = new PropertyWatcher("_displayAdminOptions",{"propertyChange":true},[param4[6],param4[7],param4[13],param4[14]],param2);
         param5[7] = new PropertyWatcher("replaceStarterCheckbox",{"propertyChange":true},[param4[8]],param2);
         param5[8] = new PropertyWatcher("selected",{"propertyChange":true},[param4[8]],null);
         param5[0] = new PropertyWatcher("movieTitleInput",{"propertyChange":true},[param4[0]],param2);
         param5[1] = new PropertyWatcher("movieTagsInput",{"propertyChange":true},[param4[1]],param2);
         param5[9].updateParent(param1);
         param5[6].updateParent(param1);
         param5[7].updateParent(param1);
         param5[7].addChild(param5[8]);
         param5[0].updateParent(param1);
         param5[1].updateParent(param1);
      }
   }
}
