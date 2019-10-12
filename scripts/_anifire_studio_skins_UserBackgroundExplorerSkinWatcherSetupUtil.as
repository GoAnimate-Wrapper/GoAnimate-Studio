package
{
   import anifire.studio.skins.UserBackgroundExplorerSkin;
   import mx.binding.FunctionReturnWatcher;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_skins_UserBackgroundExplorerSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_skins_UserBackgroundExplorerSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         UserBackgroundExplorerSkin.watcherSetupUtil = new _anifire_studio_skins_UserBackgroundExplorerSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         var target:Object = param1;
         var propertyGetter:Function = param2;
         var staticPropertyGetter:Function = param3;
         var bindings:Array = param4;
         var watchers:Array = param5;
         watchers[1] = new PropertyWatcher("hostComponent",{"propertyChange":true},[bindings[1],bindings[2],bindings[3],bindings[4]],propertyGetter);
         watchers[2] = new PropertyWatcher("categoryListWidth",{"propertyChange":true},[bindings[1],bindings[3],bindings[4]],null);
         watchers[3] = new FunctionReturnWatcher("shouldDisplayPrompt",target,function():Array
         {
            return [];
         },{
            "productSearched":true,
            "productCategoryChanged":true
         },[bindings[2]],null);
         watchers[0] = new PropertyWatcher("categoryListGroup",{"propertyChange":true},[bindings[0]],propertyGetter);
         watchers[1].updateParent(target);
         watchers[1].addChild(watchers[2]);
         watchers[3].parentWatcher = watchers[1];
         watchers[1].addChild(watchers[3]);
         watchers[0].updateParent(target);
      }
   }
}
