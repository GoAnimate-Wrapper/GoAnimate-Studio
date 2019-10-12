package
{
   import anifire.studio.skins.IconButtonBarButtonSkin;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_skins_IconButtonBarButtonSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_skins_IconButtonBarButtonSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         IconButtonBarButtonSkin.watcherSetupUtil = new _anifire_studio_skins_IconButtonBarButtonSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[4] = new PropertyWatcher("fadeIn",{"propertyChange":true},[param4[3]],param2);
         param5[2] = new PropertyWatcher("background",{"propertyChange":true},[param4[2]],param2);
         param5[3] = new PropertyWatcher("width",{"propertyChange":true},[param4[2]],null);
         param5[0] = new PropertyWatcher("hostComponent",{"propertyChange":true},[param4[0],param4[1]],param2);
         param5[1] = new PropertyWatcher("hasLabel",{"propertyChange":true},[param4[0],param4[1]],null);
         param5[4].updateParent(param1);
         param5[2].updateParent(param1);
         param5[2].addChild(param5[3]);
         param5[0].updateParent(param1);
         param5[0].addChild(param5[1]);
      }
   }
}
