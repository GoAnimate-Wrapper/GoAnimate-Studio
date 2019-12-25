package anifire.studio.components
{
	import anifire.event.ExtraDataEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.getDefinitionByName;
	import mx.binding.Binding;
	import mx.binding.BindingManager;
	import mx.binding.IBindingClient;
	import mx.binding.IWatcherSetupUtil2;
	import mx.core.IFlexModuleFactory;
	import mx.core.IStateClient2;
	import mx.core.mx_internal;
	import mx.events.PropertyChangeEvent;
	import mx.graphics.SolidColor;
	import mx.graphics.SolidColorStroke;
	import mx.states.SetProperty;
	import mx.states.State;
	import spark.components.Group;
	import spark.components.VSlider;
	import spark.formatters.NumberFormatter;
	import spark.primitives.Rect;
	import spark.primitives.RectangularDropShadow;
	
	use namespace mx_internal;
	
	public class PlainSpeechVolumeControl extends Group implements IBindingClient, IStateClient2
	{
		
		private static var _watcherSetupUtil:IWatcherSetupUtil2;
		 
		
		private var _1931449851percentFormatter:NumberFormatter;
		
		private var _92033697popUpAnchor:spark.components.PopUpAnchor;
		
		private var _1217701141popUpContainer:Group;
		
		private var _372220429popUpContent:Group;
		
		private var _2118827756volumeButton:IconButton;
		
		private var _1698099045volumeSlider:VSlider;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		private const MIN_VOL:Number = 0;
		
		private const MAX_VOL:Number = 8;
		
		private const VOL_INCREMENT:Number = 0.25;
		
		private var _volume:Number;
		
		private var _expandUp:Boolean = true;
		
		private var _embed_mxml__styles_images_voicetab_viewpage_volume_hover_png_1660602669:Class;
		
		private var _embed_mxml__styles_images_voicetab_viewpage_volume_png_1568971177:Class;
		
		mx_internal var _bindings:Array;
		
		mx_internal var _watchers:Array;
		
		mx_internal var _bindingsByDestination:Object;
		
		mx_internal var _bindingsBeginWithWord:Object;
		
		public function PlainSpeechVolumeControl()
		{
			var target:Object = null;
			var watcherSetupUtilClass:Object = null;
			this._embed_mxml__styles_images_voicetab_viewpage_volume_hover_png_1660602669 = PlainSpeechVolumeControl__embed_mxml__styles_images_voicetab_viewpage_volume_hover_png_1660602669;
			this._embed_mxml__styles_images_voicetab_viewpage_volume_png_1568971177 = PlainSpeechVolumeControl__embed_mxml__styles_images_voicetab_viewpage_volume_png_1568971177;
			this._bindings = [];
			this._watchers = [];
			this._bindingsByDestination = {};
			this._bindingsBeginWithWord = {};
			super();
			mx_internal::_document = this;
			var bindings:Array = this._PlainSpeechVolumeControl_bindingsSetup();
			var watchers:Array = [];
			target = this;
			if(_watcherSetupUtil == null)
			{
				watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_PlainSpeechVolumeControlWatcherSetupUtil");
				watcherSetupUtilClass["init"](null);
			}
			_watcherSetupUtil.setup(this,function(param1:String):*
			{
				return target[param1];
			},function(param1:String):*
			{
				return PlainSpeechVolumeControl[param1];
			},bindings,watchers);
			mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
			mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
			this.width = 15;
			this.height = 11;
			this.mxmlContent = [this._PlainSpeechVolumeControl_IconButton1_i(),this._PlainSpeechVolumeControl_PopUpAnchor1_i()];
			this.currentState = "normal";
			this._PlainSpeechVolumeControl_NumberFormatter1_i();
			states = [new State({
				"name":"normal",
				"overrides":[]
			}),new State({
				"name":"expanded",
				"overrides":[new SetProperty().initializeFromObject({
					"target":"popUpAnchor",
					"name":"displayPopUp",
					"value":true
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
			PlainSpeechVolumeControl._watcherSetupUtil = param1;
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
		
		private function set _1939100971expandUp(param1:Boolean) : void
		{
			this._expandUp = param1;
		}
		
		[Bindable(event="propertyChange")]
		public function get expandUp() : Boolean
		{
			return this._expandUp;
		}
		
		private function set _810883302volume(param1:Number) : void
		{
			if(param1 >= this.MIN_VOL && param1 <= this.MAX_VOL)
			{
				this._volume = param1;
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get volume() : Number
		{
			return this._volume;
		}
		
		private function showSlider() : void
		{
			currentState = "expanded";
		}
		
		private function hideSlider() : void
		{
			currentState = "normal";
			this.dispatchVolume();
		}
		
		private function onClickVolume() : void
		{
			this.showSlider();
		}
		
		private function onRollOut(param1:Event) : void
		{
			this.hideSlider();
		}
		
		private function dispatchVolume() : void
		{
			var _loc1_:ExtraDataEvent = new ExtraDataEvent(ExtraDataEvent.UPDATE,this,this.volume);
			dispatchEvent(_loc1_);
		}
		
		private function zoomSliderDataTip(param1:Number) : String
		{
			return this.percentFormatter.format(100 * param1) + " %";
		}
		
		protected function onSliderChange(param1:Event) : void
		{
			this._volume = this.volumeSlider.value;
		}
		
		private function _PlainSpeechVolumeControl_NumberFormatter1_i() : NumberFormatter
		{
			var _loc1_:NumberFormatter = new NumberFormatter();
			_loc1_.fractionalDigits = 0;
			_loc1_.initialized(this,"percentFormatter");
			this.percentFormatter = _loc1_;
			BindingManager.executeBindings(this,"percentFormatter",this.percentFormatter);
			return _loc1_;
		}
		
		private function _PlainSpeechVolumeControl_IconButton1_i() : IconButton
		{
			var _loc1_:IconButton = new IconButton();
			_loc1_.horizontalCenter = 0;
			_loc1_.verticalCenter = 0;
			_loc1_.buttonMode = true;
			_loc1_.setStyle("icon",this._embed_mxml__styles_images_voicetab_viewpage_volume_png_1568971177);
			_loc1_.setStyle("iconOver",this._embed_mxml__styles_images_voicetab_viewpage_volume_hover_png_1660602669);
			_loc1_.addEventListener("click",this.__volumeButton_click);
			_loc1_.id = "volumeButton";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.volumeButton = _loc1_;
			BindingManager.executeBindings(this,"volumeButton",this.volumeButton);
			return _loc1_;
		}
		
		public function __volumeButton_click(param1:MouseEvent) : void
		{
			this.showSlider();
		}
		
		private function _PlainSpeechVolumeControl_PopUpAnchor1_i() : spark.components.PopUpAnchor
		{
			var _loc1_:spark.components.PopUpAnchor = new spark.components.PopUpAnchor();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.height = 0;
			_loc1_.popUpWidthMatchesAnchorWidth = true;
			_loc1_.popUpHeightMatchesAnchorHeight = true;
			_loc1_.popUpPosition = "below";
			_loc1_.popUp = this._PlainSpeechVolumeControl_Group2_i();
			_loc1_.id = "popUpAnchor";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.popUpAnchor = _loc1_;
			BindingManager.executeBindings(this,"popUpAnchor",this.popUpAnchor);
			return _loc1_;
		}
		
		private function _PlainSpeechVolumeControl_Group2_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.mxmlContent = [this._PlainSpeechVolumeControl_Group3_i()];
			_loc1_.id = "popUpContainer";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.popUpContainer = _loc1_;
			BindingManager.executeBindings(this,"popUpContainer",this.popUpContainer);
			return _loc1_;
		}
		
		private function _PlainSpeechVolumeControl_Group3_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.width = 19;
			_loc1_.height = 85;
			_loc1_.top = -4;
			_loc1_.horizontalCenter = 0;
			_loc1_.mouseEnabledWhereTransparent = true;
			_loc1_.mxmlContent = [this._PlainSpeechVolumeControl_RectangularDropShadow1_c(),this._PlainSpeechVolumeControl_Rect1_c(),this._PlainSpeechVolumeControl_Rect2_c(),this._PlainSpeechVolumeControl_VSlider1_i()];
			_loc1_.addEventListener("rollOut",this.__popUpContent_rollOut);
			_loc1_.id = "popUpContent";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.popUpContent = _loc1_;
			BindingManager.executeBindings(this,"popUpContent",this.popUpContent);
			return _loc1_;
		}
		
		private function _PlainSpeechVolumeControl_RectangularDropShadow1_c() : RectangularDropShadow
		{
			var _loc1_:RectangularDropShadow = new RectangularDropShadow();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.alpha = 0.5;
			_loc1_.distance = 0;
			_loc1_.blurX = 4;
			_loc1_.blurY = 4;
			_loc1_.tlRadius = 4;
			_loc1_.trRadius = 4;
			_loc1_.blRadius = 4;
			_loc1_.brRadius = 4;
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _PlainSpeechVolumeControl_Rect1_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 17;
			_loc1_.bottom = 0;
			_loc1_.bottomLeftRadiusX = 4;
			_loc1_.bottomRightRadiusX = 4;
			_loc1_.fill = this._PlainSpeechVolumeControl_SolidColor1_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _PlainSpeechVolumeControl_SolidColor1_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 16777215;
			return _loc1_;
		}
		
		private function _PlainSpeechVolumeControl_Rect2_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.radiusX = 4;
			_loc1_.stroke = this._PlainSpeechVolumeControl_SolidColorStroke1_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _PlainSpeechVolumeControl_SolidColorStroke1_c() : SolidColorStroke
		{
			var _loc1_:SolidColorStroke = new SolidColorStroke();
			_loc1_.color = 5486248;
			return _loc1_;
		}
		
		private function _PlainSpeechVolumeControl_VSlider1_i() : VSlider
		{
			var _loc1_:VSlider = new VSlider();
			_loc1_.horizontalCenter = 0;
			_loc1_.top = 17;
			_loc1_.bottom = 0;
			_loc1_.buttonMode = true;
			_loc1_.dataTipFormatFunction = this.zoomSliderDataTip;
			_loc1_.setStyle("liveDragging",true);
			_loc1_.addEventListener("change",this.__volumeSlider_change);
			_loc1_.id = "volumeSlider";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.volumeSlider = _loc1_;
			BindingManager.executeBindings(this,"volumeSlider",this.volumeSlider);
			return _loc1_;
		}
		
		public function __volumeSlider_change(param1:Event) : void
		{
			this.onSliderChange(param1);
		}
		
		public function __popUpContent_rollOut(param1:MouseEvent) : void
		{
			this.onRollOut(param1);
		}
		
		private function _PlainSpeechVolumeControl_bindingsSetup() : Array
		{
			var result:Array = [];
			result[0] = new Binding(this,function():Number
			{
				return MIN_VOL;
			},null,"volumeSlider.minimum");
			result[1] = new Binding(this,function():Number
			{
				return MAX_VOL;
			},null,"volumeSlider.maximum");
			result[2] = new Binding(this,function():Number
			{
				return VOL_INCREMENT;
			},null,"volumeSlider.snapInterval");
			result[3] = new Binding(this,null,null,"volumeSlider.value","volume");
			return result;
		}
		
		[Bindable(event="propertyChange")]
		public function get percentFormatter() : NumberFormatter
		{
			return this._1931449851percentFormatter;
		}
		
		public function set percentFormatter(param1:NumberFormatter) : void
		{
			var _loc2_:Object = this._1931449851percentFormatter;
			if(_loc2_ !== param1)
			{
				this._1931449851percentFormatter = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"percentFormatter",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get popUpAnchor() : spark.components.PopUpAnchor
		{
			return this._92033697popUpAnchor;
		}
		
		public function set popUpAnchor(param1:spark.components.PopUpAnchor) : void
		{
			var _loc2_:Object = this._92033697popUpAnchor;
			if(_loc2_ !== param1)
			{
				this._92033697popUpAnchor = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"popUpAnchor",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get popUpContainer() : Group
		{
			return this._1217701141popUpContainer;
		}
		
		public function set popUpContainer(param1:Group) : void
		{
			var _loc2_:Object = this._1217701141popUpContainer;
			if(_loc2_ !== param1)
			{
				this._1217701141popUpContainer = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"popUpContainer",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get popUpContent() : Group
		{
			return this._372220429popUpContent;
		}
		
		public function set popUpContent(param1:Group) : void
		{
			var _loc2_:Object = this._372220429popUpContent;
			if(_loc2_ !== param1)
			{
				this._372220429popUpContent = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"popUpContent",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get volumeButton() : IconButton
		{
			return this._2118827756volumeButton;
		}
		
		public function set volumeButton(param1:IconButton) : void
		{
			var _loc2_:Object = this._2118827756volumeButton;
			if(_loc2_ !== param1)
			{
				this._2118827756volumeButton = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"volumeButton",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get volumeSlider() : VSlider
		{
			return this._1698099045volumeSlider;
		}
		
		public function set volumeSlider(param1:VSlider) : void
		{
			var _loc2_:Object = this._1698099045volumeSlider;
			if(_loc2_ !== param1)
			{
				this._1698099045volumeSlider = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"volumeSlider",_loc2_,param1));
				}
			}
		}
		
		public function set expandUp(param1:Boolean) : void
		{
			var _loc2_:Object = this.expandUp;
			if(_loc2_ !== param1)
			{
				this._1939100971expandUp = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"expandUp",_loc2_,param1));
				}
			}
		}
		
		public function set volume(param1:Number) : void
		{
			var _loc2_:Object = this.volume;
			if(_loc2_ !== param1)
			{
				this._810883302volume = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"volume",_loc2_,param1));
				}
			}
		}
	}
}
