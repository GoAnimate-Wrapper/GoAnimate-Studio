package
{
   import anifire.studio.components.ThemeSelector;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_ThemeSelectorWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_ThemeSelectorWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ThemeSelector.watcherSetupUtil = new _anifire_studio_components_ThemeSelectorWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[13] = new PropertyWatcher("subMenuItems4",{"propertyChange":true},[param4[18]],param2);
         param5[12] = new PropertyWatcher("_displayMenu3",{"propertyChange":true},[param4[16],param4[17]],param2);
         param5[10] = new PropertyWatcher("_displayMenu2",{"propertyChange":true},[param4[13],param4[14]],param2);
         param5[11] = new PropertyWatcher("subMenuItems3",{"propertyChange":true},[param4[15]],param2);
         param5[9] = new PropertyWatcher("subMenuItems2",{"propertyChange":true},[param4[12]],param2);
         param5[14] = new PropertyWatcher("_displayMenu4",{"propertyChange":true},[param4[19],param4[20]],param2);
         param5[7] = new PropertyWatcher("subMenuItems1",{"propertyChange":true},[param4[9]],param2);
         param5[4] = new PropertyWatcher("extraItems",{"propertyChange":true},[param4[4]],param2);
         param5[5] = new PropertyWatcher("_showMoreItems",{"propertyChange":true},[param4[5],param4[6]],param2);
         param5[6] = new PropertyWatcher("moreItems",{"propertyChange":true},[param4[7]],param2);
         param5[1] = new PropertyWatcher("_themeName",{"propertyChange":true},[param4[1]],param2);
         param5[2] = new PropertyWatcher("fadeIn",{"propertyChange":true},[param4[2],param4[8]],param2);
         param5[0] = new PropertyWatcher("_currentThemeId",{"propertyChange":true},[param4[0]],param2);
         param5[3] = new PropertyWatcher("_menuItems",{"propertyChange":true},[param4[3]],param2);
         param5[8] = new PropertyWatcher("_displayMenu1",{"propertyChange":true},[param4[10],param4[11]],param2);
         param5[13].updateParent(param1);
         param5[12].updateParent(param1);
         param5[10].updateParent(param1);
         param5[11].updateParent(param1);
         param5[9].updateParent(param1);
         param5[14].updateParent(param1);
         param5[7].updateParent(param1);
         param5[4].updateParent(param1);
         param5[5].updateParent(param1);
         param5[6].updateParent(param1);
         param5[1].updateParent(param1);
         param5[2].updateParent(param1);
         param5[0].updateParent(param1);
         param5[3].updateParent(param1);
         param5[8].updateParent(param1);
      }
   }
}
