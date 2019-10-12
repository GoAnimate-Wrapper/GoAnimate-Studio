package
{
   import anifire.studio.skins.WidgetDataGridSkin;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_skins_WidgetDataGridSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_skins_WidgetDataGridSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         WidgetDataGridSkin.watcherSetupUtil = new _anifire_studio_skins_WidgetDataGridSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[1] = new PropertyWatcher("headerRenderer",{"propertyChange":true},[param4[1]],param2);
         param5[4] = new PropertyWatcher("grid",{"propertyChange":true},[param4[3],param4[7]],param2);
         param5[5] = new PropertyWatcher("width",{"widthChanged":true},[param4[3],param4[7]],null);
         param5[7] = new PropertyWatcher("hostComponent",{"propertyChange":true},[param4[5],param4[6]],param2);
         param5[8] = new PropertyWatcher("showMaxRowCountLabel",{"propertyChange":true},[param4[5],param4[6]],null);
         param5[0] = new PropertyWatcher("headerColumnSeparator",{"propertyChange":true},[param4[0]],param2);
         param5[2] = new PropertyWatcher("gridViewport",{"propertyChange":true},[param4[2],param4[8],param4[9],param4[10],param4[11]],param2);
         param5[9] = new PropertyWatcher("verticalScrollPosition",{"propertyChange":true},[param4[8],param4[9]],null);
         param5[3] = new PropertyWatcher("horizontalScrollPosition",{"propertyChange":true},[param4[2],param4[10],param4[11]],null);
         param5[1].updateParent(param1);
         param5[4].updateParent(param1);
         param5[4].addChild(param5[5]);
         param5[7].updateParent(param1);
         param5[7].addChild(param5[8]);
         param5[0].updateParent(param1);
         param5[2].updateParent(param1);
         param5[2].addChild(param5[9]);
         param5[2].addChild(param5[3]);
      }
   }
}
