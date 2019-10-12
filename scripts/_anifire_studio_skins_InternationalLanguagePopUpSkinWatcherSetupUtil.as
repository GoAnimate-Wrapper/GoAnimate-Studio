package
{
   import anifire.studio.skins.InternationalLanguagePopUpSkin;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_skins_InternationalLanguagePopUpSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_skins_InternationalLanguagePopUpSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         InternationalLanguagePopUpSkin.watcherSetupUtil = new _anifire_studio_skins_InternationalLanguagePopUpSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("hostComponent",{"propertyChange":true},[param4[1],param4[2],param4[3],param4[4],param4[5]],param2);
         param5[2] = new PropertyWatcher("title",{"propertyChange":true},[param4[3],param4[4],param4[5]],null);
         param5[1] = new PropertyWatcher("iconType",{"propertyChange":true},[param4[1],param4[2]],null);
         param5[0].updateParent(param1);
         param5[0].addChild(param5[2]);
         param5[0].addChild(param5[1]);
      }
   }
}
