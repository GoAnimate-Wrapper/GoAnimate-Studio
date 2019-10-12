package
{
   import anifire.studio.components.WhiteboardHandPopUp;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_WhiteboardHandPopUpWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_WhiteboardHandPopUpWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         WhiteboardHandPopUp.watcherSetupUtil = new _anifire_studio_components_WhiteboardHandPopUpWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}
