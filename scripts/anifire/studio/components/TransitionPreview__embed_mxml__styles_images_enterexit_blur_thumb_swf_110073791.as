package anifire.studio.components
{
	import flash.utils.ByteArray;
	import mx.core.MovieClipLoaderAsset;
	
	public class TransitionPreview__embed_mxml__styles_images_enterexit_blur_thumb_swf_110073791 extends MovieClipLoaderAsset
	{
		
		private static var bytes:ByteArray = null;
		 
		
		public var dataClass:Class;
		
		public function TransitionPreview__embed_mxml__styles_images_enterexit_blur_thumb_swf_110073791()
		{
			this.dataClass = TransitionPreview__embed_mxml__styles_images_enterexit_blur_thumb_swf_110073791_dataClass;
			super();
			initialWidth = 1100 / 20;
			initialHeight = 740 / 20;
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
