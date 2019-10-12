package
{
   import anifire.studio.skins.StarterListSkin;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_skins_StarterListSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_skins_StarterListSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         StarterListSkin.watcherSetupUtil = new _anifire_studio_skins_StarterListSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("hostComponent",{"propertyChange":true},[param4[0]],param2);
         param5[1] = new PropertyWatcher("dataProvider",{"dataProviderChanged":true},[param4[0]],null);
         param5[2] = new PropertyWatcher("length",null,[param4[0]],null);
         param5[0].updateParent(param1);
         param5[0].addChild(param5[1]);
         param5[1].addChild(param5[2]);
      }
   }
}
