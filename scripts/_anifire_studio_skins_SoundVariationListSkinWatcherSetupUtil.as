package
{
   import anifire.studio.skins.SoundVariationListSkin;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_skins_SoundVariationListSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_skins_SoundVariationListSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         SoundVariationListSkin.watcherSetupUtil = new _anifire_studio_skins_SoundVariationListSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[1] = new PropertyWatcher("listGroup",{"propertyChange":true},[param4[1],param4[3]],param2);
         param5[0] = new PropertyWatcher("scroller",{"propertyChange":true},[param4[0],param4[2]],param2);
         param5[2] = new PropertyWatcher("dataGroup",{"propertyChange":true},[param4[4]],param2);
         param5[3] = new PropertyWatcher("height",{"heightChanged":true},[param4[4]],null);
         param5[1].updateParent(param1);
         param5[0].updateParent(param1);
         param5[2].updateParent(param1);
         param5[2].addChild(param5[3]);
      }
   }
}
