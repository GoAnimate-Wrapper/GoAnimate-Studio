package
{
   import anifire.studio.components.UpgradeIcon;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_UpgradeIconWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_UpgradeIconWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         UpgradeIcon.watcherSetupUtil = new _anifire_studio_components_UpgradeIconWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[5] = new PropertyWatcher("toolTipLabel",{"propertyChange":true},[param4[2]],param2);
         param5[0] = new PropertyWatcher("arrowToolTip",{"propertyChange":true},[param4[0],param4[1]],param2);
         param5[3] = new PropertyWatcher("height",{"heightChanged":true},[param4[1]],null);
         param5[1] = new PropertyWatcher("width",{"widthChanged":true},[param4[0]],null);
         param5[5].updateParent(param1);
         param5[0].updateParent(param1);
         param5[0].addChild(param5[3]);
         param5[0].addChild(param5[1]);
      }
   }
}
