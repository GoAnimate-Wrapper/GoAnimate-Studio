package anifire.studio.skins
{
	import anifire.studio.components.PopUpAnchor;
	import mx.binding.BindingManager;
	import mx.core.IFlexModuleFactory;
	import mx.core.IStateClient2;
	import mx.events.PropertyChangeEvent;
	import mx.graphics.SolidColor;
	import mx.states.SetProperty;
	import mx.states.State;
	import spark.components.Button;
	import spark.components.Group;
	import spark.components.Label;
	import spark.primitives.BitmapImage;
	import spark.primitives.Path;
	import spark.primitives.Rect;
	import spark.skins.SparkSkin;
	
	public class SkipTutorialButtonSkin extends SparkSkin implements IStateClient2
	{
		 
		
		private var _1344706396_SkipTutorialButtonSkin_PopUpAnchor1:PopUpAnchor;
		
		private var _1184053038labelDisplay:Label;
		
		private var _268453613popUpGroup:Group;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		private var _embed_mxml__styles_images_tutorial_stop_btn_png_675474687:Class;
		
		private var _213507019hostComponent:Button;
		
		public function SkipTutorialButtonSkin()
		{
			this._embed_mxml__styles_images_tutorial_stop_btn_png_675474687 = SkipTutorialButtonSkin__embed_mxml__styles_images_tutorial_stop_btn_png_675474687;
			super();
			mx_internal::_document = this;
			this.mxmlContent = [this._SkipTutorialButtonSkin_Rect1_c(),this._SkipTutorialButtonSkin_BitmapImage1_c(),this._SkipTutorialButtonSkin_PopUpAnchor1_i()];
			this.currentState = "up";
			states = [new State({
				"name":"up",
				"overrides":[]
			}),new State({
				"name":"over",
				"overrides":[new SetProperty().initializeFromObject({
					"target":"_SkipTutorialButtonSkin_PopUpAnchor1",
					"name":"displayPopUp",
					"value":true
				})]
			}),new State({
				"name":"down",
				"overrides":[new SetProperty().initializeFromObject({
					"target":"_SkipTutorialButtonSkin_PopUpAnchor1",
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
		
		private function _SkipTutorialButtonSkin_Rect1_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.fill = this._SkipTutorialButtonSkin_SolidColor1_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _SkipTutorialButtonSkin_SolidColor1_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.alpha = 0;
			return _loc1_;
		}
		
		private function _SkipTutorialButtonSkin_BitmapImage1_c() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.source = this._embed_mxml__styles_images_tutorial_stop_btn_png_675474687;
			_loc1_.smooth = true;
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _SkipTutorialButtonSkin_PopUpAnchor1_i() : PopUpAnchor
		{
			var _loc1_:PopUpAnchor = new PopUpAnchor();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.bottom = 0;
			_loc1_.autoClose = false;
			_loc1_.displayPopUp = false;
			_loc1_.popUpPosition = "aboveCenter";
			_loc1_.popUp = this._SkipTutorialButtonSkin_Group1_i();
			_loc1_.id = "_SkipTutorialButtonSkin_PopUpAnchor1";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._SkipTutorialButtonSkin_PopUpAnchor1 = _loc1_;
			BindingManager.executeBindings(this,"_SkipTutorialButtonSkin_PopUpAnchor1",this._SkipTutorialButtonSkin_PopUpAnchor1);
			return _loc1_;
		}
		
		private function _SkipTutorialButtonSkin_Group1_i() : Group
		{
			var _loc1_:Group = null;
			_loc1_ = new Group();
			_loc1_.mouseEnabled = false;
			_loc1_.mouseChildren = false;
			_loc1_.blendMode = "layer";
			_loc1_.alpha = 0.9;
			_loc1_.mxmlContent = [this._SkipTutorialButtonSkin_Group2_c(),this._SkipTutorialButtonSkin_Path1_c()];
			_loc1_.id = "popUpGroup";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.popUpGroup = _loc1_;
			BindingManager.executeBindings(this,"popUpGroup",this.popUpGroup);
			return _loc1_;
		}
		
		private function _SkipTutorialButtonSkin_Group2_c() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.minWidth = 10;
			_loc1_.bottom = 25;
			_loc1_.mxmlContent = [this._SkipTutorialButtonSkin_Rect2_c(),this._SkipTutorialButtonSkin_Label1_i()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _SkipTutorialButtonSkin_Rect2_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.fill = this._SkipTutorialButtonSkin_SolidColor2_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _SkipTutorialButtonSkin_SolidColor2_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 16777215;
			return _loc1_;
		}
		
		private function _SkipTutorialButtonSkin_Label1_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.setStyle("color",0);
			_loc1_.setStyle("textAlign","center");
			_loc1_.setStyle("paddingLeft",7);
			_loc1_.setStyle("paddingRight",7);
			_loc1_.setStyle("paddingTop",5);
			_loc1_.setStyle("paddingBottom",5);
			_loc1_.id = "labelDisplay";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.labelDisplay = _loc1_;
			BindingManager.executeBindings(this,"labelDisplay",this.labelDisplay);
			return _loc1_;
		}
		
		private function _SkipTutorialButtonSkin_Path1_c() : Path
		{
			var _loc1_:Path = new Path();
			_loc1_.horizontalCenter = 0;
			_loc1_.bottom = 15;
			_loc1_.data = "M 5 0 L 0 10 L -5 0 Z";
			_loc1_.fill = this._SkipTutorialButtonSkin_SolidColor3_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _SkipTutorialButtonSkin_SolidColor3_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 2829099;
			return _loc1_;
		}
		
		[Bindable(event="propertyChange")]
		public function get _SkipTutorialButtonSkin_PopUpAnchor1() : PopUpAnchor
		{
			return this._1344706396_SkipTutorialButtonSkin_PopUpAnchor1;
		}
		
		public function set _SkipTutorialButtonSkin_PopUpAnchor1(param1:PopUpAnchor) : void
		{
			var _loc2_:Object = this._1344706396_SkipTutorialButtonSkin_PopUpAnchor1;
			if(_loc2_ !== param1)
			{
				this._1344706396_SkipTutorialButtonSkin_PopUpAnchor1 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_SkipTutorialButtonSkin_PopUpAnchor1",_loc2_,param1));
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
		public function get popUpGroup() : Group
		{
			return this._268453613popUpGroup;
		}
		
		public function set popUpGroup(param1:Group) : void
		{
			var _loc2_:Object = this._268453613popUpGroup;
			if(_loc2_ !== param1)
			{
				this._268453613popUpGroup = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"popUpGroup",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get hostComponent() : Button
		{
			return this._213507019hostComponent;
		}
		
		public function set hostComponent(param1:Button) : void
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
