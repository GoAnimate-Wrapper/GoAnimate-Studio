package anifire.studio.core
{
	import anifire.constant.AnimeConstants;
	import anifire.studio.events.AssetEvent;
	import anifire.studio.events.FlowFrameEvent;
	import anifire.studio.interfaces.IResizable;
	import anifire.util.Util;
	import anifire.util.UtilMath;
	import flash.geom.Rectangle;
	
	public class FlowFrame extends Prop implements IResizable
	{
		
		public static const XML_NODE_NAME:String = "imgframe";
		
		public static const XML_NODE_NAME_WIDTH:String = "width";
		
		public static const XML_NODE_NAME_HEIGHT:String = "height";
		
		public static const XML_NODE_NAME_COLOR:String = "color";
		
		public static const XML_NODE_NAME_OPACITY:String = "opacity";
		
		public static const XML_NODE_NAME_IMAGE_FILE:String = "imgfile";
		
		public static const XML_NODE_NAME_IMAGE_SCALE_X:String = "imgsx";
		
		public static const XML_NODE_NAME_IMAGE_SCALE_Y:String = "imgsy";
		
		public static const XML_NODE_NAME_IMAGE_X:String = "imgx";
		
		public static const XML_NODE_NAME_IMAGE_Y:String = "imgy";
		
		public static const XML_NODE_NAME_IMAGE_ROTATION:String = "imgrot";
		
		public static const XML_ATTRIBUTE_NAME_FIT_MODE:String = "fitMode";
		
		public static const IMAGE_FIT_MODE_FIT_TO_IMAGE:int = 0;
		
		public static const IMAGE_FIT_MODE_FIT_TO_FRAME:int = 1;
		 
		
		protected var _innerImageId:String;
		
		private var _color:uint = 0;
		
		private var _opacity:int = 0;
		
		private var _innerImageX:Number = 0;
		
		private var _innerImageY:Number = 0;
		
		private var _innerImageScaleX:Number = 1;
		
		private var _innerImageScaleY:Number = 1;
		
		private var _innerImageWidth:Number = 0;
		
		private var _innerImageHeight:Number = 0;
		
		private var _innerImageRotation:Number = 0;
		
		private var _innerBoundary:Rectangle;
		
		public var gridLeft:Number = 0;
		
		public var gridTop:Number = 0;
		
		public var gridRight:Number = 0;
		
		public var gridBottom:Number = 0;
		
		public var innerOffsetLeft:Number = 0;
		
		public var innerOffsetRight:Number = 0;
		
		public var innerOffsetTop:Number = 0;
		
		public var innerOffsetBottom:Number = 0;
		
		public var innerImageHasBeenChanged:Boolean;
		
		private var _fitMode:int = 0;
		
		public var autoFlowInnerImage:Boolean = true;
		
		private var _isAddButtonClicked:Boolean;
		
		private var _bounds:Rectangle;
		
		private var _minWidth:Number;
		
		private var _minHeight:Number;
		
		protected var _editMode:Boolean;
		
		public function FlowFrame(param1:String = "")
		{
			this._innerBoundary = new Rectangle();
			this._bounds = new Rectangle();
			super(param1);
		}
		
		public function get isAddButtonClicked() : Boolean
		{
			return this._isAddButtonClicked;
		}
		
		public function set isAddButtonClicked(param1:Boolean) : void
		{
			this._isAddButtonClicked = param1;
			this.dispatchEvent(new FlowFrameEvent(FlowFrameEvent.FLOWFRAME_CLICKED));
		}
		
		public function resetAddButtonClick() : void
		{
			this._isAddButtonClicked = false;
		}
		
		override public function convertToXml() : XML
		{
			var _loc1_:XML = new XML("<" + XML_NODE_NAME + "/>");
			_loc1_.@id = this.id;
			_loc1_.@index = String(this.scene.getOverallOrdering(this));
			_loc1_[XML_ATTRIBUTE_NAME_FIT_MODE] = this.fitMode;
			if(thumb)
			{
				_loc1_.file = thumb.themeId + "." + thumb.id;
			}
			_loc1_.x = serializeMotion(PROPERTY_X,this.motionShadow);
			_loc1_.y = serializeMotion(PROPERTY_Y,this.motionShadow);
			_loc1_.xscale = serializeMotion(PROPERTY_X_SCALE,this.motionShadow);
			_loc1_.yscale = serializeMotion(PROPERTY_Y_SCALE,this.motionShadow);
			_loc1_.width = Util.roundNum(this.width);
			_loc1_.height = Util.roundNum(this.height);
			_loc1_.face = serializeMotion(PROPERTY_FACING,this.motionShadow);
			_loc1_.rotation = serializeMotion(PROPERTY_ROTATION,this.motionShadow);
			if(this.motionData)
			{
				_loc1_.appendChild(this.motionData.convertToXml());
			}
			_loc1_.color = this._color;
			_loc1_.opacity = this._opacity;
			if(this._innerImageId)
			{
				_loc1_.imgfile = this._innerImageId;
				_loc1_.imgsx = this._innerImageScaleX.toFixed(4);
				_loc1_.imgsy = this._innerImageScaleY.toFixed(4);
				_loc1_.imgx = this._innerImageX.toFixed(2);
				_loc1_.imgy = this._innerImageY.toFixed(2);
				_loc1_.imgrot = this._innerImageRotation.toFixed(2);
			}
			return _loc1_;
		}
		
		override public function deSerialize(param1:XML, param2:Character, param3:AnimeScene = null, param4:Boolean = true, param5:Boolean = true) : void
		{
			super.deSerialize(param1,param2,param3,param4,param5);
			if(!param1)
			{
				return;
			}
			this.resize(Number(param1.width),Number(param1.height));
			if(param1.hasOwnProperty("@" + XML_ATTRIBUTE_NAME_FIT_MODE))
			{
				this._fitMode = int(param1.attribute(XML_ATTRIBUTE_NAME_FIT_MODE)[0]);
			}
			if(param1.hasOwnProperty(XML_NODE_NAME_COLOR))
			{
				this._color = uint(param1.color[0]);
			}
			if(param1.hasOwnProperty(XML_NODE_NAME_OPACITY))
			{
				this._opacity = uint(param1.child(XML_NODE_NAME_OPACITY)[0]);
			}
			if(param1.hasOwnProperty(XML_NODE_NAME_IMAGE_FILE))
			{
				this._innerImageId = String(param1[XML_NODE_NAME_IMAGE_FILE]);
				this.innerImageHasBeenChanged = true;
			}
			else
			{
				this._innerImageId = null;
			}
			if(param1.hasOwnProperty(XML_NODE_NAME_IMAGE_SCALE_X))
			{
				this._innerImageScaleX = Number(param1.imgsx[0]);
			}
			if(param1.hasOwnProperty(XML_NODE_NAME_IMAGE_SCALE_Y))
			{
				this._innerImageScaleY = Number(param1.imgsy[0]);
			}
			if(param1.hasOwnProperty(XML_NODE_NAME_IMAGE_X))
			{
				this._innerImageX = Number(param1.imgx[0]);
			}
			if(param1.hasOwnProperty(XML_NODE_NAME_IMAGE_Y))
			{
				this._innerImageY = Number(param1.imgy[0]);
			}
			if(param1.hasOwnProperty(XML_NODE_NAME_IMAGE_ROTATION))
			{
				this._innerImageRotation = Number(param1.imgrot[0]);
			}
			var _loc6_:FlowFrame = this.motionShadow as FlowFrame;
			if(_loc6_ && this.innerImageId)
			{
				_loc6_.innerImageId = this.innerImageId;
				_loc6_.moveInnerImage(this.innerImageX,this.innerImageY);
				_loc6_.scaleInnerImage(this.innerImageScaleX,this.innerImageScaleY);
				_loc6_.innerImageRotation = this.innerImageRotation;
			}
		}
		
		public function get innerImageId() : String
		{
			return this._innerImageId;
		}
		
		public function set innerImageId(param1:String) : void
		{
			if(this._innerImageId == param1)
			{
				return;
			}
			this._innerImageId = param1;
			this.innerImageHasBeenChanged = true;
			this.moveInnerImage(0,0);
			this.scaleInnerImage(1,1);
			this.innerImageRotation = 0;
			dispatchEvent(new FlowFrameEvent(FlowFrameEvent.IMAGE_CHANGE));
			var _loc2_:FlowFrame = _motionShadow as FlowFrame;
			if(_loc2_)
			{
				_loc2_.innerImageId = param1;
			}
		}
		
		public function get innerImageThemeId() : String
		{
			var _loc1_:int = 0;
			if(this._innerImageId)
			{
				_loc1_ = this._innerImageId.indexOf(".");
				if(_loc1_ > 0)
				{
					return this._innerImageId.substring(0,_loc1_);
				}
			}
			return null;
		}
		
		public function get innerImageAssetId() : String
		{
			var _loc1_:int = 0;
			var _loc2_:String = null;
			var _loc3_:String = null;
			if(this._innerImageId)
			{
				_loc1_ = this._innerImageId.indexOf(".");
				if(_loc1_ > 0)
				{
					_loc2_ = this._innerImageId.substring(0,_loc1_);
					_loc3_ = this._innerImageId.substring(_loc1_ + 1);
					_loc1_ = _loc3_.indexOf(".");
					if(_loc1_ > 0 && _loc1_ != _loc3_.length - 4)
					{
						_loc3_ = _loc3_.substring(0,_loc1_);
					}
					return _loc3_;
				}
			}
			return null;
		}
		
		public function get innerImageX() : Number
		{
			return this._innerImageX;
		}
		
		public function get innerImageY() : Number
		{
			return this._innerImageY;
		}
		
		public function moveInnerImage(param1:Number, param2:Number) : void
		{
			if(this._innerImageX == param1 && this._innerImageY == param2)
			{
				return;
			}
			this._innerImageX = param1;
			this._innerImageY = param2;
			this.dispatchEvent(new FlowFrameEvent(FlowFrameEvent.IMAGE_MOVE));
			var _loc3_:FlowFrame = this.motionShadow as FlowFrame;
			if(_loc3_)
			{
				_loc3_.moveInnerImage(param1,param2);
			}
		}
		
		public function get innerImageScaleX() : Number
		{
			return this._innerImageScaleX;
		}
		
		public function get innerImageScaleY() : Number
		{
			return this._innerImageScaleY;
		}
		
		public function scaleInnerImage(param1:Number, param2:Number) : void
		{
			if(this._innerImageScaleX == param1 && this._innerImageScaleY == param2)
			{
				return;
			}
			if(param1 <= 0 || param2 <= 0)
			{
				return;
			}
			this._innerImageScaleX = param1;
			this._innerImageScaleY = param2;
			this.dispatchEvent(new FlowFrameEvent(FlowFrameEvent.IMAGE_SCALE));
			var _loc3_:FlowFrame = this.motionShadow as FlowFrame;
			if(_loc3_)
			{
				_loc3_.scaleInnerImage(param1,param2);
			}
		}
		
		public function get innerImageRotation() : Number
		{
			return this._innerImageRotation;
		}
		
		public function set innerImageRotation(param1:Number) : void
		{
			if(this._innerImageRotation == param1)
			{
				return;
			}
			this._innerImageRotation = param1;
			this.dispatchEvent(new FlowFrameEvent(FlowFrameEvent.IMAGE_ROTATE));
			var _loc2_:FlowFrame = this.motionShadow as FlowFrame;
			if(_loc2_)
			{
				_loc2_.innerImageRotation = param1;
			}
		}
		
		public function get color() : uint
		{
			return this._color;
		}
		
		public function set color(param1:uint) : void
		{
			if(this._color != param1)
			{
				this._color = param1;
				dispatchEvent(new AssetEvent(AssetEvent.COLOR_CHANGE,this));
			}
		}
		
		public function get opacity() : int
		{
			return this._opacity;
		}
		
		public function set opacity(param1:int) : void
		{
			if(this._opacity != param1)
			{
				this._opacity = param1;
				dispatchEvent(new AssetEvent(AssetEvent.COLOR_CHANGE,this));
			}
		}
		
		override public function set thumb(param1:Thumb) : void
		{
			super.thumb = param1;
			var _loc2_:FlowFrameThumb = param1 as FlowFrameThumb;
			if(!_loc2_)
			{
				return;
			}
			this.gridLeft = _loc2_.gridLeft;
			this.gridTop = _loc2_.gridTop;
			this.gridRight = _loc2_.gridRight;
			this.gridBottom = _loc2_.gridBottom;
			this.innerOffsetLeft = _loc2_.innerOffsetLeft;
			this.innerOffsetRight = _loc2_.innerOffsetRight;
			this.innerOffsetTop = _loc2_.innerOffsetTop;
			this.innerOffsetBottom = _loc2_.innerOffsetBottom;
			this._minWidth = _loc2_.minFrameWidth;
			this._minHeight = _loc2_.minFrameHeight;
			this._fitMode = _loc2_.fitMode;
			if(_isSwapping)
			{
				_isSwapping = false;
			}
			else
			{
				this.resize(_loc2_.frameWidth,_loc2_.frameHeight);
			}
		}
		
		public function get bounds() : Rectangle
		{
			return this._bounds;
		}
		
		public function set bounds(param1:Rectangle) : void
		{
			if(param1)
			{
				this._bounds.x = param1.x;
				this._bounds.y = param1.y;
				this._bounds.width = param1.width;
				this._bounds.height = param1.height;
				this.updateInnerBoundary();
				this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_RESIZED,this));
				this.dispatchEvent(new AssetEvent(AssetEvent.MOTION_CHANGE,this));
				this.dispatchEvent(new FlowFrameEvent(FlowFrameEvent.FRAME_RESIZE));
			}
			if(motionShadow is FlowFrame)
			{
				(motionShadow as FlowFrame).bounds = param1;
			}
		}
		
		private function updateInnerBoundary() : void
		{
			this._innerBoundary.left = this._bounds.left + this.gridLeft - this.innerOffsetLeft;
			this._innerBoundary.top = this._bounds.top + this.gridTop - this.innerOffsetTop;
			this._innerBoundary.right = this._bounds.right - this.gridRight + this.innerOffsetRight;
			this._innerBoundary.bottom = this._bounds.bottom - this.gridBottom + this.innerOffsetBottom;
		}
		
		public function get innerBoundary() : Rectangle
		{
			return this._innerBoundary;
		}
		
		override public function get minWidth() : Number
		{
			return this._minWidth;
		}
		
		override public function get minHeight() : Number
		{
			return this._minHeight;
		}
		
		override public function get width() : Number
		{
			return this._bounds.width;
		}
		
		override public function set width(param1:Number) : void
		{
			param1 = UtilMath.boundaryCheck(param1,this.minWidth,this.maxWidth);
			this._bounds.width = param1;
			this._bounds.x = -param1 / 2;
			if(motionShadow)
			{
				motionShadow.width = param1;
			}
			this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_RESIZED,this));
			this.dispatchEvent(new AssetEvent(AssetEvent.MOTION_CHANGE,this));
			this.dispatchEvent(new FlowFrameEvent(FlowFrameEvent.FRAME_RESIZE));
		}
		
		override public function get height() : Number
		{
			return this._bounds.height;
		}
		
		override public function set height(param1:Number) : void
		{
			param1 = UtilMath.boundaryCheck(param1,this.minHeight,this.maxHeight);
			this._bounds.height = param1;
			this._bounds.y = -param1 / 2;
			if(motionShadow)
			{
				motionShadow.height = param1;
			}
			this.dispatchEvent(new AssetEvent(AssetEvent.ASSET_RESIZED,this));
			this.dispatchEvent(new AssetEvent(AssetEvent.MOTION_CHANGE,this));
			this.dispatchEvent(new FlowFrameEvent(FlowFrameEvent.FRAME_RESIZE));
		}
		
		public function resize(param1:Number, param2:Number, param3:Boolean = false) : void
		{
			this.bounds = new Rectangle(-param1 / 2,-param2 / 2,param1,param2);
		}
		
		public function get rect() : Rectangle
		{
			return this._bounds;
		}
		
		override public function clone(param1:Boolean = false, param2:AnimeScene = null) : Asset
		{
			var _loc3_:FlowFrame = new FlowFrame();
			_loc3_.id = this.id;
			_loc3_.init(this.thumb,null);
			_loc3_.attachedBg = this.attachedBg;
			_loc3_.scene = this.scene;
			_loc3_.move(this.x,this.y);
			_loc3_.setReferencePoint(this.referenceX,this.referenceY);
			_loc3_.resize(this.width,this.height);
			_loc3_.scaleX = this.scaleX;
			_loc3_.scaleY = this.scaleY;
			_loc3_.rotation = this.rotation;
			_loc3_.facing = this.facing;
			_loc3_.color = this.color;
			_loc3_.opacity = this.opacity;
			_loc3_.innerImageHasBeenChanged = this.innerImageHasBeenChanged;
			_loc3_.fitMode = this.fitMode;
			if(this.innerImageId)
			{
				_loc3_.innerImageId = this.innerImageId;
				_loc3_.moveInnerImage(this.innerImageX,this.innerImageY);
				_loc3_.scaleInnerImage(this.innerImageScaleX,this.innerImageScaleY);
				_loc3_.innerImageRotation = this.innerImageRotation;
			}
			if(motionData)
			{
				_loc3_.motionData = motionData.clone();
			}
			if(motionShadow)
			{
				_loc3_.motionShadow = motionShadow.clone() as Prop;
			}
			return _loc3_;
		}
		
		override public function flipIt() : void
		{
			this.facing = this.facing == AnimeConstants.FACING_RIGHT?AnimeConstants.FACING_LEFT:AnimeConstants.FACING_RIGHT;
			if(this.motionShadow)
			{
				this.motionShadow.flipIt();
			}
		}
		
		override public function get isFlipped() : Boolean
		{
			return this.facing == AnimeConstants.FACING_RIGHT;
		}
		
		override public function swapWithThumb(param1:PropThumb) : void
		{
			var _loc3_:Number = NaN;
			var _loc4_:Number = NaN;
			var _loc5_:Number = NaN;
			var _loc6_:Number = NaN;
			var _loc7_:Number = NaN;
			var _loc8_:Number = NaN;
			var _loc9_:Rectangle = null;
			var _loc2_:FlowFrameThumb = param1 as FlowFrameThumb;
			if(_loc2_)
			{
				_isSwapping = true;
				_loc3_ = _loc2_.gridLeft - _loc2_.innerOffsetLeft - (this.gridLeft - this.innerOffsetLeft);
				_loc4_ = _loc2_.gridRight - _loc2_.innerOffsetRight - (this.gridRight - this.innerOffsetRight);
				_loc5_ = _loc2_.gridTop - _loc2_.innerOffsetTop - (this.gridTop - this.innerOffsetTop);
				_loc6_ = _loc2_.gridBottom - _loc2_.innerOffsetBottom - (this.gridBottom - this.innerOffsetBottom);
				_loc7_ = Math.max(_loc2_.minFrameWidth,this._bounds.width + _loc3_ + _loc4_);
				_loc8_ = Math.max(_loc2_.minFrameHeight,this._bounds.height + _loc5_ + _loc6_);
				_loc9_ = new Rectangle();
				_loc9_.x = _loc9_.x - (_loc2_.gridLeft - this.gridLeft);
				_loc9_.width = _loc7_;
				_loc9_.y = _loc9_.y - (_loc2_.gridTop - this.gridTop);
				_loc9_.height = _loc8_;
				this.bounds = _loc9_;
				this._innerImageX = this._innerImageX - (_loc4_ - _loc3_) * 0.5;
				this._innerImageY = this._innerImageY - (_loc6_ - _loc5_) * 0.5;
				this.thumb = param1;
				dispatchEvent(new AssetEvent(AssetEvent.STATE_CHANGE,this));
				if(_motionShadow)
				{
					_motionShadow.swapWithThumb(param1);
				}
			}
		}
		
		public function get editMode() : Boolean
		{
			return this._editMode;
		}
		
		public function startEditMode() : void
		{
			if(!this._editMode)
			{
				this._editMode = true;
				dispatchEvent(new FlowFrameEvent(FlowFrameEvent.EDIT_MODE_START));
			}
		}
		
		public function completeEditMode() : void
		{
			if(this._editMode)
			{
				this._editMode = false;
				dispatchEvent(new FlowFrameEvent(FlowFrameEvent.EDIT_MODE_COMPLETE));
			}
		}
		
		public function get fitMode() : int
		{
			return this._fitMode;
		}
		
		public function set fitMode(param1:int) : void
		{
			if(this._fitMode != param1)
			{
				this._fitMode = param1;
				this.dispatchEvent(new FlowFrameEvent(FlowFrameEvent.FIT_MODE_CHANGE));
			}
		}
		
		public function getInnerImageGeometry() : FlowFrameInnerImageGeometry
		{
			var _loc1_:FlowFrameInnerImageGeometry = new FlowFrameInnerImageGeometry();
			_loc1_.x = this.innerImageX;
			_loc1_.y = this.innerImageY;
			_loc1_.scaleX = this.innerImageScaleX;
			_loc1_.scaleY = this.innerImageScaleY;
			_loc1_.rotation = this.innerImageRotation;
			return _loc1_;
		}
		
		public function updateInnerImageGeometry(param1:FlowFrameInnerImageGeometry) : void
		{
			if(param1)
			{
				this.moveInnerImage(param1.x,param1.y);
				this.scaleInnerImage(param1.scaleX,param1.scaleY);
				this.innerImageRotation = param1.rotation;
			}
		}
	}
}
