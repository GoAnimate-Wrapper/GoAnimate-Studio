package anifire.studio.components
{
	import flash.utils.ByteArray;
	import mx.core.MovieClipLoaderAsset;
	
	public class SceneElement__embed_mxml__styles_images_timeline_loading_swf_970254217 extends MovieClipLoaderAsset
	{
		
		private static var bytes:ByteArray = null;
		 
		
		public var dataClass:Class;
		
		public function SceneElement__embed_mxml__styles_images_timeline_loading_swf_970254217()
		{
			this.dataClass = SceneElement__embed_mxml__styles_images_timeline_loading_swf_970254217_dataClass;
			super();
			initialWidth = 800 / 20;
			initialHeight = 800 / 20;
		}
		
		override public function get movieClipData() : ByteArray
		{
			if(bytes == null)
			{
				bytes = ByteArray(new this.dataClass());
			}
			return bytes;
		}
	}
}
