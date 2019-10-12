package
{
   import anifire.studio.skins.ProductExplorerSkin;
   import mx.binding.FunctionReturnWatcher;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_skins_ProductExplorerSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_skins_ProductExplorerSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ProductExplorerSkin.watcherSetupUtil = new _anifire_studio_skins_ProductExplorerSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         var target:Object = param1;
         var propertyGetter:Function = param2;
         var staticPropertyGetter:Function = param3;
         var bindings:Array = param4;
         var watchers:Array = param5;
         watchers[8] = new PropertyWatcher("categoryList",{"propertyChange":true},[bindings[10]],propertyGetter);
         watchers[9] = new PropertyWatcher("height",{"heightChanged":true},[bindings[10]],null);
         watchers[6] = new PropertyWatcher("chromeGroup",{"propertyChange":true},[bindings[9]],propertyGetter);
         watchers[7] = new PropertyWatcher("width",{"widthChanged":true},[bindings[9]],null);
         watchers[1] = new PropertyWatcher("contentContainer",{"propertyChange":true},[bindings[1]],propertyGetter);
         watchers[3] = new PropertyWatcher("hostComponent",{"propertyChange":true},[bindings[5],bindings[6],bindings[7],bindings[8]],propertyGetter);
         watchers[4] = new PropertyWatcher("categoryListWidth",{"propertyChange":true},[bindings[5],bindings[7],bindings[8]],null);
         watchers[5] = new FunctionReturnWatcher("shouldDisplayPrompt",target,function():Array
         {
            return [];
         },{
            "productSearched":true,
            "productCategoryChanged":true
         },[bindings[6]],null);
         watchers[0] = new PropertyWatcher("categoryListGroup",{"propertyChange":true},[bindings[0]],propertyGetter);
         watchers[8].updateParent(target);
         watchers[8].addChild(watchers[9]);
         watchers[6].updateParent(target);
         watchers[6].addChild(watchers[7]);
         watchers[1].updateParent(target);
         watchers[3].updateParent(target);
         watchers[3].addChild(watchers[4]);
         watchers[5].parentWatcher = watchers[3];
         watchers[3].addChild(watchers[5]);
         watchers[0].updateParent(target);
      }
   }
}
