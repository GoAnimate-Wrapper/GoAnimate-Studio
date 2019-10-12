package
{
   import anifire.studio.skins.LanguageDropDownListSkin;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_skins_LanguageDropDownListSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_skins_LanguageDropDownListSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         LanguageDropDownListSkin.watcherSetupUtil = new _anifire_studio_skins_LanguageDropDownListSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[2] = new PropertyWatcher("openButton",{"propertyChange":true},[param4[1]],param2);
         param5[3] = new PropertyWatcher("width",{"widthChanged":true},[param4[1]],null);
         param5[0] = new PropertyWatcher("hostComponent",{"propertyChange":true},[param4[0],param4[2],param4[3]],param2);
         param5[5] = new PropertyWatcher("selectedItem",{
            "valueCommit":true,
            "change":true
         },[param4[3]],null);
         param5[1] = new PropertyWatcher("popUpPosition",{"propertyChange":true},[param4[0],param4[2]],null);
         param5[2].updateParent(param1);
         param5[2].addChild(param5[3]);
         param5[0].updateParent(param1);
         param5[0].addChild(param5[5]);
         param5[0].addChild(param5[1]);
      }
   }
}
