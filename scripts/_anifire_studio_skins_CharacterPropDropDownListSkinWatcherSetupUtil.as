package
{
   import anifire.studio.skins.CharacterPropDropDownListSkin;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_skins_CharacterPropDropDownListSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_skins_CharacterPropDropDownListSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         CharacterPropDropDownListSkin.watcherSetupUtil = new _anifire_studio_skins_CharacterPropDropDownListSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("openButton",{"propertyChange":true},[param4[0]],param2);
         param5[1] = new PropertyWatcher("width",{"widthChanged":true},[param4[0]],null);
         param5[0].updateParent(param1);
         param5[0].addChild(param5[1]);
      }
   }
}
