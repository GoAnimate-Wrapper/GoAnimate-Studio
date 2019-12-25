package anifire.studio.skins
{
	import flash.utils.getDefinitionByName;
	import mx.binding.Binding;
	import mx.binding.BindingManager;
	import mx.binding.IBindingClient;
	import mx.binding.IWatcherSetupUtil2;
	import mx.core.IFlexModuleFactory;
	import mx.core.IStateClient2;
	import mx.core.mx_internal;
	import mx.events.PropertyChangeEvent;
	import mx.states.SetProperty;
	import mx.states.State;
	import spark.components.CheckBox;
	import spark.components.Label;
	import spark.primitives.BitmapImage;
	import spark.skins.SparkSkin;
	
	use namespace mx_internal;
	
	public class FlatCheckBoxSkin extends SparkSkin implements IBindingClient, IStateClient2
	{
		
		private static const focusExclusions:Array = ["labelDisplay"];
		
		private static var _watcherSetupUtil:IWatcherSetupUtil2;
		 
		
		private var _1836954358baseImage:BitmapImage;
		
		private var _1184053038labelDisplay:Label;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		private var _embed_mxml__styles_images_common_checkbox_selected_png_1245997339:Class;
		
		private var _embed_mxml__styles_images_common_checkbox_base_png_1458081719:Class;
		
		mx_internal var _bindings:Array;
		
		mx_internal var _watchers:Array;
		
		mx_internal var _bindingsByDestination:Object;
		
		mx_internal var _bindingsBeginWithWord:Object;
		
		private var _213507019hostComponent:CheckBox;
		
		public function FlatCheckBoxSkin()
		{
			var bindings:Array = null;
			var target:Object = null;
			var watcherSetupUtilClass:Object = null;
			this._embed_mxml__styles_images_common_checkbox_selected_png_1245997339 = FlatCheckBoxSkin__embed_mxml__styles_images_common_checkbox_selected_png_1245997339;
			this._embed_mxml__styles_images_common_checkbox_base_png_1458081719 = FlatCheckBoxSkin__embed_mxml__styles_images_common_checkbox_base_png_1458081719;
			this._bindings = [];
			this._watchers = [];
			this._bindingsByDestination = {};
			this._bindingsBeginWithWord = {};
			super();
			mx_internal::_document = this;
			bindings = this._FlatCheckBoxSkin_bindingsSetup();
			var watchers:Array = [];
			target = this;
			if(_watcherSetupUtil == null)
			{
				watcherSetupUtilClass = getDefinitionByName("_anifire_studio_skins_FlatCheckBoxSkinWatcherSetupUtil");
				watcherSetupUtilClass["init"](null);
			}
			_watcherSetupUtil.setup(this,function(param1:String):*
			{
				return target[param1];
			},function(param1:String):*
			{
				return FlatCheckBoxSkin[param1];
			},bindings,watchers);
			mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
			mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
			this.mxmlContent = [this._FlatCheckBoxSkin_BitmapImage1_i(),this._FlatCheckBoxSkin_Label1_i()];
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
					"value":this._embed_mxml__styles_images_common_checkbox_selected_png_1245997339
				})]
			}),new State({
				"name":"overAndSelected",
				"stateGroups":["selectedStates","overStates"],
				"overrides":[new SetProperty().initializeFromObject({
					"target":"baseImage",
					"name":"source",
					"value":this._embed_mxml__styles_images_common_checkbox_selected_png_1245997339
				})]
			}),new State({
				"name":"downAndSelected",
				"stateGroups":["selectedStates","downStates"],
				"overrides":[new SetProperty().initializeFromObject({
					"target":"baseImage",
					"name":"source",
					"value":this._embed_mxml__styles_images_common_checkbox_selected_png_1245997339
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
					"value":this._embed_mxml__styles_images_common_checkbox_selected_png_1245997339
				})]
			})];
			var i:uint = 0;
			while(i < bindings.length)
			{
				Binding(bindings[i]).execute();
				i++;
			}
		}
		
		public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
		{
			FlatCheckBoxSkin._watcherSetupUtil = param1;
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
		
		private function _FlatCheckBoxSkin_BitmapImage1_i() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.verticalCenter = 0;
			_loc1_.source = this._embed_mxml__styles_images_common_checkbox_base_png_1458081719;
			_loc1_.initialized(this,"baseImage");
			this.baseImage = _loc1_;
			BindingManager.executeBindings(this,"baseImage",this.baseImage);
			return _loc1_;
		}
		
		private function _FlatCheckBoxSkin_Label1_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.maxDisplayedLines = 1;
			_loc1_.left = 28;
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
		
		private function _FlatCheckBoxSkin_bindingsSetup() : Array
		{
			var result:Array = [];
			result[0] = new Binding(this,function():uint
			{
				return hostComponent.getStyle("color");
			},function(param1:uint):void
			{
				labelDisplay.setStyle("color",param1);
			},"labelDisplay.color");
			return result;
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
		public function get hostComponent() : CheckBox
		{
			return this._213507019hostComponent;
		}
		
		public function set hostComponent(param1:CheckBox) : void
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
