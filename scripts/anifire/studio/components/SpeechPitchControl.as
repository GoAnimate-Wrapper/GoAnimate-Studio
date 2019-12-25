package anifire.studio.components
{
	import anifire.event.ExtraDataEvent;
	import anifire.util.UtilDict;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.getDefinitionByName;
	import mx.binding.Binding;
	import mx.binding.BindingManager;
	import mx.binding.IBindingClient;
	import mx.binding.IWatcherSetupUtil2;
	import mx.core.DeferredInstanceFromFunction;
	import mx.core.IFlexModuleFactory;
	import mx.core.IStateClient2;
	import mx.core.mx_internal;
	import mx.events.PropertyChangeEvent;
	import mx.graphics.SolidColor;
	import mx.graphics.SolidColorStroke;
	import mx.states.AddItems;
	import mx.states.SetProperty;
	import mx.states.State;
	import spark.components.Group;
	import spark.components.VSlider;
	import spark.formatters.NumberFormatter;
	import spark.primitives.Rect;
	import spark.primitives.RectangularDropShadow;
	
	use namespace mx_internal;
	
	public class SpeechPitchControl extends Group implements IBindingClient, IStateClient2
	{
		
		private static var _watcherSetupUtil:IWatcherSetupUtil2;
		 
		
		private var _1290911217backgroundGroup:Group;
		
		private var _1931449851percentFormatter:NumberFormatter;
		
		private var _1030637503pitchSlider:VSlider;
		
		private var _80023010sliderGroup:Group;
		
		private var _2118827756volumeButton:IconButton;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		private const MIN_PIT:Number = -200;
		
		private const MAX_PIT:Number = 200;
		
		private const PIT_INCREMENT:Number = 100;
		
		private var _pitch:Number;
		
		private var _expandUp:Boolean = true;
		
		private var _embed_mxml__styles_images_voicetab_voice_pitch_png_451591219:Class;
		
		private var _embed_mxml__styles_images_voicetab_voice_pitch_hover_png_785687095:Class;
		
		mx_internal var _bindings:Array;
		
		mx_internal var _watchers:Array;
		
		mx_internal var _bindingsByDestination:Object;
		
		mx_internal var _bindingsBeginWithWord:Object;
		
		public function SpeechPitchControl()
		{
			var bindings:Array = null;
			var target:Object = null;
			var watcherSetupUtilClass:Object = null;
			this._embed_mxml__styles_images_voicetab_voice_pitch_png_451591219 = SpeechPitchControl__embed_mxml__styles_images_voicetab_voice_pitch_png_451591219;
			this._embed_mxml__styles_images_voicetab_voice_pitch_hover_png_785687095 = SpeechPitchControl__embed_mxml__styles_images_voicetab_voice_pitch_hover_png_785687095;
			this._bindings = [];
			this._watchers = [];
			this._bindingsByDestination = {};
			this._bindingsBeginWithWord = {};
			super();
			mx_internal::_document = this;
			bindings = this._SpeechPitchControl_bindingsSetup();
			var watchers:Array = [];
			target = this;
			if(_watcherSetupUtil == null)
			{
				watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_SpeechPitchControlWatcherSetupUtil");
				watcherSetupUtilClass["init"](null);
			}
			_watcherSetupUtil.setup(this,function(param1:String):*
			{
				return target[param1];
			},function(param1:String):*
			{
				return SpeechPitchControl[param1];
			},bindings,watchers);
			mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
			mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
			this.width = 42;
			this.height = 42;
			this.mxmlContent = [this._SpeechPitchControl_IconButton1_i(),this._SpeechPitchControl_Group3_i()];
			this.currentState = "normal";
			this._SpeechPitchControl_NumberFormatter1_i();
			var _SpeechPitchControl_Group2_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._SpeechPitchControl_Group2_i);
			states = [new State({
				"name":"normal",
				"overrides":[]
			}),new State({
				"name":"expandUp",
				"stateGroups":["expand"],
				"overrides":[new AddItems().initializeFromObject({
					"itemsFactory":_SpeechPitchControl_Group2_factory,
					"destination":null,
					"propertyName":"mxmlContent",
					"position":"first"
				}),new SetProperty().initializeFromObject({
					"target":"backgroundGroup",
					"name":"top",
					"value":-85
				}),new SetProperty().initializeFromObject({
					"target":"backgroundGroup",
					"name":"bottom",
					"value":0
				}),new SetProperty().initializeFromObject({
					"target":"sliderGroup",
					"name":"top",
					"value":-85
				}),new SetProperty().initializeFromObject({
					"target":"sliderGroup",
					"name":"visible",
					"value":true
				})]
			}),new State({
				"name":"expandDown",
				"stateGroups":["expand"],
				"overrides":[new AddItems().initializeFromObject({
					"itemsFactory":_SpeechPitchControl_Group2_factory,
					"destination":null,
					"propertyName":"mxmlContent",
					"position":"first"
				}),new SetProperty().initializeFromObject({
					"target":"backgroundGroup",
					"name":"top",
					"value":0
				}),new SetProperty().initializeFromObject({
					"target":"backgroundGroup",
					"name":"bottom",
					"value":-85
				}),new SetProperty().initializeFromObject({
					"target":"sliderGroup",
					"name":"top",
					"value":32
				}),new SetProperty().initializeFromObject({
					"target":"sliderGroup",
					"name":"visible",
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
			SpeechPitchControl._watcherSetupUtil = param1;
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
		
		private function set _106677056pitch(param1:Number) : void
		{
			if(param1 >= this.MIN_PIT && param1 <= this.MAX_PIT)
			{
				this._pitch = param1;
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get pitch() : Number
		{
			return this._pitch;
		}
		
		private function showSlider() : void
		{
			if(this.expandUp)
			{
				currentState = "expandUp";
			}
			else
			{
				currentState = "expandDown";
			}
		}
		
		private function hideSlider() : void
		{
			currentState = "normal";
			this.dispatchPitch();
		}
		
		private function onClickPitch() : void
		{
			this.showSlider();
		}
		
		private function onRollOut(param1:Event) : void
		{
			this.hideSlider();
		}
		
		private function dispatchPitch() : void
		{
			var _loc1_:ExtraDataEvent = new ExtraDataEvent(ExtraDataEvent.PITCH_UPDATE,this,this.pitch);
			dispatchEvent(_loc1_);
		}
		
		private function zoomSliderDataTip(param1:Number) : String
		{
			switch(param1)
			{
				case -200:
					return UtilDict.toDisplay("go","very low pitch");
				case -100:
					return UtilDict.toDisplay("go","low pitch");
				case 0:
					return UtilDict.toDisplay("go","normal pitch");
				case 100:
					return UtilDict.toDisplay("go","high pitch");
				case 200:
					return UtilDict.toDisplay("go","very high pitch");
				default:
					return "";
			}
		}
		
		protected function onSliderChange(param1:Event) : void
		{
			this._pitch = this.pitchSlider.value;
		}
		
		private function _SpeechPitchControl_NumberFormatter1_i() : NumberFormatter
		{
			var _loc1_:NumberFormatter = new NumberFormatter();
			_loc1_.fractionalDigits = 0;
			_loc1_.initialized(this,"percentFormatter");
			this.percentFormatter = _loc1_;
			BindingManager.executeBindings(this,"percentFormatter",this.percentFormatter);
			return _loc1_;
		}
		
		private function _SpeechPitchControl_Group2_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.mxmlContent = [this._SpeechPitchControl_RectangularDropShadow1_c(),this._SpeechPitchControl_Rect1_c()];
			_loc1_.id = "backgroundGroup";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.backgroundGroup = _loc1_;
			BindingManager.executeBindings(this,"backgroundGroup",this.backgroundGroup);
			return _loc1_;
		}
		
		private function _SpeechPitchControl_RectangularDropShadow1_c() : RectangularDropShadow
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
		
		private function _SpeechPitchControl_Rect1_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.radiusX = 4;
			_loc1_.stroke = this._SpeechPitchControl_SolidColorStroke1_c();
			_loc1_.fill = this._SpeechPitchControl_SolidColor1_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _SpeechPitchControl_SolidColorStroke1_c() : SolidColorStroke
		{
			var _loc1_:SolidColorStroke = new SolidColorStroke();
			_loc1_.color = 5486248;
			return _loc1_;
		}
		
		private function _SpeechPitchControl_SolidColor1_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 16777215;
			return _loc1_;
		}
		
		private function _SpeechPitchControl_IconButton1_i() : IconButton
		{
			var _loc1_:IconButton = new IconButton();
			_loc1_.horizontalCenter = 0;
			_loc1_.verticalCenter = 0;
			_loc1_.buttonMode = true;
			_loc1_.setStyle("icon",this._embed_mxml__styles_images_voicetab_voice_pitch_png_451591219);
			_loc1_.setStyle("iconOver",this._embed_mxml__styles_images_voicetab_voice_pitch_hover_png_785687095);
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
		
		private function _SpeechPitchControl_Group3_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.bottom = 0;
			_loc1_.width = 42;
			_loc1_.mouseEnabledWhereTransparent = true;
			_loc1_.visible = false;
			_loc1_.mxmlContent = [this._SpeechPitchControl_VSlider1_i()];
			_loc1_.addEventListener("rollOut",this.__sliderGroup_rollOut);
			_loc1_.id = "sliderGroup";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.sliderGroup = _loc1_;
			BindingManager.executeBindings(this,"sliderGroup",this.sliderGroup);
			return _loc1_;
		}
		
		private function _SpeechPitchControl_VSlider1_i() : VSlider
		{
			var _loc1_:VSlider = new VSlider();
			_loc1_.top = 10;
			_loc1_.horizontalCenter = 0;
			_loc1_.height = 75;
			_loc1_.buttonMode = true;
			_loc1_.dataTipFormatFunction = this.zoomSliderDataTip;
			_loc1_.setStyle("liveDragging",true);
			_loc1_.addEventListener("change",this.__pitchSlider_change);
			_loc1_.id = "pitchSlider";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.pitchSlider = _loc1_;
			BindingManager.executeBindings(this,"pitchSlider",this.pitchSlider);
			return _loc1_;
		}
		
		public function __pitchSlider_change(param1:Event) : void
		{
			this.onSliderChange(param1);
		}
		
		public function __sliderGroup_rollOut(param1:MouseEvent) : void
		{
			this.onRollOut(param1);
		}
		
		private function _SpeechPitchControl_bindingsSetup() : Array
		{
			var result:Array = [];
			result[0] = new Binding(this,function():Number
			{
				return MIN_PIT;
			},null,"pitchSlider.minimum");
			result[1] = new Binding(this,function():Number
			{
				return MAX_PIT;
			},null,"pitchSlider.maximum");
			result[2] = new Binding(this,function():Number
			{
				return PIT_INCREMENT;
			},null,"pitchSlider.snapInterval");
			result[3] = new Binding(this,null,null,"pitchSlider.value","pitch");
			return result;
		}
		
		[Bindable(event="propertyChange")]
		public function get backgroundGroup() : Group
		{
			return this._1290911217backgroundGroup;
		}
		
		public function set backgroundGroup(param1:Group) : void
		{
			var _loc2_:Object = this._1290911217backgroundGroup;
			if(_loc2_ !== param1)
			{
				this._1290911217backgroundGroup = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"backgroundGroup",_loc2_,param1));
				}
			}
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
		public function get pitchSlider() : VSlider
		{
			return this._1030637503pitchSlider;
		}
		
		public function set pitchSlider(param1:VSlider) : void
		{
			var _loc2_:Object = this._1030637503pitchSlider;
			if(_loc2_ !== param1)
			{
				this._1030637503pitchSlider = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pitchSlider",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get sliderGroup() : Group
		{
			return this._80023010sliderGroup;
		}
		
		public function set sliderGroup(param1:Group) : void
		{
			var _loc2_:Object = this._80023010sliderGroup;
			if(_loc2_ !== param1)
			{
				this._80023010sliderGroup = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sliderGroup",_loc2_,param1));
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
		
		public function set pitch(param1:Number) : void
		{
			var _loc2_:Object = this.pitch;
			if(_loc2_ !== param1)
			{
				this._106677056pitch = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pitch",_loc2_,param1));
				}
			}
		}
	}
}
