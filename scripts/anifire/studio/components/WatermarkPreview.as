package anifire.studio.components
{
	import anifire.studio.managers.WatermarkManager;
	import anifire.studio.models.WatermarkData;
	import mx.binding.BindingManager;
	import mx.core.IFlexModuleFactory;
	import mx.events.FlexEvent;
	import mx.events.PropertyChangeEvent;
	import mx.graphics.SolidColor;
	import mx.graphics.SolidColorStroke;
	import spark.components.Group;
	import spark.components.Image;
	import spark.primitives.BitmapImage;
	import spark.primitives.Rect;
	
	public class WatermarkPreview extends Group
	{
		
		private static var imgDefaultWatermark:Class = WatermarkPreview_imgDefaultWatermark;
		 
		
		private var _97692013frame:Rect;
		
		private var _2024940825imageDisplay:Image;
		
		private var _838959007noWatermarkDisplay:BitmapImage;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		private var _data:WatermarkData;
		
		private var _embed_mxml__styles_images_watermark_no_watermark_png_1015786135:Class;
		
		public function WatermarkPreview()
		{
			this._embed_mxml__styles_images_watermark_no_watermark_png_1015786135 = WatermarkPreview__embed_mxml__styles_images_watermark_no_watermark_png_1015786135;
			super();
			mx_internal::_document = this;
			this.mxmlContent = [this._WatermarkPreview_Rect1_i(),this._WatermarkPreview_Group2_c(),this._WatermarkPreview_BitmapImage1_i()];
			this.addEventListener("creationComplete",this.___WatermarkPreview_Group1_creationComplete);
		}
		
		override public function set moduleFactory(param1:IFlexModuleFactory) : void
		{
			super.moduleFactory = param1;
			if(this.__moduleFactoryInitialized)
			{
				return;
			}
			this.__moduleFactoryInitialized = true;
		}
		
		override public function initialize() : void
		{
			super.initialize();
		}
		
		public function get data() : WatermarkData
		{
			return this._data;
		}
		
		public function set data(param1:WatermarkData) : void
		{
			var _loc2_:Boolean = false;
			this._data = param1;
			if(this._data)
			{
				if(this._data.id == WatermarkManager.DEFAULT_WATERMARK_ID)
				{
					this.imageDisplay.source = imgDefaultWatermark;
				}
				else if(this._data.id == WatermarkManager.NO_WATERMARK_ID)
				{
					_loc2_ = true;
				}
				else
				{
					this.imageDisplay.source = this._data.url;
				}
			}
			else
			{
				_loc2_ = true;
			}
			if(_loc2_)
			{
				this.noWatermarkDisplay.visible = true;
				this.imageDisplay.visible = false;
				this.frame.visible = false;
			}
			else
			{
				this.noWatermarkDisplay.visible = false;
				this.imageDisplay.visible = true;
				this.frame.visible = true;
			}
		}
		
		protected function init() : void
		{
			this.imageDisplay.maxWidth = getLayoutBoundsWidth() - 10;
			this.imageDisplay.maxHeight = getLayoutBoundsHeight() - 10;
		}
		
		private function _WatermarkPreview_Rect1_i() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.radiusX = 5;
			_loc1_.stroke = this._WatermarkPreview_SolidColorStroke1_c();
			_loc1_.fill = this._WatermarkPreview_SolidColor1_c();
			_loc1_.initialized(this,"frame");
			this.frame = _loc1_;
			BindingManager.executeBindings(this,"frame",this.frame);
			return _loc1_;
		}
		
		private function _WatermarkPreview_SolidColorStroke1_c() : SolidColorStroke
		{
			var _loc1_:SolidColorStroke = new SolidColorStroke();
			_loc1_.color = 13355989;
			return _loc1_;
		}
		
		private function _WatermarkPreview_SolidColor1_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 16777215;
			return _loc1_;
		}
		
		private function _WatermarkPreview_Group2_c() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.left = 5;
			_loc1_.right = 5;
			_loc1_.top = 5;
			_loc1_.bottom = 5;
			_loc1_.mxmlContent = [this._WatermarkPreview_Image1_i()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _WatermarkPreview_Image1_i() : Image
		{
			var _loc1_:Image = new Image();
			_loc1_.verticalCenter = 0;
			_loc1_.horizontalCenter = 0;
			_loc1_.smooth = true;
			_loc1_.fillMode = "scale";
			_loc1_.scaleMode = "letterbox";
			_loc1_.id = "imageDisplay";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.imageDisplay = _loc1_;
			BindingManager.executeBindings(this,"imageDisplay",this.imageDisplay);
			return _loc1_;
		}
		
		private function _WatermarkPreview_BitmapImage1_i() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.source = this._embed_mxml__styles_images_watermark_no_watermark_png_1015786135;
			_loc1_.initialized(this,"noWatermarkDisplay");
			this.noWatermarkDisplay = _loc1_;
			BindingManager.executeBindings(this,"noWatermarkDisplay",this.noWatermarkDisplay);
			return _loc1_;
		}
		
		public function ___WatermarkPreview_Group1_creationComplete(param1:FlexEvent) : void
		{
			this.init();
		}
		
		[Bindable(event="propertyChange")]
		public function get frame() : Rect
		{
			return this._97692013frame;
		}
		
		public function set frame(param1:Rect) : void
		{
			var _loc2_:Object = this._97692013frame;
			if(_loc2_ !== param1)
			{
				this._97692013frame = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"frame",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get imageDisplay() : Image
		{
			return this._2024940825imageDisplay;
		}
		
		public function set imageDisplay(param1:Image) : void
		{
			var _loc2_:Object = this._2024940825imageDisplay;
			if(_loc2_ !== param1)
			{
				this._2024940825imageDisplay = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imageDisplay",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get noWatermarkDisplay() : BitmapImage
		{
			return this._838959007noWatermarkDisplay;
		}
		
		public function set noWatermarkDisplay(param1:BitmapImage) : void
		{
			var _loc2_:Object = this._838959007noWatermarkDisplay;
			if(_loc2_ !== param1)
			{
				this._838959007noWatermarkDisplay = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"noWatermarkDisplay",_loc2_,param1));
				}
			}
		}
	}
}
