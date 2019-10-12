package
{
   import anifire.studio.skins.WidgetProductExplorerSkin;
   import mx.binding.FunctionReturnWatcher;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_skins_WidgetProductExplorerSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_skins_WidgetProductExplorerSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         WidgetProductExplorerSkin.watcherSetupUtil = new _anifire_studio_skins_WidgetProductExplorerSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         var target:Object = param1;
         var propertyGetter:Function = param2;
         var staticPropertyGetter:Function = param3;
         var bindings:Array = param4;
         var watchers:Array = param5;
         watchers[0] = new PropertyWatcher("hostComponent",{"propertyChange":true},[bindings[0]],propertyGetter);
         watchers[1] = new FunctionReturnWatcher("shouldDisplayPrompt",target,function():Array
         {
            return [];
         },{
            "productSearched":true,
            "productCategoryChanged":true
         },[bindings[0]],null);
         watchers[0].updateParent(target);
         watchers[1].parentWatcher = watchers[0];
         watchers[0].addChild(watchers[1]);
      }
   }
}
