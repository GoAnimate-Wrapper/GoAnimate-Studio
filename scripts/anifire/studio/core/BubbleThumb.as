package anifire.studio.core
{
	import anifire.bubble.BubbleMgr;
	import anifire.constant.AnimeConstants;
	import anifire.constant.ServerConstants;
	import anifire.constant.ThemeConstants;
	import anifire.event.CoreEvent;
	import anifire.util.UtilCrypto;
	import anifire.util.UtilNetwork;
	import anifire.util.UtilPlain;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.geom.Rectangle;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;
	
	public class BubbleThumb extends Thumb
	{
		
		public static const XML_NODE_NAME:String = "bubble";
		
		public static const XML_NODE_NAME_TEXT:String = "text";
		
		private static const DEFAULT_XML_BODY:String = "<bubble type=\"BLANK\" x=\"-90\" y=\"-45\" w=\"180\" h=\"90\" rotate=\"0\" hasTail=\"0\"><body rgb=\"0xFFFFFF\" linergb=\"0\" bgAlpha=\"0\" tailx=\"90\" taily=\"65\"/><text rgb=\"0\" font=\"<0>\" size=\"20\" align=\"center\" bold=\"false\" italic=\"false\">Double-click to input text</text></bubble>";
		
		private static const FONT_NAME_SPACE:String = "<0>";
		 
		
		private var _type:String;
		
		private var _colorStyle:int = 1;
		
		private var _thumbnailImageData:ByteArray;
		
		public var promptText:String;
		
		public var componentRole:String;
		
		public function BubbleThumb()
		{
			super();
		}
		
		public function getDefaultBubbleBody(param1:String) : XML
		{
			var _loc2_:String = DEFAULT_XML_BODY.replace(FONT_NAME_SPACE,param1);
			var _loc3_:XML = new XML(_loc2_);
			return _loc3_;
		}
		
		public function get colorStyle() : int
		{
			return this._colorStyle;
		}
		
		public function set colorStyle(param1:int) : void
		{
			this._colorStyle = param1;
		}
		
		public function set type(param1:String) : void
		{
			this._type = param1;
		}
		
		public function get type() : String
		{
			return this._type;
		}
		
		override public function loadImageData() : void
		{
			var _loc1_:URLRequest = UtilNetwork.getGetThemeAssetRequest(this.theme.id,this.getFileName(),ServerConstants.PARAM_BUBBLE);
			var _loc2_:URLLoader = new URLLoader();
			_loc2_.addEventListener(Event.COMPLETE,this.loadImageDataComplete);
			_loc2_.dataFormat = URLLoaderDataFormat.BINARY;
			_loc2_.load(_loc1_);
		}
		
		override public function loadImageDataComplete(param1:Event) : void
		{
			var _loc4_:UtilCrypto = null;
			var _loc2_:URLLoader = param1.target as URLLoader;
			var _loc3_:ByteArray = _loc2_.data;
			this.thumbImageData = _loc3_;
			if(this.theme.id != ThemeConstants.UGC_THEME_ID)
			{
				_loc4_ = new UtilCrypto();
				_loc4_.decrypt(ByteArray(this.thumbImageData));
			}
			this.dispatchEvent(new CoreEvent(CoreEvent.LOAD_THUMB_COMPLETE,this));
		}
		
		override public function deSerialize(param1:XML, param2:Theme) : void
		{
			if(!param1)
			{
				return;
			}
			this.imageData = param1.copy();
			this.id = param1.@id;
			this.aid = param1.@aid;
			this.encAssetId = param1.@enc_asset_id;
			this.theme = param2;
			this.type = param1.@type;
			this.enable = param1.@enable == "N"?false:true;
			this.colorStyle = param1.@colorStyle.length() > 0?int(param1.@colorStyle):1;
			if(param1.hasOwnProperty(XML_NODE_NAME_TEXT) && this.type == BubbleMgr.BLANK)
			{
				this.name = String(param1.text[0].@font);
			}
			this.setFileName(param1.@thumb);
		}
		
		private function doPositionProxyImage(param1:Event) : void
		{
			(param1.target as IEventDispatcher).removeEventListener(param1.type,this.doPositionProxyImage);
			var _loc2_:Loader = param1.target.loader as Loader;
			var _loc3_:Rectangle = new Rectangle(0,0,AnimeConstants.TILE_BUBBLE_WIDTH,AnimeConstants.TILE_BUBBLE_HEIGHT);
			UtilPlain.centerAlignObj(_loc2_,_loc3_,true);
		}
		
		override public function get shouldBeCopyToNextScene() : Boolean
		{
			return this.type == BubbleMgr.BLANK;
		}
		
		override public function get isWhiteboardAsset() : Boolean
		{
			return this.id == "blank8" || this.id == "blank9" || this.id == "blank10";
		}
	}
}
