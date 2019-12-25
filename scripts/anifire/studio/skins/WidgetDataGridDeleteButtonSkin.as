package anifire.studio.skins
{
	import mx.binding.BindingManager;
	import mx.core.IFlexModuleFactory;
	import mx.core.IStateClient2;
	import mx.events.PropertyChangeEvent;
	import mx.graphics.SolidColor;
	import mx.states.SetProperty;
	import mx.states.State;
	import spark.components.Group;
	import spark.components.HGroup;
	import spark.components.Label;
	import spark.primitives.BitmapImage;
	import spark.primitives.Rect;
	import spark.skins.SparkButtonSkin;
	
	public class WidgetDataGridDeleteButtonSkin extends SparkButtonSkin implements IStateClient2
	{
		
		private static const exclusions:Array = ["labelDisplay"];
		 
		
		private var _202251593_WidgetDataGridDeleteButtonSkin_BitmapImage1:BitmapImage;
		
		private var _202251592_WidgetDataGridDeleteButtonSkin_BitmapImage2:BitmapImage;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		private var cornerRadius:Number = 2;
		
		private var _embed_mxml__styles_images_widget_img_del_init_png_651304461:Class;
		
		private var _embed_mxml__styles_images_widget_img_del_hover_png_300580919:Class;
		
		public function WidgetDataGridDeleteButtonSkin()
		{
			this._embed_mxml__styles_images_widget_img_del_init_png_651304461 = WidgetDataGridDeleteButtonSkin__embed_mxml__styles_images_widget_img_del_init_png_651304461;
			this._embed_mxml__styles_images_widget_img_del_hover_png_300580919 = WidgetDataGridDeleteButtonSkin__embed_mxml__styles_images_widget_img_del_hover_png_300580919;
			super();
			mx_internal::_document = this;
			this.minWidth = 21;
			this.minHeight = 21;
			this.mxmlContent = [this._WidgetDataGridDeleteButtonSkin_Rect1_c(),this._WidgetDataGridDeleteButtonSkin_HGroup1_c()];
			this.currentState = "up";
			states = [new State({
				"name":"up",
				"overrides":[]
			}),new State({
				"name":"over",
				"overrides":[new SetProperty().initializeFromObject({
					"target":"_WidgetDataGridDeleteButtonSkin_BitmapImage1",
					"name":"visible",
					"value":false
				}),new SetProperty().initializeFromObject({
					"target":"_WidgetDataGridDeleteButtonSkin_BitmapImage2",
					"name":"visible",
					"value":true
				})]
			}),new State({
				"name":"down",
				"overrides":[]
			}),new State({
				"name":"disabled",
				"overrides":[new SetProperty().initializeFromObject({
					"name":"alpha",
					"value":0.5
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
		
		override public function get colorizeExclusions() : Array
		{
			return exclusions;
		}
		
		override protected function initializationComplete() : void
		{
			useChromeColor = true;
			super.initializationComplete();
		}
		
		override protected function updateDisplayList(param1:Number, param2:Number) : void
		{
			var _loc3_:Number = getStyle("cornerRadius");
			if(this.cornerRadius != _loc3_)
			{
				this.cornerRadius = _loc3_;
			}
			super.updateDisplayList(param1,param2);
		}
		
		private function _WidgetDataGridDeleteButtonSkin_Rect1_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.fill = this._WidgetDataGridDeleteButtonSkin_SolidColor1_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _WidgetDataGridDeleteButtonSkin_SolidColor1_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 16777215;
			return _loc1_;
		}
		
		private function _WidgetDataGridDeleteButtonSkin_HGroup1_c() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.verticalAlign = "middle";
			_loc1_.paddingLeft = 5;
			_loc1_.paddingRight = 5;
			_loc1_.paddingBottom = 5;
			_loc1_.paddingTop = 4;
			_loc1_.mxmlContent = [this._WidgetDataGridDeleteButtonSkin_Group1_c(),this._WidgetDataGridDeleteButtonSkin_Label1_i()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _WidgetDataGridDeleteButtonSkin_Group1_c() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.mxmlContent = [this._WidgetDataGridDeleteButtonSkin_BitmapImage1_i(),this._WidgetDataGridDeleteButtonSkin_BitmapImage2_i()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _WidgetDataGridDeleteButtonSkin_BitmapImage1_i() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.source = this._embed_mxml__styles_images_widget_img_del_init_png_651304461;
			_loc1_.initialized(this,"_WidgetDataGridDeleteButtonSkin_BitmapImage1");
			this._WidgetDataGridDeleteButtonSkin_BitmapImage1 = _loc1_;
			BindingManager.executeBindings(this,"_WidgetDataGridDeleteButtonSkin_BitmapImage1",this._WidgetDataGridDeleteButtonSkin_BitmapImage1);
			return _loc1_;
		}
		
		private function _WidgetDataGridDeleteButtonSkin_BitmapImage2_i() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.source = this._embed_mxml__styles_images_widget_img_del_hover_png_300580919;
			_loc1_.visible = false;
			_loc1_.initialized(this,"_WidgetDataGridDeleteButtonSkin_BitmapImage2");
			this._WidgetDataGridDeleteButtonSkin_BitmapImage2 = _loc1_;
			BindingManager.executeBindings(this,"_WidgetDataGridDeleteButtonSkin_BitmapImage2",this._WidgetDataGridDeleteButtonSkin_BitmapImage2);
			return _loc1_;
		}
		
		private function _WidgetDataGridDeleteButtonSkin_Label1_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.maxDisplayedLines = 1;
			_loc1_.setStyle("paddingTop",3);
			_loc1_.setStyle("textAlign","center");
			_loc1_.setStyle("verticalAlign","middle");
			_loc1_.setStyle("fontSize",12);
			_loc1_.setStyle("fontWeight","bold");
			_loc1_.setStyle("typographicCase","lowercaseToSmallCaps");
			_loc1_.setStyle("color",10066329);
			_loc1_.id = "labelDisplay";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			labelDisplay = _loc1_;
			BindingManager.executeBindings(this,"labelDisplay",labelDisplay);
			return _loc1_;
		}
		
		[Bindable(event="propertyChange")]
		public function get _WidgetDataGridDeleteButtonSkin_BitmapImage1() : BitmapImage
		{
			return this._202251593_WidgetDataGridDeleteButtonSkin_BitmapImage1;
		}
		
		public function set _WidgetDataGridDeleteButtonSkin_BitmapImage1(param1:BitmapImage) : void
		{
			var _loc2_:Object = this._202251593_WidgetDataGridDeleteButtonSkin_BitmapImage1;
			if(_loc2_ !== param1)
			{
				this._202251593_WidgetDataGridDeleteButtonSkin_BitmapImage1 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_WidgetDataGridDeleteButtonSkin_BitmapImage1",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _WidgetDataGridDeleteButtonSkin_BitmapImage2() : BitmapImage
		{
			return this._202251592_WidgetDataGridDeleteButtonSkin_BitmapImage2;
		}
		
		public function set _WidgetDataGridDeleteButtonSkin_BitmapImage2(param1:BitmapImage) : void
		{
			var _loc2_:Object = this._202251592_WidgetDataGridDeleteButtonSkin_BitmapImage2;
			if(_loc2_ !== param1)
			{
				this._202251592_WidgetDataGridDeleteButtonSkin_BitmapImage2 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_WidgetDataGridDeleteButtonSkin_BitmapImage2",_loc2_,param1));
				}
			}
		}
	}
}
