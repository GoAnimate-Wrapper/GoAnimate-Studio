package
{
   import anifire.studio.skins.VoiceProductExplorerSkin;
   import mx.binding.FunctionReturnWatcher;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_skins_VoiceProductExplorerSkinWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_skins_VoiceProductExplorerSkinWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         VoiceProductExplorerSkin.watcherSetupUtil = new _anifire_studio_skins_VoiceProductExplorerSkinWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         var target:Object = param1;
         var propertyGetter:Function = param2;
         var staticPropertyGetter:Function = param3;
         var bindings:Array = param4;
         var watchers:Array = param5;
         watchers[1] = new PropertyWatcher("hostComponent",{"propertyChange":true},[bindings[1],bindings[2]],propertyGetter);
         watchers[5] = new FunctionReturnWatcher("shouldDisplayPrompt",target,function():Array
         {
            return [];
         },{
            "productSearched":true,
            "productCategoryChanged":true
         },[bindings[2]],null);
         watchers[2] = new PropertyWatcher("isSearching",{"propertyChange":true},[bindings[1]],null);
         watchers[1].updateParent(target);
         watchers[5].parentWatcher = watchers[1];
         watchers[1].addChild(watchers[5]);
         watchers[1].addChild(watchers[2]);
      }
   }
}
