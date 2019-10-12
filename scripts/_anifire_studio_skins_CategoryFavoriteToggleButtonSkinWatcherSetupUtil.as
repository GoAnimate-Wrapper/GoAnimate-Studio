package
{
   import anifire.studio.skins.CategoryFavoriteToggleButtonSkin;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_skins_CategoryFavoriteToggleButtonSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_skins_CategoryFavoriteToggleButtonSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         CategoryFavoriteToggleButtonSkin.watcherSetupUtil = new _anifire_studio_skins_CategoryFavoriteToggleButtonSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[7] = new PropertyWatcher("iconStar",{"propertyChange":true},[param4[5]],param2);
         param5[8] = new PropertyWatcher("height",{"heightChanged":true},[param4[5]],null);
         param5[9] = new PropertyWatcher("arrowToolTip",{"propertyChange":true},[param4[5]],param2);
         param5[10] = new PropertyWatcher("height",{"heightChanged":true},[param4[5]],null);
         param5[7].updateParent(param1);
         param5[7].addChild(param5[8]);
         param5[9].updateParent(param1);
         param5[9].addChild(param5[10]);
      }
   }
}
