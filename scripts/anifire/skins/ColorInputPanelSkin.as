package anifire.skins
{
	import anifire.component.ColorInputPanel;
	import flash.utils.getDefinitionByName;
	import mx.binding.Binding;
	import mx.binding.BindingManager;
	import mx.binding.IBindingClient;
	import mx.binding.IWatcherSetupUtil2;
	import mx.core.IFlexModuleFactory;
	import mx.core.mx_internal;
	import mx.events.PropertyChangeEvent;
	import mx.graphics.SolidColor;
	import spark.components.Button;
	import spark.components.DropDownList;
	import spark.components.Group;
	import spark.components.HGroup;
	import spark.components.Image;
	import spark.components.TextInput;
	import spark.components.VGroup;
	import spark.components.VSlider;
	import spark.components.supportClasses.Skin;
	import spark.primitives.BitmapImage;
	import spark.primitives.Rect;
	import spark.primitives.RectangularDropShadow;
	
	use namespace mx_internal;
	
	public class ColorInputPanelSkin extends Skin implements IBindingClient
	{
		
		private static var _watcherSetupUtil:IWatcherSetupUtil2;
		 
		
		public var _ColorInputPanelSkin_Group3:Group;
		
		private var _1929142160blueInput:TextInput;
		
		private var _1380599289brightnessInput:TextInput;
		
		private var _2079810181colorFieldBaseColor:SolidColor;
		
		private var _1332115059colorFieldCursor:Group;
		
		private var _2084102194colorFieldCursorImage:BitmapImage;
		
		private var _1979032216colorFieldGroup:Group;
		
		private var _504070506colorSelectionGroup:HGroup;
		
		private var _2051263268colorSpaceGroup:Group;
		
		private var _2145825204colorSpaceTypeDropDownList:DropDownList;
		
		private var _1433704977eyeDropperButton:Button;
		
		private var _358645113greenInput:TextInput;
		
		private var _481456785hexInput:TextInput;
		
		private var _1039827612hexInputArea:HGroup;
		
		private var _1680642176hsbInputArea:HGroup;
		
		private var _289746354hueInput:TextInput;
		
		private var _676421625hueSlider:VSlider;
		
		private var _74026253maskGroup:Group;
		
		private var _805805639redInput:TextInput;
		
		private var _1234918102rgbInputArea:HGroup;
		
		private var _504103144saturationInput:TextInput;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		private var _embed_mxml__styles_images_colorpalette_color_input_panel_gradient_png_1040497290:Class;
		
		private var _embed_mxml__styles_images_colorpalette_slider_control_png_690206472:Class;
		
		mx_internal var _bindings:Array;
		
		mx_internal var _watchers:Array;
		
		mx_internal var _bindingsByDestination:Object;
		
		mx_internal var _bindingsBeginWithWord:Object;
		
		private var _213507019hostComponent:ColorInputPanel;
		
		public function ColorInputPanelSkin()
		{
			var target:Object = null;
			var watcherSetupUtilClass:Object = null;
			this._embed_mxml__styles_images_colorpalette_color_input_panel_gradient_png_1040497290 = ColorInputPanelSkin__embed_mxml__styles_images_colorpalette_color_input_panel_gradient_png_1040497290;
			this._embed_mxml__styles_images_colorpalette_slider_control_png_690206472 = ColorInputPanelSkin__embed_mxml__styles_images_colorpalette_slider_control_png_690206472;
			this._bindings = [];
			this._watchers = [];
			this._bindingsByDestination = {};
			this._bindingsBeginWithWord = {};
			super();
			mx_internal::_document = this;
			var bindings:Array = this._ColorInputPanelSkin_bindingsSetup();
			var watchers:Array = [];
			target = this;
			if(_watcherSetupUtil == null)
			{
				watcherSetupUtilClass = getDefinitionByName("_anifire_skins_ColorInputPanelSkinWatcherSetupUtil");
				watcherSetupUtilClass["init"](null);
			}
			_watcherSetupUtil.setup(this,function(param1:String):*
			{
				return target[param1];
			},function(param1:String):*
			{
				return ColorInputPanelSkin[param1];
			},bindings,watchers);
			mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
			mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
			this.mxmlContent = [this._ColorInputPanelSkin_Group1_c()];
			var i:uint = 0;
			while(i < bindings.length)
			{
				Binding(bindings[i]).execute();
				i++;
			}
		}
		
		public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
		{
			ColorInputPanelSkin._watcherSetupUtil = param1;
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
		
		private function _ColorInputPanelSkin_Group1_c() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.mxmlContent = [this._ColorInputPanelSkin_RectangularDropShadow1_c(),this._ColorInputPanelSkin_Rect1_c(),this._ColorInputPanelSkin_VGroup1_c()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _ColorInputPanelSkin_RectangularDropShadow1_c() : RectangularDropShadow
		{
			var _loc1_:RectangularDropShadow = new RectangularDropShadow();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.mouseEnabled = false;
			_loc1_.mouseChildren = false;
			_loc1_.angle = 90;
			_loc1_.distance = 0;
			_loc1_.color = 6710886;
			_loc1_.tlRadius = 10;
			_loc1_.trRadius = 10;
			_loc1_.blRadius = 10;
			_loc1_.brRadius = 10;
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _ColorInputPanelSkin_Rect1_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.radiusX = 5;
			_loc1_.radiusY = 5;
			_loc1_.fill = this._ColorInputPanelSkin_SolidColor1_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _ColorInputPanelSkin_SolidColor1_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 16777215;
			_loc1_.alpha = 0.8;
			return _loc1_;
		}
		
		private function _ColorInputPanelSkin_VGroup1_c() : VGroup
		{
			var _loc1_:VGroup = new VGroup();
			_loc1_.paddingTop = 4;
			_loc1_.paddingBottom = 8;
			_loc1_.paddingLeft = 8;
			_loc1_.paddingRight = 4;
			_loc1_.gap = 4;
			_loc1_.mxmlContent = [this._ColorInputPanelSkin_HGroup1_i(),this._ColorInputPanelSkin_Group6_i()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _ColorInputPanelSkin_HGroup1_i() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.height = 208;
			_loc1_.verticalAlign = "middle";
			_loc1_.gap = 3;
			_loc1_.mxmlContent = [this._ColorInputPanelSkin_Group2_i(),this._ColorInputPanelSkin_VSlider1_i()];
			_loc1_.id = "colorSelectionGroup";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.colorSelectionGroup = _loc1_;
			BindingManager.executeBindings(this,"colorSelectionGroup",this.colorSelectionGroup);
			return _loc1_;
		}
		
		private function _ColorInputPanelSkin_Group2_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.width = 200;
			_loc1_.height = 200;
			_loc1_.mxmlContent = [this._ColorInputPanelSkin_Rect2_c(),this._ColorInputPanelSkin_Group3_i(),this._ColorInputPanelSkin_Group4_i(),this._ColorInputPanelSkin_Group5_i()];
			_loc1_.id = "colorFieldGroup";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.colorFieldGroup = _loc1_;
			BindingManager.executeBindings(this,"colorFieldGroup",this.colorFieldGroup);
			return _loc1_;
		}
		
		private function _ColorInputPanelSkin_Rect2_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.radiusX = 7;
			_loc1_.radiusY = 7;
			_loc1_.fill = this._ColorInputPanelSkin_SolidColor2_i();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _ColorInputPanelSkin_SolidColor2_i() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			this.colorFieldBaseColor = _loc1_;
			BindingManager.executeBindings(this,"colorFieldBaseColor",this.colorFieldBaseColor);
			return _loc1_;
		}
		
		private function _ColorInputPanelSkin_Group3_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.mxmlContent = [this._ColorInputPanelSkin_Image1_c()];
			_loc1_.id = "_ColorInputPanelSkin_Group3";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._ColorInputPanelSkin_Group3 = _loc1_;
			BindingManager.executeBindings(this,"_ColorInputPanelSkin_Group3",this._ColorInputPanelSkin_Group3);
			return _loc1_;
		}
		
		private function _ColorInputPanelSkin_Image1_c() : Image
		{
			var _loc1_:Image = new Image();
			_loc1_.source = this._embed_mxml__styles_images_colorpalette_color_input_panel_gradient_png_1040497290;
			_loc1_.fillMode = "scale";
			_loc1_.scaleMode = "stretch";
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _ColorInputPanelSkin_Group4_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.mxmlContent = [this._ColorInputPanelSkin_Rect3_c()];
			_loc1_.id = "maskGroup";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.maskGroup = _loc1_;
			BindingManager.executeBindings(this,"maskGroup",this.maskGroup);
			return _loc1_;
		}
		
		private function _ColorInputPanelSkin_Rect3_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.radiusX = 7;
			_loc1_.radiusY = 7;
			_loc1_.fill = this._ColorInputPanelSkin_SolidColor3_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _ColorInputPanelSkin_SolidColor3_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			return _loc1_;
		}
		
		private function _ColorInputPanelSkin_Group5_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.width = 0;
			_loc1_.height = 0;
			_loc1_.mxmlContent = [this._ColorInputPanelSkin_BitmapImage1_i()];
			_loc1_.id = "colorFieldCursor";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.colorFieldCursor = _loc1_;
			BindingManager.executeBindings(this,"colorFieldCursor",this.colorFieldCursor);
			return _loc1_;
		}
		
		private function _ColorInputPanelSkin_BitmapImage1_i() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.source = this._embed_mxml__styles_images_colorpalette_slider_control_png_690206472;
			_loc1_.verticalCenter = -2;
			_loc1_.horizontalCenter = 0;
			_loc1_.initialized(this,"colorFieldCursorImage");
			this.colorFieldCursorImage = _loc1_;
			BindingManager.executeBindings(this,"colorFieldCursorImage",this.colorFieldCursorImage);
			return _loc1_;
		}
		
		private function _ColorInputPanelSkin_VSlider1_i() : VSlider
		{
			var _loc1_:VSlider = new VSlider();
			_loc1_.percentHeight = 100;
			_loc1_.minimum = 0;
			_loc1_.maximum = 359;
			_loc1_.stepSize = 1;
			_loc1_.setStyle("liveDragging",true);
			_loc1_.setStyle("slideDuration",0);
			_loc1_.setStyle("skinClass",ColorInputPanelHueSliderSkin);
			_loc1_.id = "hueSlider";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.hueSlider = _loc1_;
			BindingManager.executeBindings(this,"hueSlider",this.hueSlider);
			return _loc1_;
		}
		
		private function _ColorInputPanelSkin_Group6_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.percentWidth = 100;
			_loc1_.mxmlContent = [this._ColorInputPanelSkin_HGroup2_c(),this._ColorInputPanelSkin_Button1_i()];
			_loc1_.id = "colorSpaceGroup";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.colorSpaceGroup = _loc1_;
			BindingManager.executeBindings(this,"colorSpaceGroup",this.colorSpaceGroup);
			return _loc1_;
		}
		
		private function _ColorInputPanelSkin_HGroup2_c() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.width = 200;
			_loc1_.gap = 4;
			_loc1_.mxmlContent = [this._ColorInputPanelSkin_DropDownList1_i(),this._ColorInputPanelSkin_HGroup3_i(),this._ColorInputPanelSkin_HGroup4_i(),this._ColorInputPanelSkin_HGroup5_i()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _ColorInputPanelSkin_DropDownList1_i() : DropDownList
		{
			var _loc1_:DropDownList = new DropDownList();
			_loc1_.width = 65;
			_loc1_.id = "colorSpaceTypeDropDownList";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.colorSpaceTypeDropDownList = _loc1_;
			BindingManager.executeBindings(this,"colorSpaceTypeDropDownList",this.colorSpaceTypeDropDownList);
			return _loc1_;
		}
		
		private function _ColorInputPanelSkin_HGroup3_i() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.percentWidth = 100;
			_loc1_.mxmlContent = [this._ColorInputPanelSkin_TextInput1_i()];
			_loc1_.id = "hexInputArea";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.hexInputArea = _loc1_;
			BindingManager.executeBindings(this,"hexInputArea",this.hexInputArea);
			return _loc1_;
		}
		
		private function _ColorInputPanelSkin_TextInput1_i() : TextInput
		{
			var _loc1_:TextInput = new TextInput();
			_loc1_.percentWidth = 100;
			_loc1_.maxChars = 6;
			_loc1_.restrict = "A-F a-f 0-9";
			_loc1_.id = "hexInput";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.hexInput = _loc1_;
			BindingManager.executeBindings(this,"hexInput",this.hexInput);
			return _loc1_;
		}
		
		private function _ColorInputPanelSkin_HGroup4_i() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.percentWidth = 100;
			_loc1_.visible = false;
			_loc1_.includeInLayout = false;
			_loc1_.mxmlContent = [this._ColorInputPanelSkin_TextInput2_i(),this._ColorInputPanelSkin_TextInput3_i(),this._ColorInputPanelSkin_TextInput4_i()];
			_loc1_.id = "rgbInputArea";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.rgbInputArea = _loc1_;
			BindingManager.executeBindings(this,"rgbInputArea",this.rgbInputArea);
			return _loc1_;
		}
		
		private function _ColorInputPanelSkin_TextInput2_i() : TextInput
		{
			var _loc1_:TextInput = new TextInput();
			_loc1_.percentWidth = 100;
			_loc1_.restrict = "0-9";
			_loc1_.text = "0";
			_loc1_.id = "redInput";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.redInput = _loc1_;
			BindingManager.executeBindings(this,"redInput",this.redInput);
			return _loc1_;
		}
		
		private function _ColorInputPanelSkin_TextInput3_i() : TextInput
		{
			var _loc1_:TextInput = new TextInput();
			_loc1_.percentWidth = 100;
			_loc1_.restrict = "0-9";
			_loc1_.text = "0";
			_loc1_.id = "greenInput";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.greenInput = _loc1_;
			BindingManager.executeBindings(this,"greenInput",this.greenInput);
			return _loc1_;
		}
		
		private function _ColorInputPanelSkin_TextInput4_i() : TextInput
		{
			var _loc1_:TextInput = new TextInput();
			_loc1_.percentWidth = 100;
			_loc1_.restrict = "0-9";
			_loc1_.text = "0";
			_loc1_.id = "blueInput";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.blueInput = _loc1_;
			BindingManager.executeBindings(this,"blueInput",this.blueInput);
			return _loc1_;
		}
		
		private function _ColorInputPanelSkin_HGroup5_i() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.percentWidth = 100;
			_loc1_.visible = false;
			_loc1_.includeInLayout = false;
			_loc1_.mxmlContent = [this._ColorInputPanelSkin_TextInput5_i(),this._ColorInputPanelSkin_TextInput6_i(),this._ColorInputPanelSkin_TextInput7_i()];
			_loc1_.id = "hsbInputArea";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.hsbInputArea = _loc1_;
			BindingManager.executeBindings(this,"hsbInputArea",this.hsbInputArea);
			return _loc1_;
		}
		
		private function _ColorInputPanelSkin_TextInput5_i() : TextInput
		{
			var _loc1_:TextInput = new TextInput();
			_loc1_.percentWidth = 100;
			_loc1_.restrict = "0-9";
			_loc1_.text = "0";
			_loc1_.id = "hueInput";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.hueInput = _loc1_;
			BindingManager.executeBindings(this,"hueInput",this.hueInput);
			return _loc1_;
		}
		
		private function _ColorInputPanelSkin_TextInput6_i() : TextInput
		{
			var _loc1_:TextInput = new TextInput();
			_loc1_.percentWidth = 100;
			_loc1_.restrict = "0-9";
			_loc1_.text = "0";
			_loc1_.id = "saturationInput";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.saturationInput = _loc1_;
			BindingManager.executeBindings(this,"saturationInput",this.saturationInput);
			return _loc1_;
		}
		
		private function _ColorInputPanelSkin_TextInput7_i() : TextInput
		{
			var _loc1_:TextInput = new TextInput();
			_loc1_.percentWidth = 100;
			_loc1_.restrict = "0-9";
			_loc1_.text = "0";
			_loc1_.id = "brightnessInput";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.brightnessInput = _loc1_;
			BindingManager.executeBindings(this,"brightnessInput",this.brightnessInput);
			return _loc1_;
		}
		
		private function _ColorInputPanelSkin_Button1_i() : Button
		{
			var _loc1_:Button = new Button();
			_loc1_.right = 4;
			_loc1_.width = 21;
			_loc1_.percentHeight = 100;
			_loc1_.buttonMode = true;
			_loc1_.setStyle("skinClass",EyeDropperButtonSkin);
			_loc1_.id = "eyeDropperButton";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.eyeDropperButton = _loc1_;
			BindingManager.executeBindings(this,"eyeDropperButton",this.eyeDropperButton);
			return _loc1_;
		}
		
		private function _ColorInputPanelSkin_bindingsSetup() : Array
		{
			var _loc1_:Array = [];
			_loc1_[0] = new Binding(this,null,null,"_ColorInputPanelSkin_Group3.mask","maskGroup");
			return _loc1_;
		}
		
		[Bindable(event="propertyChange")]
		public function get blueInput() : TextInput
		{
			return this._1929142160blueInput;
		}
		
		public function set blueInput(param1:TextInput) : void
		{
			var _loc2_:Object = this._1929142160blueInput;
			if(_loc2_ !== param1)
			{
				this._1929142160blueInput = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"blueInput",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get brightnessInput() : TextInput
		{
			return this._1380599289brightnessInput;
		}
		
		public function set brightnessInput(param1:TextInput) : void
		{
			var _loc2_:Object = this._1380599289brightnessInput;
			if(_loc2_ !== param1)
			{
				this._1380599289brightnessInput = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"brightnessInput",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get colorFieldBaseColor() : SolidColor
		{
			return this._2079810181colorFieldBaseColor;
		}
		
		public function set colorFieldBaseColor(param1:SolidColor) : void
		{
			var _loc2_:Object = this._2079810181colorFieldBaseColor;
			if(_loc2_ !== param1)
			{
				this._2079810181colorFieldBaseColor = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"colorFieldBaseColor",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get colorFieldCursor() : Group
		{
			return this._1332115059colorFieldCursor;
		}
		
		public function set colorFieldCursor(param1:Group) : void
		{
			var _loc2_:Object = this._1332115059colorFieldCursor;
			if(_loc2_ !== param1)
			{
				this._1332115059colorFieldCursor = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"colorFieldCursor",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get colorFieldCursorImage() : BitmapImage
		{
			return this._2084102194colorFieldCursorImage;
		}
		
		public function set colorFieldCursorImage(param1:BitmapImage) : void
		{
			var _loc2_:Object = this._2084102194colorFieldCursorImage;
			if(_loc2_ !== param1)
			{
				this._2084102194colorFieldCursorImage = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"colorFieldCursorImage",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get colorFieldGroup() : Group
		{
			return this._1979032216colorFieldGroup;
		}
		
		public function set colorFieldGroup(param1:Group) : void
		{
			var _loc2_:Object = this._1979032216colorFieldGroup;
			if(_loc2_ !== param1)
			{
				this._1979032216colorFieldGroup = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"colorFieldGroup",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get colorSelectionGroup() : HGroup
		{
			return this._504070506colorSelectionGroup;
		}
		
		public function set colorSelectionGroup(param1:HGroup) : void
		{
			var _loc2_:Object = this._504070506colorSelectionGroup;
			if(_loc2_ !== param1)
			{
				this._504070506colorSelectionGroup = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"colorSelectionGroup",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get colorSpaceGroup() : Group
		{
			return this._2051263268colorSpaceGroup;
		}
		
		public function set colorSpaceGroup(param1:Group) : void
		{
			var _loc2_:Object = this._2051263268colorSpaceGroup;
			if(_loc2_ !== param1)
			{
				this._2051263268colorSpaceGroup = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"colorSpaceGroup",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get colorSpaceTypeDropDownList() : DropDownList
		{
			return this._2145825204colorSpaceTypeDropDownList;
		}
		
		public function set colorSpaceTypeDropDownList(param1:DropDownList) : void
		{
			var _loc2_:Object = this._2145825204colorSpaceTypeDropDownList;
			if(_loc2_ !== param1)
			{
				this._2145825204colorSpaceTypeDropDownList = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"colorSpaceTypeDropDownList",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get eyeDropperButton() : Button
		{
			return this._1433704977eyeDropperButton;
		}
		
		public function set eyeDropperButton(param1:Button) : void
		{
			var _loc2_:Object = this._1433704977eyeDropperButton;
			if(_loc2_ !== param1)
			{
				this._1433704977eyeDropperButton = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"eyeDropperButton",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get greenInput() : TextInput
		{
			return this._358645113greenInput;
		}
		
		public function set greenInput(param1:TextInput) : void
		{
			var _loc2_:Object = this._358645113greenInput;
			if(_loc2_ !== param1)
			{
				this._358645113greenInput = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"greenInput",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get hexInput() : TextInput
		{
			return this._481456785hexInput;
		}
		
		public function set hexInput(param1:TextInput) : void
		{
			var _loc2_:Object = this._481456785hexInput;
			if(_loc2_ !== param1)
			{
				this._481456785hexInput = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hexInput",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get hexInputArea() : HGroup
		{
			return this._1039827612hexInputArea;
		}
		
		public function set hexInputArea(param1:HGroup) : void
		{
			var _loc2_:Object = this._1039827612hexInputArea;
			if(_loc2_ !== param1)
			{
				this._1039827612hexInputArea = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hexInputArea",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get hsbInputArea() : HGroup
		{
			return this._1680642176hsbInputArea;
		}
		
		public function set hsbInputArea(param1:HGroup) : void
		{
			var _loc2_:Object = this._1680642176hsbInputArea;
			if(_loc2_ !== param1)
			{
				this._1680642176hsbInputArea = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hsbInputArea",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get hueInput() : TextInput
		{
			return this._289746354hueInput;
		}
		
		public function set hueInput(param1:TextInput) : void
		{
			var _loc2_:Object = this._289746354hueInput;
			if(_loc2_ !== param1)
			{
				this._289746354hueInput = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hueInput",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get hueSlider() : VSlider
		{
			return this._676421625hueSlider;
		}
		
		public function set hueSlider(param1:VSlider) : void
		{
			var _loc2_:Object = this._676421625hueSlider;
			if(_loc2_ !== param1)
			{
				this._676421625hueSlider = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hueSlider",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get maskGroup() : Group
		{
			return this._74026253maskGroup;
		}
		
		public function set maskGroup(param1:Group) : void
		{
			var _loc2_:Object = this._74026253maskGroup;
			if(_loc2_ !== param1)
			{
				this._74026253maskGroup = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"maskGroup",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get redInput() : TextInput
		{
			return this._805805639redInput;
		}
		
		public function set redInput(param1:TextInput) : void
		{
			var _loc2_:Object = this._805805639redInput;
			if(_loc2_ !== param1)
			{
				this._805805639redInput = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"redInput",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get rgbInputArea() : HGroup
		{
			return this._1234918102rgbInputArea;
		}
		
		public function set rgbInputArea(param1:HGroup) : void
		{
			var _loc2_:Object = this._1234918102rgbInputArea;
			if(_loc2_ !== param1)
			{
				this._1234918102rgbInputArea = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rgbInputArea",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get saturationInput() : TextInput
		{
			return this._504103144saturationInput;
		}
		
		public function set saturationInput(param1:TextInput) : void
		{
			var _loc2_:Object = this._504103144saturationInput;
			if(_loc2_ !== param1)
			{
				this._504103144saturationInput = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"saturationInput",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get hostComponent() : ColorInputPanel
		{
			return this._213507019hostComponent;
		}
		
		public function set hostComponent(param1:ColorInputPanel) : void
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
