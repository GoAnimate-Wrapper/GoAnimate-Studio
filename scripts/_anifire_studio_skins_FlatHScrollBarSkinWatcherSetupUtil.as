package
{
   import anifire.studio.skins.FlatHScrollBarSkin;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_skins_FlatHScrollBarSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_skins_FlatHScrollBarSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         FlatHScrollBarSkin.watcherSetupUtil = new _anifire_studio_skins_FlatHScrollBarSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}
