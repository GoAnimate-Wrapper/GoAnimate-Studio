package
{
	import anifire.studio.components.HyperLinkPanel;
	import mx.binding.IWatcherSetupUtil2;
	import mx.binding.PropertyWatcher;
	import mx.core.IFlexModuleFactory;
	
	public class _anifire_studio_components_HyperLinkPanelWatcherSetupUtil implements IWatcherSetupUtil2
	{
		 
		
		public function _anifire_studio_components_HyperLinkPanelWatcherSetupUtil()
		{
			super();
		}
		
		public static function init(param1:IFlexModuleFactory) : void
		{
			HyperLinkPanel.watcherSetupUtil = new _anifire_studio_components_HyperLinkPanelWatcherSetupUtil();
		}
		
		public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
		{
			param5[2] = new PropertyWatcher("messageText",{"propertyChange":true},[param4[2]],param2);
			param5[1] = new PropertyWatcher("maxChars",{"propertyChange":true},[param4[1]],param2);
			param5[0] = new PropertyWatcher("_url",{"propertyChange":true},[param4[0]],param2);
			param5[4] = new PropertyWatcher("helpText",{"propertyChange":true},[param4[4]],param2);
			param5[2].updateParent(param1);
			param5[1].updateParent(param1);
			param5[0].updateParent(param1);
			param5[4].updateParent(param1);
		}
	}
}
