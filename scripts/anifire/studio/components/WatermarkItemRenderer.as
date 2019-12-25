package anifire.studio.components
{
	import anifire.studio.managers.WatermarkManager;
	import anifire.studio.models.WatermarkData;
	import anifire.util.UtilDict;
	import mx.binding.BindingManager;
	import mx.core.DeferredInstanceFromFunction;
	import mx.core.IFlexModuleFactory;
	import mx.core.IStateClient2;
	import mx.events.PropertyChangeEvent;
	import mx.graphics.SolidColor;
	import mx.graphics.SolidColorStroke;
	import mx.states.AddItems;
	import mx.states.SetProperty;
	import mx.states.State;
	import spark.components.Image;
	import spark.components.supportClasses.ItemRenderer;
	import spark.primitives.BitmapImage;
	import spark.primitives.Rect;
	
	public class WatermarkItemRenderer extends ItemRenderer implements IStateClient2
	{
		
		private static var noWaterMarkImage:Class = WatermarkItemRenderer_noWaterMarkImage;
		
		private static var defaultWaterMarkImage:Class = WatermarkItemRenderer_defaultWaterMarkImage;
		 
		
		public var _WatermarkItemRenderer_BitmapImage1:BitmapImage;
		
		public var _WatermarkItemRenderer_Rect2:Rect;
		
		private var _354639011_WatermarkItemRenderer_SolidColorStroke1:SolidColorStroke;
		
		private var _670429015watermarkImage:Image;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		private var _embed_mxml__styles_images_watermark_watermark_selected_png_595666505:Class;
		
		public function WatermarkItemRenderer()
		{
			this._embed_mxml__styles_images_watermark_watermark_selected_png_595666505 = WatermarkItemRenderer__embed_mxml__styles_images_watermark_watermark_selected_png_595666505;
			super();
			mx_internal::_document = this;
			this.width = 104;
			this.height = 63;
			this.autoDrawBackground = false;
			this.buttonMode = true;
			this.mxmlContent = [this._WatermarkItemRenderer_Rect1_c(),this._WatermarkItemRenderer_Image1_i(),this._WatermarkItemRenderer_Rect2_i()];
			this.currentState = "normal";
			var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._WatermarkItemRenderer_BitmapImage1_i);
			states = [new State({
				"name":"normal",
				"overrides":[]
			}),new State({
				"name":"hovered",
				"stateGroups":["hoveredAndSelected"],
				"overrides":[new SetProperty().initializeFromObject({
					"target":"_WatermarkItemRenderer_SolidColorStroke1",
					"name":"color",
					"value":4439205
				}),new SetProperty().initializeFromObject({
					"target":"_WatermarkItemRenderer_SolidColorStroke1",
					"name":"weight",
					"value":3
				})]
			}),new State({
				"name":"selected",
				"stateGroups":["hoveredAndSelected"],
				"overrides":[new AddItems().initializeFromObject({
					"itemsFactory":_loc1_,
					"destination":null,
					"propertyName":"mxmlContent",
					"position":"after",
					"relativeTo":["_WatermarkItemRenderer_Rect2"]
				}),new SetProperty().initializeFromObject({
					"target":"_WatermarkItemRenderer_SolidColorStroke1",
					"name":"color",
					"value":4439205
				}),new SetProperty().initializeFromObject({
					"target":"_WatermarkItemRenderer_SolidColorStroke1",
					"name":"weight",
					"value":3
				})]
			})];
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
		
		override public function set data(param1:Object) : void
		{
			super.data = param1;
			var _loc2_:WatermarkData = param1 as WatermarkData;
			if(_loc2_)
			{
				if(_loc2_.id == WatermarkManager.DEFAULT_WATERMARK_ID)
				{
					this.watermarkImage.source = defaultWaterMarkImage;
					toolTip = UtilDict.toDisplay("go","Vyond logo");
				}
				else if(_loc2_.id == WatermarkManager.NO_WATERMARK_ID)
				{
					this.watermarkImage.source = noWaterMarkImage;
					toolTip = UtilDict.toDisplay("go","No logo");
				}
				else
				{
					this.watermarkImage.source = _loc2_.url;
					toolTip = null;
				}
			}
		}
		
		private function _WatermarkItemRenderer_Rect1_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.radiusX = 4;
			_loc1_.fill = this._WatermarkItemRenderer_SolidColor1_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _WatermarkItemRenderer_SolidColor1_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 16777215;
			return _loc1_;
		}
		
		private function _WatermarkItemRenderer_Image1_i() : Image
		{
			var _loc1_:Image = new Image();
			_loc1_.smooth = true;
			_loc1_.maxWidth = 104;
			_loc1_.maxHeight = 63;
			_loc1_.verticalCenter = 0;
			_loc1_.horizontalCenter = 0;
			_loc1_.verticalAlign = "middle";
			_loc1_.horizontalAlign = "center";
			_loc1_.id = "watermarkImage";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.watermarkImage = _loc1_;
			BindingManager.executeBindings(this,"watermarkImage",this.watermarkImage);
			return _loc1_;
		}
		
		private function _WatermarkItemRenderer_Rect2_i() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.radiusX = 4;
			_loc1_.stroke = this._WatermarkItemRenderer_SolidColorStroke1_i();
			_loc1_.initialized(this,"_WatermarkItemRenderer_Rect2");
			this._WatermarkItemRenderer_Rect2 = _loc1_;
			BindingManager.executeBindings(this,"_WatermarkItemRenderer_Rect2",this._WatermarkItemRenderer_Rect2);
			return _loc1_;
		}
		
		private function _WatermarkItemRenderer_SolidColorStroke1_i() : SolidColorStroke
		{
			var _loc1_:SolidColorStroke = new SolidColorStroke();
			_loc1_.color = 13289940;
			this._WatermarkItemRenderer_SolidColorStroke1 = _loc1_;
			BindingManager.executeBindings(this,"_WatermarkItemRenderer_SolidColorStroke1",this._WatermarkItemRenderer_SolidColorStroke1);
			return _loc1_;
		}
		
		private function _WatermarkItemRenderer_BitmapImage1_i() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.source = this._embed_mxml__styles_images_watermark_watermark_selected_png_595666505;
			_loc1_.top = -8;
			_loc1_.right = -12;
			_loc1_.initialized(this,"_WatermarkItemRenderer_BitmapImage1");
			this._WatermarkItemRenderer_BitmapImage1 = _loc1_;
			BindingManager.executeBindings(this,"_WatermarkItemRenderer_BitmapImage1",this._WatermarkItemRenderer_BitmapImage1);
			return _loc1_;
		}
		
		[Bindable(event="propertyChange")]
		public function get _WatermarkItemRenderer_SolidColorStroke1() : SolidColorStroke
		{
			return this._354639011_WatermarkItemRenderer_SolidColorStroke1;
		}
		
		public function set _WatermarkItemRenderer_SolidColorStroke1(param1:SolidColorStroke) : void
		{
			var _loc2_:Object = this._354639011_WatermarkItemRenderer_SolidColorStroke1;
			if(_loc2_ !== param1)
			{
				this._354639011_WatermarkItemRenderer_SolidColorStroke1 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_WatermarkItemRenderer_SolidColorStroke1",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get watermarkImage() : Image
		{
			return this._670429015watermarkImage;
		}
		
		public function set watermarkImage(param1:Image) : void
		{
			var _loc2_:Object = this._670429015watermarkImage;
			if(_loc2_ !== param1)
			{
				this._670429015watermarkImage = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"watermarkImage",_loc2_,param1));
				}
			}
		}
	}
}
