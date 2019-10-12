package
{
   import anifire.studio.components.VariationButton;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_VariationButtonWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_VariationButtonWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         VariationButton.watcherSetupUtil = new _anifire_studio_components_VariationButtonWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[1] = new PropertyWatcher("arrowToolTip",{"propertyChange":true},[param4[1]],param2);
         param5[2] = new PropertyWatcher("height",{"heightChanged":true},[param4[1]],null);
         param5[1].updateParent(param1);
         param5[1].addChild(param5[2]);
      }
   }
}
