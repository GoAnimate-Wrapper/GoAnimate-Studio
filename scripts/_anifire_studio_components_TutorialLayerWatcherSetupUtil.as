package
{
   import anifire.studio.components.TutorialLayer;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_TutorialLayerWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_TutorialLayerWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         TutorialLayer.watcherSetupUtil = new _anifire_studio_components_TutorialLayerWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[3] = new PropertyWatcher("_showHelpText",{"propertyChange":true},[param4[6],param4[7]],param2);
         param5[0] = new PropertyWatcher("chromeGroup",{"propertyChange":true},[param4[1],param4[2],param4[3]],param2);
         param5[7] = new PropertyWatcher("_isHideSkipTutorialButton",{"propertyChange":true},[param4[12]],param2);
         param5[9] = new PropertyWatcher("nextButtonFadeIn",{"propertyChange":true},[param4[14]],param2);
         param5[5] = new PropertyWatcher("_showSubContent",{"propertyChange":true},[param4[9],param4[10]],param2);
         param5[4] = new PropertyWatcher("_helpText",{"propertyChange":true},[param4[8]],param2);
         param5[1] = new PropertyWatcher("heroMask",{"propertyChange":true},[param4[4]],param2);
         param5[3].updateParent(param1);
         param5[0].updateParent(param1);
         param5[7].updateParent(param1);
         param5[9].updateParent(param1);
         param5[5].updateParent(param1);
         param5[4].updateParent(param1);
         param5[1].updateParent(param1);
      }
   }
}
