package
{
	import anifire.studio.components.BubbleAdvancedPanel;
	import mx.binding.IWatcherSetupUtil2;
	import mx.binding.PropertyWatcher;
	import mx.core.IFlexModuleFactory;
	
	public class _anifire_studio_components_BubbleAdvancedPanelWatcherSetupUtil implements IWatcherSetupUtil2
	{
		 
		
		public function _anifire_studio_components_BubbleAdvancedPanelWatcherSetupUtil()
		{
			super();
		}
		
		public static function init(param1:IFlexModuleFactory) : void
		{
			BubbleAdvancedPanel.watcherSetupUtil = new _anifire_studio_components_BubbleAdvancedPanelWatcherSetupUtil();
		}
		
		public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
		{
			param5[1] = new PropertyWatcher("target",{"propertyChange":true},[param4[1]],param2);
			param5[1].updateParent(param1);
		}
	}
}
