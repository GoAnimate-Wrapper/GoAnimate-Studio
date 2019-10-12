package
{
   import anifire.studio.components.TransitionPanel;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_TransitionPanelWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_TransitionPanelWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         TransitionPanel.watcherSetupUtil = new _anifire_studio_components_TransitionPanelWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[11] = new PropertyWatcher("collection",{"propertyChange":true},[param4[13],param4[20],param4[25],param4[30],param4[31],param4[32],param4[34],param4[35],param4[36]],param2);
         param5[17] = new PropertyWatcher("collectionAfterNarration",{"propertyChange":true},[param4[25]],null);
         param5[12] = new PropertyWatcher("collectionBeforeNarration",{"propertyChange":true},[param4[13]],null);
         param5[21] = new PropertyWatcher("totalTransitions",{"TIMING_CHANGE":true},[param4[36]],null);
         param5[15] = new PropertyWatcher("collectionWithNarration",{"propertyChange":true},[param4[20]],null);
         param5[19] = new PropertyWatcher("collectionWholeScene",{"propertyChange":true},[param4[30],param4[31],param4[32],param4[34],param4[35]],null);
         param5[20] = new PropertyWatcher("length",{"collectionChange":true},[param4[30],param4[31],param4[34],param4[35]],null);
         param5[13] = new PropertyWatcher("_selectedItems",{"propertyChange":true},[param4[14],param4[21],param4[26],param4[33]],param2);
         param5[9] = new PropertyWatcher("showAllSections",{"propertyChange":true},[param4[10],param4[11],param4[15],param4[16],param4[17],param4[18],param4[22],param4[23],param4[27],param4[28]],param2);
         param5[0] = new PropertyWatcher("displayTransitionSettings",{"propertyChange":true},[param4[0],param4[1]],param2);
         param5[11].updateParent(param1);
         param5[11].addChild(param5[17]);
         param5[11].addChild(param5[12]);
         param5[11].addChild(param5[21]);
         param5[11].addChild(param5[15]);
         param5[11].addChild(param5[19]);
         param5[19].addChild(param5[20]);
         param5[13].updateParent(param1);
         param5[9].updateParent(param1);
         param5[0].updateParent(param1);
      }
   }
}
