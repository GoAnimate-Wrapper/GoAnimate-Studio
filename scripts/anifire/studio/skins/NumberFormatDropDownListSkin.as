package anifire.studio.skins
{
	import anifire.studio.components.IconButton;
	import anifire.studio.components.NumberFormatRenderer;
	import anifire.studio.components.PopUpAnchor;
	import mx.binding.BindingManager;
	import mx.core.ClassFactory;
	import mx.core.DeferredInstanceFromFunction;
	import mx.core.IFlexModuleFactory;
	import mx.core.IStateClient2;
	import mx.events.PropertyChangeEvent;
	import mx.graphics.SolidColor;
	import mx.graphics.SolidColorStroke;
	import mx.states.AddItems;
	import mx.states.SetProperty;
	import mx.states.State;
	import spark.components.DataGroup;
	import spark.components.DropDownList;
	import spark.components.Group;
	import spark.components.Label;
	import spark.components.Scroller;
	import spark.layouts.VerticalLayout;
	import spark.primitives.Rect;
	import spark.primitives.RectangularDropShadow;
	import spark.skins.SparkSkin;
	
	public class NumberFormatDropDownListSkin extends SparkSkin implements IStateClient2
	{
		 
		
		private var _1391998104bgFill:SolidColor;
		
		private var _1383304148border:Rect;
		
		private var _1395787140borderStroke:SolidColorStroke;
		
		private var _385593099dataGroup:DataGroup;
		
		private var _433014735dropDown:Group;
		
		private var _906978543dropShadow:RectangularDropShadow;
		
		private var _1184053038labelDisplay:Label;
		
		private var _137111012openButton:IconButton;
		
		private var _106851532popUp:PopUpAnchor;
		
		private var _402164678scroller:Scroller;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		private var _embed_mxml__styles_images_panel_img_format_init_png_1458588393:Class;
		
		private var _embed_mxml__styles_images_panel_img_format_hover_png_1028358827:Class;
		
		private var _213507019hostComponent:DropDownList;
		
		public function NumberFormatDropDownListSkin()
		{
			this._embed_mxml__styles_images_panel_img_format_init_png_1458588393 = NumberFormatDropDownListSkin__embed_mxml__styles_images_panel_img_format_init_png_1458588393;
			this._embed_mxml__styles_images_panel_img_format_hover_png_1028358827 = NumberFormatDropDownListSkin__embed_mxml__styles_images_panel_img_format_hover_png_1028358827;
			super();
			mx_internal::_document = this;
			this.width = 20;
			this.height = 20;
			this.minWidth = 20;
			this.minHeight = 20;
			this.mxmlContent = [this._NumberFormatDropDownListSkin_IconButton1_i(),this._NumberFormatDropDownListSkin_Label1_i()];
			this.currentState = "normal";
			var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._NumberFormatDropDownListSkin_PopUpAnchor1_i,this._NumberFormatDropDownListSkin_PopUpAnchor1_r);
			states = [new State({
				"name":"normal",
				"overrides":[new SetProperty().initializeFromObject({
					"target":"popUp",
					"name":"displayPopUp",
					"value":false
				})]
			}),new State({
				"name":"open",
				"overrides":[new AddItems().initializeFromObject({
					"destructionPolicy":"auto",
					"itemsFactory":_loc1_,
					"destination":null,
					"propertyName":"mxmlContent",
					"position":"first"
				}),new SetProperty().initializeFromObject({
					"target":"popUp",
					"name":"displayPopUp",
					"value":true
				})]
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
		
		private function _NumberFormatDropDownListSkin_PopUpAnchor1_i() : PopUpAnchor
		{
			var _loc1_:PopUpAnchor = new PopUpAnchor();
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.autoClose = false;
			_loc1_.popUpPosition = "belowRight";
			_loc1_.popUpWidthMatchesAnchorWidth = false;
			_loc1_.popUp = this._NumberFormatDropDownListSkin_Group1_i();
			_loc1_.id = "popUp";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.popUp = _loc1_;
			BindingManager.executeBindings(this,"popUp",this.popUp);
			return _loc1_;
		}
		
		private function _NumberFormatDropDownListSkin_PopUpAnchor1_r() : void
		{
		}
		
		private function _NumberFormatDropDownListSkin_Group1_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.right = 0;
			_loc1_.mxmlContent = [this._NumberFormatDropDownListSkin_RectangularDropShadow1_i(),this._NumberFormatDropDownListSkin_Rect1_i(),this._NumberFormatDropDownListSkin_Scroller1_i()];
			_loc1_.id = "dropDown";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.dropDown = _loc1_;
			BindingManager.executeBindings(this,"dropDown",this.dropDown);
			return _loc1_;
		}
		
		private function _NumberFormatDropDownListSkin_RectangularDropShadow1_i() : RectangularDropShadow
		{
			var _loc1_:RectangularDropShadow = new RectangularDropShadow();
			_loc1_.blurX = 20;
			_loc1_.blurY = 20;
			_loc1_.alpha = 0.45;
			_loc1_.distance = 7;
			_loc1_.blRadius = 3;
			_loc1_.brRadius = 3;
			_loc1_.tlRadius = 3;
			_loc1_.trRadius = 3;
			_loc1_.angle = 90;
			_loc1_.color = 0;
			_loc1_.left = 0;
			_loc1_.top = 0;
			_loc1_.right = 0;
			_loc1_.bottom = 0;
			_loc1_.id = "dropShadow";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.dropShadow = _loc1_;
			BindingManager.executeBindings(this,"dropShadow",this.dropShadow);
			return _loc1_;
		}
		
		private function _NumberFormatDropDownListSkin_Rect1_i() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.radiusX = 3;
			_loc1_.stroke = this._NumberFormatDropDownListSkin_SolidColorStroke1_i();
			_loc1_.fill = this._NumberFormatDropDownListSkin_SolidColor1_i();
			_loc1_.initialized(this,"border");
			this.border = _loc1_;
			BindingManager.executeBindings(this,"border",this.border);
			return _loc1_;
		}
		
		private function _NumberFormatDropDownListSkin_SolidColorStroke1_i() : SolidColorStroke
		{
			var _loc1_:SolidColorStroke = new SolidColorStroke();
			_loc1_.weight = 1;
			_loc1_.color = 10526623;
			this.borderStroke = _loc1_;
			BindingManager.executeBindings(this,"borderStroke",this.borderStroke);
			return _loc1_;
		}
		
		private function _NumberFormatDropDownListSkin_SolidColor1_i() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 16777215;
			this.bgFill = _loc1_;
			BindingManager.executeBindings(this,"bgFill",this.bgFill);
			return _loc1_;
		}
		
		private function _NumberFormatDropDownListSkin_Scroller1_i() : Scroller
		{
			var _loc1_:Scroller = new Scroller();
			_loc1_.left = 0;
			_loc1_.top = 3;
			_loc1_.right = 0;
			_loc1_.bottom = 3;
			_loc1_.hasFocusableChildren = false;
			_loc1_.minViewportInset = 1;
			_loc1_.viewport = this._NumberFormatDropDownListSkin_DataGroup1_i();
			_loc1_.setStyle("horizontalScrollPolicy","off");
			_loc1_.id = "scroller";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.scroller = _loc1_;
			BindingManager.executeBindings(this,"scroller",this.scroller);
			return _loc1_;
		}
		
		private function _NumberFormatDropDownListSkin_DataGroup1_i() : DataGroup
		{
			var _loc1_:DataGroup = new DataGroup();
			_loc1_.itemRenderer = this._NumberFormatDropDownListSkin_ClassFactory1_c();
			_loc1_.layout = this._NumberFormatDropDownListSkin_VerticalLayout1_c();
			_loc1_.id = "dataGroup";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.dataGroup = _loc1_;
			BindingManager.executeBindings(this,"dataGroup",this.dataGroup);
			return _loc1_;
		}
		
		private function _NumberFormatDropDownListSkin_ClassFactory1_c() : ClassFactory
		{
			var _loc1_:ClassFactory = new ClassFactory();
			_loc1_.generator = NumberFormatRenderer;
			return _loc1_;
		}
		
		private function _NumberFormatDropDownListSkin_VerticalLayout1_c() : VerticalLayout
		{
			var _loc1_:VerticalLayout = new VerticalLayout();
			_loc1_.gap = 0;
			_loc1_.horizontalAlign = "contentJustify";
			_loc1_.useVirtualLayout = false;
			_loc1_.variableRowHeight = true;
			_loc1_.requestedMinRowCount = 1;
			_loc1_.requestedMaxRowCount = 10;
			return _loc1_;
		}
		
		private function _NumberFormatDropDownListSkin_IconButton1_i() : IconButton
		{
			var _loc1_:IconButton = new IconButton();
			_loc1_.width = 20;
			_loc1_.height = 20;
			_loc1_.buttonMode = true;
			_loc1_.focusEnabled = false;
			_loc1_.tabEnabled = false;
			_loc1_.setStyle("icon",this._embed_mxml__styles_images_panel_img_format_init_png_1458588393);
			_loc1_.setStyle("iconOver",this._embed_mxml__styles_images_panel_img_format_hover_png_1028358827);
			_loc1_.id = "openButton";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.openButton = _loc1_;
			BindingManager.executeBindings(this,"openButton",this.openButton);
			return _loc1_;
		}
		
		private function _NumberFormatDropDownListSkin_Label1_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.width = 0;
			_loc1_.maxDisplayedLines = 1;
			_loc1_.verticalCenter = 0;
			_loc1_.id = "labelDisplay";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.labelDisplay = _loc1_;
			BindingManager.executeBindings(this,"labelDisplay",this.labelDisplay);
			return _loc1_;
		}
		
		[Bindable(event="propertyChange")]
		public function get bgFill() : SolidColor
		{
			return this._1391998104bgFill;
		}
		
		public function set bgFill(param1:SolidColor) : void
		{
			var _loc2_:Object = this._1391998104bgFill;
			if(_loc2_ !== param1)
			{
				this._1391998104bgFill = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bgFill",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get border() : Rect
		{
			return this._1383304148border;
		}
		
		public function set border(param1:Rect) : void
		{
			var _loc2_:Object = this._1383304148border;
			if(_loc2_ !== param1)
			{
				this._1383304148border = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"border",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get borderStroke() : SolidColorStroke
		{
			return this._1395787140borderStroke;
		}
		
		public function set borderStroke(param1:SolidColorStroke) : void
		{
			var _loc2_:Object = this._1395787140borderStroke;
			if(_loc2_ !== param1)
			{
				this._1395787140borderStroke = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"borderStroke",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get dataGroup() : DataGroup
		{
			return this._385593099dataGroup;
		}
		
		public function set dataGroup(param1:DataGroup) : void
		{
			var _loc2_:Object = this._385593099dataGroup;
			if(_loc2_ !== param1)
			{
				this._385593099dataGroup = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dataGroup",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get dropDown() : Group
		{
			return this._433014735dropDown;
		}
		
		public function set dropDown(param1:Group) : void
		{
			var _loc2_:Object = this._433014735dropDown;
			if(_loc2_ !== param1)
			{
				this._433014735dropDown = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dropDown",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get dropShadow() : RectangularDropShadow
		{
			return this._906978543dropShadow;
		}
		
		public function set dropShadow(param1:RectangularDropShadow) : void
		{
			var _loc2_:Object = this._906978543dropShadow;
			if(_loc2_ !== param1)
			{
				this._906978543dropShadow = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dropShadow",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get labelDisplay() : Label
		{
			return this._1184053038labelDisplay;
		}
		
		public function set labelDisplay(param1:Label) : void
		{
			var _loc2_:Object = this._1184053038labelDisplay;
			if(_loc2_ !== param1)
			{
				this._1184053038labelDisplay = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"labelDisplay",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get openButton() : IconButton
		{
			return this._137111012openButton;
		}
		
		public function set openButton(param1:IconButton) : void
		{
			var _loc2_:Object = this._137111012openButton;
			if(_loc2_ !== param1)
			{
				this._137111012openButton = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"openButton",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get popUp() : PopUpAnchor
		{
			return this._106851532popUp;
		}
		
		public function set popUp(param1:PopUpAnchor) : void
		{
			var _loc2_:Object = this._106851532popUp;
			if(_loc2_ !== param1)
			{
				this._106851532popUp = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"popUp",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get scroller() : Scroller
		{
			return this._402164678scroller;
		}
		
		public function set scroller(param1:Scroller) : void
		{
			var _loc2_:Object = this._402164678scroller;
			if(_loc2_ !== param1)
			{
				this._402164678scroller = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scroller",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get hostComponent() : DropDownList
		{
			return this._213507019hostComponent;
		}
		
		public function set hostComponent(param1:DropDownList) : void
		{
			var _loc2_:Object = this._213507019hostComponent;
			if(_loc2_ !== param1)
			{
				this._213507019hostComponent = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hostComponent",_loc2_,param1));
				}
			}
		}
	}
}
