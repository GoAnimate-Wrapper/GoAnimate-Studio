package
{
   import anifire.studio.assets.views.FlowFrameAddImageToolTip;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_assets_views_FlowFrameAddImageToolTipWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_assets_views_FlowFrameAddImageToolTipWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         FlowFrameAddImageToolTip.watcherSetupUtil = new _anifire_studio_assets_views_FlowFrameAddImageToolTipWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}
