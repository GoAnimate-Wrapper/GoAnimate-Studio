package anifire.studio.skins
{
	import mx.binding.BindingManager;
	import mx.core.IFlexModuleFactory;
	import mx.core.IStateClient2;
	import mx.events.PropertyChangeEvent;
	import mx.states.SetProperty;
	import mx.states.State;
	import spark.components.Label;
	import spark.components.RadioButton;
	import spark.primitives.BitmapImage;
	import spark.skins.SparkSkin;
	
	public class FlatRadioButtonSkin extends SparkSkin implements IStateClient2
	{
		
		private static const focusExclusions:Array = ["labelDisplay"];
		 
		
		private var _1836954358baseImage:BitmapImage;
		
		private var _1184053038labelDisplay:Label;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		private var _embed_mxml__styles_images_common_radio_selected_png_1500612237:Class;
		
		private var _embed_mxml__styles_images_common_radio_base_png_195960919:Class;
		
		private var _213507019hostComponent:RadioButton;
		
		public function FlatRadioButtonSkin()
		{
			this._embed_mxml__styles_images_common_radio_selected_png_1500612237 = FlatRadioButtonSkin__embed_mxml__styles_images_common_radio_selected_png_1500612237;
			this._embed_mxml__styles_images_common_radio_base_png_195960919 = FlatRadioButtonSkin__embed_mxml__styles_images_common_radio_base_png_195960919;
			super();
			mx_internal::_document = this;
			this.mxmlContent = [this._FlatRadioButtonSkin_BitmapImage1_i(),this._FlatRadioButtonSkin_Label1_i()];
			this.currentState = "up";
			states = [new State({
				"name":"up",
				"overrides":[]
			}),new State({
				"name":"over",
				"stateGroups":["overStates"],
				"overrides":[]
			}),new State({
				"name":"down",
				"stateGroups":["downStates"],
				"overrides":[]
			}),new State({
				"name":"disabled",
				"stateGroups":["disabledStates"],
				"overrides":[new SetProperty().initializeFromObject({
					"name":"alpha",
					"value":0.5
				})]
			}),new State({
				"name":"upAndSelected",
				"stateGroups":["selectedStates"],
				"overrides":[new SetProperty().initializeFromObject({
					"target":"baseImage",
					"name":"source",
					"value":this._embed_mxml__styles_images_common_radio_selected_png_1500612237
				})]
			}),new State({
				"name":"overAndSelected",
				"stateGroups":["selectedStates","overStates"],
				"overrides":[new SetProperty().initializeFromObject({
					"target":"baseImage",
					"name":"source",
					"value":this._embed_mxml__styles_images_common_radio_selected_png_1500612237
				})]
			}),new State({
				"name":"downAndSelected",
				"stateGroups":["selectedStates","downStates"],
				"overrides":[new SetProperty().initializeFromObject({
					"target":"baseImage",
					"name":"source",
					"value":this._embed_mxml__styles_images_common_radio_selected_png_1500612237
				})]
			}),new State({
				"name":"disabledAndSelected",
				"stateGroups":["selectedStates","disabledStates"],
				"overrides":[new SetProperty().initializeFromObject({
					"name":"alpha",
					"value":0.5
				}),new SetProperty().initializeFromObject({
					"target":"baseImage",
					"name":"source",
					"value":this._embed_mxml__styles_images_common_radio_selected_png_1500612237
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
		
		override public function get focusSkinExclusions() : Array
		{
			return focusExclusions;
		}
		
		private function _FlatRadioButtonSkin_BitmapImage1_i() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.verticalCenter = -1;
			_loc1_.smooth = true;
			_loc1_.source = this._embed_mxml__styles_images_common_radio_base_png_195960919;
			_loc1_.initialized(this,"baseImage");
			this.baseImage = _loc1_;
			BindingManager.executeBindings(this,"baseImage",this.baseImage);
			return _loc1_;
		}
		
		private function _FlatRadioButtonSkin_Label1_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.maxDisplayedLines = 1;
			_loc1_.left = 33;
			_loc1_.right = 0;
			_loc1_.top = 3;
			_loc1_.bottom = 3;
			_loc1_.verticalCenter = 0;
			_loc1_.setStyle("textAlign","start");
			_loc1_.setStyle("fontWeight","bold");
			_loc1_.setStyle("verticalAlign","middle");
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
		public function get baseImage() : BitmapImage
		{
			return this._1836954358baseImage;
		}
		
		public function set baseImage(param1:BitmapImage) : void
		{
			var _loc2_:Object = this._1836954358baseImage;
			if(_loc2_ !== param1)
			{
				this._1836954358baseImage = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"baseImage",_loc2_,param1));
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
		public function get hostComponent() : RadioButton
		{
			return this._213507019hostComponent;
		}
		
		public function set hostComponent(param1:RadioButton) : void
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
