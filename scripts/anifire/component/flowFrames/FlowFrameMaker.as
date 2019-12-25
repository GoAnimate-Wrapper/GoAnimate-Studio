package anifire.component.flowFrames
{
	import anifire.constants.FlowConstants;
	import anifire.event.FlowFrameMakerEvent;
	import anifire.util.UtilCrypto;
	import anifire.util.UtilDraw;
	import anifire.util.UtilNetwork;
	import anifire.util.UtilURLStream;
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.geom.Rectangle;
	import flash.net.URLRequest;
	import flash.net.URLStream;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.utils.ByteArray;
	
	public class FlowFrameMaker extends Sprite
	{
		
		public static const DEFAULT_GRID_VALUE:Number = 20;
		
		public static const MIN_CONTENT_WIDTH:Number = 50;
		
		public static const MIN_CONTENT_HEIGHT:Number = 50;
		
		public static const PLACE_HOLDER_OUTER_COLOR:uint = 5200489;
		
		public static const PLACE_HOLDER_INNER_COLOR:uint = 13290196;
		
		public static const PLACE_HOLDER_DASH_LINE_LENGTH:int = 6;
		
		public static const PLACE_HOLDER_DASH_LINE_GAP:int = 8;
		
		public static const IMAGE_FIT_MODE_FIT_TO_IMAGE:int = 0;
		
		public static const IMAGE_FIT_MODE_FIT_TO_FRAME:int = 1;
		 
		
		protected var _themeId:String;
		
		protected var _assetId:String;
		
		protected var _innerThemeId:String;
		
		protected var _innerAssetId:String;
		
		protected var _innerEncAssetId:String;
		
		protected var _innerSignature:String;
		
		protected var _gridLeft:Number;
		
		protected var _autoFlowInnerImage:Boolean = true;
		
		protected var _fitMode:int = 0;
		
		protected var _minContentWidth:Number = 50;
		
		protected var _minContentHeight:Number = 50;
		
		protected var _displayContentRect:Boolean;
		
		protected var _defaultFlowWidth:Number;
		
		protected var _defaultFlowHeight:Number;
		
		protected var _gridRight:Number;
		
		protected var _gridTop:Number;
		
		protected var _gridBottom:Number;
		
		protected var _innerOffsetLeft:Number = 0;
		
		protected var _innerOffsetRight:Number = 0;
		
		protected var _innerOffsetTop:Number = 0;
		
		protected var _innerOffsetBottom:Number = 0;
		
		protected var _flowImageSource:Loader;
		
		protected var _innerImageSource:Loader;
		
		protected var _invalidateFlag:Boolean;
		
		public var debugMode:Boolean = true;
		
		protected var _flowWidth:Number;
		
		protected var _flowHeight:Number;
		
		protected var _baseColor:uint = 0;
		
		protected var _opacity:int = 0;
		
		public var parts:Vector.<FlowFramePart>;
		
		public var partLookup:Object;
		
		protected var _innerImageContainer:Sprite;
		
		protected var _innerImageMask:Sprite;
		
		public function FlowFrameMaker()
		{
			super();
			this.init();
		}
		
		public function get displayContentRect() : Boolean
		{
			return this._displayContentRect;
		}
		
		public function set displayContentRect(param1:Boolean) : void
		{
			this._displayContentRect = param1;
			this._invalidateFlag = true;
		}
		
		public function get gridLeft() : Number
		{
			return this._gridLeft;
		}
		
		public function set gridLeft(param1:Number) : void
		{
			this._gridLeft = param1;
			this._invalidateFlag = true;
		}
		
		public function get gridRight() : Number
		{
			return this._gridRight;
		}
		
		public function set gridRight(param1:Number) : void
		{
			this._gridRight = param1;
			this._invalidateFlag = true;
		}
		
		public function get gridTop() : Number
		{
			return this._gridTop;
		}
		
		public function set gridTop(param1:Number) : void
		{
			this._gridTop = param1;
			this._invalidateFlag = true;
		}
		
		public function get gridBottom() : Number
		{
			return this._gridBottom;
		}
		
		public function set gridBottom(param1:Number) : void
		{
			this._gridBottom = param1;
			this._invalidateFlag = true;
		}
		
		public function get flowWidth() : Number
		{
			return this._flowWidth;
		}
		
		public function set flowWidth(param1:Number) : void
		{
			this._flowWidth = Math.max(param1,this.minFlowWidth);
			this._invalidateFlag = true;
		}
		
		public function get flowHeight() : Number
		{
			return this._flowHeight;
		}
		
		public function set flowHeight(param1:Number) : void
		{
			this._flowHeight = Math.max(param1,this.minFlowHeight);
			this._invalidateFlag = true;
		}
		
		public function get baseColor() : uint
		{
			return this._baseColor;
		}
		
		public function set baseColor(param1:uint) : void
		{
			this._baseColor = param1;
			this._invalidateFlag = true;
		}
		
		public function get opacity() : int
		{
			return this._opacity;
		}
		
		public function set opacity(param1:int) : void
		{
			this._opacity = Math.min(Math.max(param1,0),100);
			this._invalidateFlag = true;
		}
		
		public function init() : void
		{
			this.gridLeft = DEFAULT_GRID_VALUE;
			this.gridRight = DEFAULT_GRID_VALUE;
			this.gridTop = DEFAULT_GRID_VALUE;
			this.gridBottom = DEFAULT_GRID_VALUE;
			this.partLookup = {};
			this.parts = new Vector.<FlowFramePart>();
			this._innerImageContainer = new Sprite();
			addChild(this._innerImageContainer);
			this._innerImageMask = new Sprite();
			this._innerImageContainer.mask = this._innerImageMask;
			addChild(this._innerImageMask);
		}
		
		public function readNode(param1:XML) : void
		{
			var _loc5_:FlowFramePart = null;
			this._invalidateFlag = true;
			this._gridLeft = param1.@left;
			this._gridRight = param1.@right;
			this._gridTop = param1.@top;
			this._gridBottom = param1.@bottom;
			this._minContentWidth = param1.@minWidth;
			this._minContentHeight = param1.@minHeight;
			this._flowWidth = this._defaultFlowWidth = param1.@width;
			this._flowHeight = this._defaultFlowHeight = param1.@height;
			if(param1.hasOwnProperty("@innerLeft"))
			{
				this._innerOffsetLeft = param1.@innerLeft;
			}
			if(param1.hasOwnProperty("@innerRight"))
			{
				this._innerOffsetRight = param1.@innerRight;
			}
			if(param1.hasOwnProperty("@innerTop"))
			{
				this._innerOffsetTop = param1.@innerTop;
			}
			if(param1.hasOwnProperty("@innerBottom"))
			{
				this._innerOffsetBottom = param1.@innerBottom;
			}
			var _loc2_:XMLList = param1.part;
			var _loc3_:int = _loc2_.length();
			var _loc4_:int = 0;
			while(_loc4_ < _loc3_)
			{
				_loc5_ = new FlowFramePart();
				_loc5_.readNode(_loc2_[_loc4_]);
				this.addPart(_loc5_);
				_loc4_++;
			}
			this.validate();
		}
		
		protected function clearFlowImageSource() : void
		{
			if(this._flowImageSource)
			{
				this._flowImageSource.contentLoaderInfo.removeEventListener(Event.INIT,this.flowImageSource_initHandler);
				this._flowImageSource.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,this.flowImageSource_errorHandler);
				this._flowImageSource.unloadAndStop();
				this._flowImageSource = null;
			}
		}
		
		public function initFlowImageSource(param1:String, param2:String) : void
		{
			this._themeId = param1;
			this._assetId = param2;
		}
		
		public function updateFlowImageSource(param1:String, param2:String) : void
		{
			this._themeId = param1;
			this._assetId = param2;
			this.clearFlowImageSource();
			var _loc3_:URLRequest = UtilNetwork.getFlowFrameRequest(this._themeId,this._assetId);
			var _loc4_:UtilURLStream = new UtilURLStream();
			_loc4_.addEventListener(Event.COMPLETE,this.loadImageDataComplete);
			_loc4_.addEventListener(IOErrorEvent.IO_ERROR,this.ioErrorHandler);
			_loc4_.load(_loc3_);
		}
		
		private function ioErrorHandler(param1:IOErrorEvent) : void
		{
			param1.stopImmediatePropagation();
		}
		
		public function loadImageDataComplete(param1:Event) : void
		{
			var _loc5_:UtilCrypto = null;
			var _loc2_:URLStream = URLStream(param1.target);
			var _loc3_:ByteArray = new ByteArray();
			_loc2_.readBytes(_loc3_,0,_loc2_.bytesAvailable);
			var _loc4_:ByteArray = _loc3_;
			_loc5_ = new UtilCrypto();
			_loc5_.decrypt(_loc4_);
			var _loc6_:LoaderContext = new LoaderContext();
			_loc6_.applicationDomain = new ApplicationDomain();
			this._flowImageSource = new Loader();
			this._flowImageSource.contentLoaderInfo.addEventListener(Event.INIT,this.flowImageSource_initHandler);
			this._flowImageSource.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.flowImageSource_errorHandler);
			this._flowImageSource.loadBytes(_loc4_,_loc6_);
		}
		
		private function flowImageSource_initHandler(param1:Event) : void
		{
			this.loadFrameImage();
			this.redraw();
			this.processInnerImage();
		}
		
		private function flowImageSource_errorHandler(param1:Event) : void
		{
			this.processInnerImage();
		}
		
		private function processInnerImage() : void
		{
			if(this._innerThemeId != null && this._innerEncAssetId != null)
			{
				this.updateInnerImageSource(this._innerThemeId,this._innerEncAssetId,this._autoFlowInnerImage,this._innerSignature);
			}
			else
			{
				this.notifyImageComplete();
			}
		}
		
		protected function clearInnerImageSource() : void
		{
			if(this._innerImageSource)
			{
				if(this._innerImageContainer.contains(this._innerImageSource))
				{
					this._innerImageContainer.removeChild(this._innerImageSource);
				}
				this._innerImageSource.contentLoaderInfo.removeEventListener(Event.INIT,this.innerImageSource_initHandler);
				this._innerImageSource.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,this.innerImageSource_errorHandler);
				this._innerImageSource.unloadAndStop();
				this._innerImageSource = null;
			}
			this.drawBaseColor();
		}
		
		public function removeInnerImageSource() : void
		{
			this._innerThemeId = null;
			this._innerAssetId = null;
			this.clearInnerImageSource();
		}
		
		public function initInnerImageSource(param1:String, param2:String, param3:Boolean = true, param4:String = null) : void
		{
			this._innerThemeId = param1;
			this._innerEncAssetId = param2;
			this._innerSignature = param4;
			this._autoFlowInnerImage = param3;
		}
		
		public function updateInnerImageSource(param1:String, param2:String, param3:Boolean = true, param4:String = null) : void
		{
			this._innerThemeId = param1;
			this._innerEncAssetId = param2;
			this._autoFlowInnerImage = param3;
			this._innerSignature = param4;
			this.clearInnerImageSource();
			var _loc5_:URLRequest = UtilNetwork.getInnerImageRequest(this._innerThemeId,this._innerEncAssetId,this._innerSignature);
			var _loc6_:LoaderContext = new LoaderContext();
			_loc6_.applicationDomain = new ApplicationDomain();
			this._innerImageSource = new Loader();
			this._innerImageSource.contentLoaderInfo.addEventListener(Event.INIT,this.innerImageSource_initHandler);
			this._innerImageSource.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.innerImageSource_errorHandler);
			this._innerImageSource.load(_loc5_,_loc6_);
		}
		
		private function innerImageSource_initHandler(param1:Event) : void
		{
			var _loc2_:Rectangle = null;
			var _loc3_:Bitmap = null;
			this._innerImageContainer.addChild(this._innerImageSource);
			if(this._innerImageSource.content)
			{
				_loc2_ = this._innerImageSource.content.getBounds(this._innerImageSource);
				this._innerImageSource.content.x = -(_loc2_.x + _loc2_.width / 2);
				this._innerImageSource.content.y = -(_loc2_.y + _loc2_.height / 2);
				_loc3_ = this._innerImageSource.content as Bitmap;
				if(_loc3_)
				{
					_loc3_.smoothing = true;
				}
			}
			if(this._autoFlowInnerImage)
			{
				if(this._fitMode == IMAGE_FIT_MODE_FIT_TO_IMAGE)
				{
					this.fitToImage();
				}
				else
				{
					this.fitToFrame();
				}
			}
			this.redraw();
			this.notifyImageComplete();
		}
		
		private function innerImageSource_errorHandler(param1:Event) : void
		{
			this.notifyImageComplete();
		}
		
		protected function notifyImageComplete() : void
		{
			dispatchEvent(new FlowFrameMakerEvent(FlowFrameMakerEvent.LOAD_IMAGE_COMPLETE));
		}
		
		public function dispose() : void
		{
			this.clearFlowImageSource();
			this.clearInnerImageSource();
		}
		
		public function get minFlowWidth() : Number
		{
			return this._minContentWidth + this.gridLeft + this.gridRight;
		}
		
		public function get minFlowHeight() : Number
		{
			return this._minContentHeight + this.gridTop + this.gridBottom;
		}
		
		public function getLayoutRect(param1:String) : Rectangle
		{
			var _loc2_:Rectangle = new Rectangle();
			switch(param1)
			{
				case FlowConstants.FLOW_TOP_LEFT:
					_loc2_.width = this.gridLeft;
					_loc2_.height = this.gridTop;
					break;
				case FlowConstants.FLOW_TOP:
					_loc2_.x = this.gridLeft;
					_loc2_.width = this.flowWidth - this.gridLeft - this.gridRight;
					_loc2_.height = this.gridTop;
					break;
				case FlowConstants.FLOW_TOP_RIGHT:
					_loc2_.x = this.flowWidth - this.gridRight;
					_loc2_.width = this.gridRight;
					_loc2_.height = this.gridTop;
					break;
				case FlowConstants.FLOW_LEFT:
					_loc2_.width = this.gridLeft;
					_loc2_.y = this.gridTop;
					_loc2_.height = this.flowHeight - this.gridTop - this.gridBottom;
					break;
				case FlowConstants.FLOW_CENTER:
					_loc2_.x = this.gridLeft - this._innerOffsetLeft;
					_loc2_.y = this.gridTop - this._innerOffsetTop;
					_loc2_.width = this.flowWidth - this.gridLeft - this.gridRight + this._innerOffsetLeft + this._innerOffsetRight;
					_loc2_.height = this.flowHeight - this.gridTop - this.gridBottom + this._innerOffsetTop + this._innerOffsetBottom;
					break;
				case FlowConstants.FLOW_RIGHT:
					_loc2_.x = this.flowWidth - this.gridRight;
					_loc2_.width = this.gridRight;
					_loc2_.y = this.gridTop;
					_loc2_.height = this.flowHeight - this.gridTop - this.gridBottom;
					break;
				case FlowConstants.FLOW_BOTTOM_LEFT:
					_loc2_.width = this.gridLeft;
					_loc2_.y = this.flowHeight - this.gridBottom;
					_loc2_.height = this.gridBottom;
					break;
				case FlowConstants.FLOW_BOTTOM:
					_loc2_.x = this.gridLeft;
					_loc2_.width = this.flowWidth - this.gridLeft - this.gridRight;
					_loc2_.y = this.flowHeight - this.gridBottom;
					_loc2_.height = this.gridBottom;
					break;
				case FlowConstants.FLOW_BOTTOM_RIGHT:
					_loc2_.x = this.flowWidth - this.gridRight;
					_loc2_.width = this.gridRight;
					_loc2_.y = this.flowHeight - this.gridBottom;
					_loc2_.height = this.gridBottom;
			}
			var _loc3_:Number = this.flowWidth * 0.5;
			var _loc4_:Number = this.flowHeight * 0.5;
			_loc2_.offset(-_loc3_,-_loc4_);
			return _loc2_;
		}
		
		public function addPart(param1:FlowFramePart) : void
		{
			this.parts.push(param1);
			this.partLookup[param1.partId] = param1;
			param1.container = this;
			this.addChild(param1);
		}
		
		public function loadImage() : void
		{
			this.updateFlowImageSource(this._themeId,this._assetId);
		}
		
		private function loadFrameImage() : void
		{
			var _loc1_:int = this.parts.length;
			var _loc2_:int = 0;
			while(_loc2_ < _loc1_)
			{
				this.parts[_loc2_].loadImage();
				_loc2_++;
			}
		}
		
		public function redraw() : void
		{
			this.updateParts();
			this.drawBaseColor();
			this.updateMask();
			this._invalidateFlag = false;
		}
		
		public function getPartImgae(param1:String) : Class
		{
			var _loc2_:Class = null;
			if(this._flowImageSource)
			{
				_loc2_ = Class(this._flowImageSource.content.loaderInfo.applicationDomain.getDefinition(param1));
			}
			return _loc2_;
		}
		
		public function validate() : void
		{
			if(this._invalidateFlag)
			{
				this.redraw();
			}
		}
		
		protected function updateParts() : void
		{
			var _loc1_:int = this.parts.length;
			var _loc2_:int = 0;
			while(_loc2_ < _loc1_)
			{
				this.parts[_loc2_].draw();
				_loc2_++;
			}
		}
		
		protected function drawBaseColor() : void
		{
			var _loc1_:Rectangle = this.getLayoutRect(FlowConstants.FLOW_CENTER);
			graphics.clear();
			if(this._displayContentRect && this.parts.length == 0 && this._innerImageSource == null)
			{
				graphics.lineStyle(0,PLACE_HOLDER_OUTER_COLOR);
				UtilDraw.drawDashRect(this,_loc1_.left,_loc1_.top,_loc1_.width,_loc1_.height,PLACE_HOLDER_DASH_LINE_LENGTH,PLACE_HOLDER_DASH_LINE_GAP);
				graphics.lineStyle(0,PLACE_HOLDER_INNER_COLOR);
				UtilDraw.drawDashRect(this,_loc1_.left + 1,_loc1_.top + 1,_loc1_.width - 2,_loc1_.height - 2,PLACE_HOLDER_DASH_LINE_LENGTH,PLACE_HOLDER_DASH_LINE_GAP);
			}
			graphics.lineStyle();
			graphics.beginFill(this._baseColor,this._opacity / 100);
			graphics.drawRect(_loc1_.left,_loc1_.top,_loc1_.width,_loc1_.height);
			graphics.endFill();
		}
		
		protected function fitToImage() : void
		{
			if(!this._innerImageSource || !this._innerImageSource.content || this._innerImageSource.content.height == 0)
			{
				return;
			}
			var _loc1_:Rectangle = this.getLayoutRect(FlowConstants.FLOW_CENTER);
			var _loc2_:Number = _loc1_.height / this._innerImageSource.content.height;
			var _loc3_:Number = this._innerImageSource.content.width * _loc2_;
			this._innerImageContainer.height = _loc1_.height;
			this._innerImageContainer.width = _loc3_;
			this.flowWidth = _loc3_ + this.gridLeft + this.gridRight - this._innerOffsetLeft - this._innerOffsetRight;
			this._innerImageContainer.x = _loc1_.x + 0.5 * _loc1_.width;
			this._innerImageContainer.y = _loc1_.y + 0.5 * _loc1_.height;
			this._innerImageContainer.rotation = 0;
			this.dispatchEvent(new FlowFrameMakerEvent(FlowFrameMakerEvent.RESIZE_BY_INNER_IMAGE));
			this.dispatchEvent(new FlowFrameMakerEvent(FlowFrameMakerEvent.INNER_IMAGE_AUTO_LAYOUT));
		}
		
		protected function fitToFrame() : void
		{
			var _loc1_:Rectangle = this.getLayoutRect(FlowConstants.FLOW_CENTER);
			var _loc2_:Rectangle = this._innerImageContainer.getBounds(this._innerImageContainer);
			if(_loc2_.width == 0 || _loc2_.height == 0)
			{
				return;
			}
			var _loc3_:Number = Math.min(_loc1_.width / _loc2_.width,_loc1_.height / _loc2_.height);
			this._innerImageContainer.scaleX = _loc3_;
			this._innerImageContainer.scaleY = _loc3_;
			this._innerImageContainer.x = _loc1_.x + 0.5 * _loc1_.width;
			this._innerImageContainer.y = _loc1_.y + 0.5 * _loc1_.height;
			this._innerImageContainer.rotation = 0;
			this.dispatchEvent(new FlowFrameMakerEvent(FlowFrameMakerEvent.RESIZE_BY_INNER_IMAGE));
			this.dispatchEvent(new FlowFrameMakerEvent(FlowFrameMakerEvent.INNER_IMAGE_AUTO_LAYOUT));
		}
		
		protected function updateMask() : void
		{
			var _loc1_:Rectangle = this.getLayoutRect(FlowConstants.FLOW_CENTER);
			this._innerImageMask.graphics.clear();
			this._innerImageMask.graphics.beginFill(16711680,0.5);
			this._innerImageMask.graphics.drawRect(_loc1_.x,_loc1_.y,_loc1_.width,_loc1_.height);
			this._innerImageMask.graphics.endFill();
		}
		
		public function moveInnerImage(param1:Number, param2:Number) : void
		{
			if(this._innerImageContainer.x == param1 && this._innerImageContainer.y == param2)
			{
				return;
			}
			if(this._innerImageContainer)
			{
				this._innerImageContainer.x = param1;
				this._innerImageContainer.y = param2;
			}
		}
		
		public function scaleInnerImage(param1:Number, param2:Number) : void
		{
			if(this._innerImageContainer)
			{
				this._innerImageContainer.scaleX = param1;
				this._innerImageContainer.scaleY = param2;
			}
		}
		
		public function rotateInnerImage(param1:Number) : void
		{
			if(this._innerImageContainer)
			{
				this._innerImageContainer.rotation = param1;
			}
		}
		
		public function get innerImageX() : Number
		{
			return !!this._innerImageContainer?Number(this._innerImageContainer.x):Number(0);
		}
		
		public function get innerImageY() : Number
		{
			return !!this._innerImageContainer?Number(this._innerImageContainer.y):Number(0);
		}
		
		public function get innerImageScaleX() : Number
		{
			return !!this._innerImageContainer?Number(this._innerImageContainer.scaleX):Number(1);
		}
		
		public function get innerImageScaleY() : Number
		{
			return !!this._innerImageContainer?Number(this._innerImageContainer.scaleY):Number(1);
		}
		
		public function get innerImageRotation() : Number
		{
			return !!this._innerImageContainer?Number(this._innerImageContainer.rotation):Number(0);
		}
		
		public function resizeFrame(param1:Number, param2:Number) : void
		{
			this.flowWidth = param1;
			this.flowHeight = param2;
			this.validate();
		}
		
		public function showInnerImage() : void
		{
			this._innerImageContainer.visible = true;
		}
		
		public function hideInnerImage() : void
		{
			this._innerImageContainer.visible = false;
		}
		
		public function set fitMode(param1:int) : void
		{
			if(this._fitMode != param1)
			{
				this._fitMode = param1;
				if(this._innerImageSource)
				{
					if(this._fitMode == IMAGE_FIT_MODE_FIT_TO_IMAGE)
					{
						this.fitToImage();
					}
					else
					{
						this.flowWidth = this._defaultFlowWidth;
						this.flowHeight = this._defaultFlowHeight;
						this.fitToFrame();
					}
					this.validate();
				}
			}
		}
	}
}
