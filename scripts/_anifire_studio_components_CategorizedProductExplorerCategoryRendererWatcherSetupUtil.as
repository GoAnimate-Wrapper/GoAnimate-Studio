package
{
   import anifire.studio.components.CategorizedProductExplorerCategoryRenderer;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_CategorizedProductExplorerCategoryRendererWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_CategorizedProductExplorerCategoryRendererWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         CategorizedProductExplorerCategoryRenderer.watcherSetupUtil = new _anifire_studio_components_CategorizedProductExplorerCategoryRendererWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[4] = new PropertyWatcher("_tutorialMode",{"propertyChange":true},[param4[4]],param2);
         param5[0] = new PropertyWatcher("_productCollection",{"propertyChange":true},[param4[0],param4[1],param4[2],param4[3],param4[5]],param2);
         param5[1] = new PropertyWatcher("valid",{"propertyChange":true},[param4[0]],null);
         param5[2] = new PropertyWatcher("isFeatured",{"propertyChange":true},[param4[1],param4[2],param4[5]],null);
         param5[3] = new PropertyWatcher("isFavorited",{"propertyChange":true},[param4[3]],null);
         param5[4].updateParent(param1);
         param5[0].updateParent(param1);
         param5[0].addChild(param5[1]);
         param5[0].addChild(param5[2]);
         param5[0].addChild(param5[3]);
      }
   }
}
