package anifire.component.widgets
{
	import anifire.constant.ServerConstants;
	import anifire.event.WidgetEvent;
	import anifire.managers.AppConfigManager;
	import anifire.models.widget.WidgetPartModel;
	import anifire.util.UtilCrypto;
	import anifire.util.UtilNetwork;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.geom.Rectangle;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	import flash.utils.ByteArray;
	
	public class IconWidget extends CounterWidget
	{
		
		public static const LABEL_PADDING:Number = 30;
		 
		
		protected var _gridWidth:Number;
		
		protected var _gridHeight:Number;
		
		protected var _gridGap:Number;
		
		protected var _thumbId:String;
		
		protected var _themeId:String;
		
		protected var _imageRequest:URLRequest;
		
		protected var _byteLoader:URLLoader;
		
		protected var _iconLoader:Loader;
		
		protected var _iconSource:ByteArray;
		
		protected var _bitmapData:BitmapData;
		
		public function IconWidget()
		{
			super();
		}
		
		override public function set title(param1:String) : void
		{
		}
		
		override protected function init() : void
		{
			super.init();
			_bounds = new Rectangle(-100,-100,200,200);
			_labelPaddingBottom = LABEL_PADDING;
			_basePartOnTop = true;
			this._gridWidth = 40;
			this._gridHeight = 40;
			this._gridGap = 0;
		}
		
		override protected function createPart(param1:WidgetPartModel) : WidgetPart
		{
			var _loc2_:IconWidgetPart = new IconWidgetPart();
			_loc2_.bounds = _basePart.contentBounds;
			_loc2_.gridWidth = this._gridWidth;
			_loc2_.gridHeight = this._gridHeight;
			_loc2_.gridGap = this._gridGap;
			return _loc2_;
		}
		
		override protected function createBasePart() : WidgetBasePart
		{
			return new IconWidgetBasePart();
		}
		
		override protected function updateCounterText() : void
		{
			var _loc1_:Number = getAnimationValue();
			var _loc2_:String = String(Math.round(_loc1_));
			var _loc3_:Number = Math.round(_loc1_ / _counterMaxValue * 100);
			if(displayPercentageLabel && displayValueLabel)
			{
				_basePart.text = _loc2_ + " (" + _loc3_ + "%)";
			}
			else if(displayPercentageLabel)
			{
				_basePart.text = _loc3_ + "%";
			}
			else if(displayValueLabel)
			{
				_basePart.text = _loc2_;
			}
			else
			{
				_basePart.text = "";
			}
		}
		
		override public function set displayPercentageLabel(param1:Boolean) : void
		{
			super.displayPercentageLabel = param1;
			processPadding();
		}
		
		override protected function get displayLabelPadding() : Boolean
		{
			return _displayValueLabel || _displayPercentageLabel;
		}
		
		public function updateIconImage(param1:String, param2:String, param3:String = null, param4:String = null) : void
		{
			var _loc5_:URLVariables = null;
			this._themeId = param1;
			this._thumbId = param2;
			this.clearByteLoader();
			if(param1 == "ugc")
			{
				_loc5_ = AppConfigManager.instance.createURLVariables();
				if(_loc5_.hasOwnProperty(ServerConstants.PARAM_ENC_ASSET_ID))
				{
					delete _loc5_[ServerConstants.PARAM_ENC_ASSET_ID];
				}
				_loc5_[ServerConstants.PARAM_ENC_ASSET_ID] = param2;
				_loc5_[ServerConstants.PARAM_SIGNATURE] = param4;
				this._imageRequest = new URLRequest(ServerConstants.ACTION_GET_ASSET_EX);
				this._imageRequest.method = URLRequestMethod.POST;
				this._imageRequest.data = _loc5_;
			}
			else if(param3)
			{
				this._imageRequest = UtilNetwork.getGetThemeAssetRequest(this._themeId,param2,ServerConstants.PARAM_PROP_STATE,param3);
			}
			else
			{
				this._imageRequest = UtilNetwork.getGetThemeAssetRequest(this._themeId,param2,ServerConstants.PARAM_PROP);
			}
			this._byteLoader = new URLLoader();
			this._byteLoader.dataFormat = URLLoaderDataFormat.BINARY;
			this._byteLoader.addEventListener(Event.COMPLETE,this.onByteLoaderComplete);
			this._byteLoader.addEventListener(IOErrorEvent.IO_ERROR,this.onByteLoaderError);
			this._byteLoader.load(this._imageRequest);
		}
		
		protected function onByteLoaderError(param1:Event) : void
		{
			this.clearByteLoader();
		}
		
		protected function onByteLoaderComplete(param1:Event) : void
		{
			var _loc3_:UtilCrypto = null;
			var _loc2_:ByteArray = this._byteLoader.data as ByteArray;
			if(this._themeId != "ugc")
			{
				_loc3_ = new UtilCrypto();
				_loc3_.decrypt(_loc2_);
			}
			this.setIconSource(_loc2_);
			this.clearByteLoader();
			dispatchEvent(new WidgetEvent(WidgetEvent.WIDGET_ICON_LOAD_COMPLETE));
		}
		
		protected function clearByteLoader() : void
		{
			if(this._byteLoader)
			{
				this._byteLoader.removeEventListener(Event.COMPLETE,this.onByteLoaderComplete);
				this._byteLoader.removeEventListener(IOErrorEvent.IO_ERROR,this.onByteLoaderError);
				this._byteLoader = null;
			}
		}
		
		protected function setIconSource(param1:ByteArray) : void
		{
			var _loc3_:IconWidgetPart = null;
			this._iconSource = param1;
			var _loc2_:int = 0;
			while(_loc2_ < _dataPartCount)
			{
				_loc3_ = _dataParts[_loc2_] as IconWidgetPart;
				_loc3_.loadIcon(this._iconSource);
				_loc2_++;
			}
		}
	}
}
