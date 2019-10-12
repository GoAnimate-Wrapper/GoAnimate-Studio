package
{
   import anifire.studio.skins.PublishFormItemSkin;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_skins_PublishFormItemSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_skins_PublishFormItemSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         PublishFormItemSkin.watcherSetupUtil = new _anifire_studio_skins_PublishFormItemSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("hostComponent",{"propertyChange":true},[param4[0],param4[1]],param2);
         param5[1] = new PropertyWatcher("label",{"labelChanged":true},[param4[0],param4[1]],null);
         param5[2] = new PropertyWatcher("errorContentGroup",{"propertyChange":true},[param4[2]],param2);
         param5[3] = new PropertyWatcher("width",{"widthChanged":true},[param4[2]],null);
         param5[0].updateParent(param1);
         param5[0].addChild(param5[1]);
         param5[2].updateParent(param1);
         param5[2].addChild(param5[3]);
      }
   }
}
