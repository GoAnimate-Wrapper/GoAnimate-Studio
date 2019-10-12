package
{
   import anifire.studio.skins.TextComponentListSkin;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_skins_TextComponentListSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_skins_TextComponentListSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         TextComponentListSkin.watcherSetupUtil = new _anifire_studio_skins_TextComponentListSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}
