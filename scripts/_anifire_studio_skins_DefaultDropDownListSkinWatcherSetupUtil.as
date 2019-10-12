package
{
   import anifire.studio.skins.DefaultDropDownListSkin;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_skins_DefaultDropDownListSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_skins_DefaultDropDownListSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         DefaultDropDownListSkin.watcherSetupUtil = new _anifire_studio_skins_DefaultDropDownListSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("popUp",{"propertyChange":true},[param4[0]],param2);
         param5[1] = new PropertyWatcher("width",{"widthChanged":true},[param4[0]],null);
         param5[3] = new PropertyWatcher("hostComponent",{"propertyChange":true},[param4[1],param4[2]],param2);
         param5[4] = new PropertyWatcher("selectedItem",{
            "valueCommit":true,
            "change":true
         },[param4[1],param4[2]],null);
         param5[0].updateParent(param1);
         param5[0].addChild(param5[1]);
         param5[3].updateParent(param1);
         param5[3].addChild(param5[4]);
      }
   }
}
