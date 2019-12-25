package anifire.studio.components
{
	import anifire.studio.commands.ChangeEffectAssetTimingCommand;
	import anifire.studio.core.EffectAsset;
	import anifire.studio.core.EffectThumb;
	import anifire.studio.events.AssetEvent;
	import anifire.studio.events.EffectTrayEvent;
	import anifire.studio.events.MenuItemEvent;
	import anifire.studio.events.SceneEvent;
	import anifire.studio.models.ThumbModel;
	import anifire.studio.skins.TinyRangeSelectorSkin;
	import anifire.util.UtilDict;
	import anifire.util.UtilUnitConvert;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.getDefinitionByName;
	import mx.binding.Binding;
	import mx.binding.BindingManager;
	import mx.binding.IBindingClient;
	import mx.binding.IWatcherSetupUtil2;
	import mx.controls.Spacer;
	import mx.core.IFlexModuleFactory;
	import mx.core.IStateClient2;
	import mx.core.mx_internal;
	import mx.events.PropertyChangeEvent;
	import mx.graphics.SolidColor;
	import mx.graphics.SolidColorStroke;
	import mx.states.State;
	import spark.components.Group;
	import spark.components.HGroup;
	import spark.components.Label;
	import spark.components.supportClasses.ItemRenderer;
	import spark.primitives.Line;
	import spark.primitives.Rect;
	
	use namespace mx_internal;
	
	public class EffectControlsItemRenderer extends ItemRenderer implements IBindingClient, IStateClient2
	{
		
		private static var _watcherSetupUtil:IWatcherSetupUtil2;
		 
		
		public var _EffectControlsItemRenderer_Label1:Label;
		
		private var _2024940825imageDisplay:EffectThumbSparkImage;
		
		private var _2001826798timingRangeSelector:RangeSelector;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		private var _command:ChangeEffectAssetTimingCommand;
		
		protected var _target:EffectAsset;
		
		protected var _effectName:String;
		
		private var _embed_mxml__styles_images_panel_fx_delete_png_1136997623:Class;
		
		mx_internal var _bindings:Array;
		
		mx_internal var _watchers:Array;
		
		mx_internal var _bindingsByDestination:Object;
		
		mx_internal var _bindingsBeginWithWord:Object;
		
		public function EffectControlsItemRenderer()
		{
			var bindings:Array = null;
			var target:Object = null;
			var watcherSetupUtilClass:Object = null;
			this._embed_mxml__styles_images_panel_fx_delete_png_1136997623 = EffectControlsItemRenderer__embed_mxml__styles_images_panel_fx_delete_png_1136997623;
			this._bindings = [];
			this._watchers = [];
			this._bindingsByDestination = {};
			this._bindingsBeginWithWord = {};
			super();
			mx_internal::_document = this;
			bindings = this._EffectControlsItemRenderer_bindingsSetup();
			var watchers:Array = [];
			target = this;
			if(_watcherSetupUtil == null)
			{
				watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_EffectControlsItemRendererWatcherSetupUtil");
				watcherSetupUtilClass["init"](null);
			}
			_watcherSetupUtil.setup(this,function(param1:String):*
			{
				return target[param1];
			},function(param1:String):*
			{
				return EffectControlsItemRenderer[param1];
			},bindings,watchers);
			mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
			mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
			this.autoDrawBackground = false;
			this.percentWidth = 100;
			this.mxmlContent = [this._EffectControlsItemRenderer_Rect1_c(),this._EffectControlsItemRenderer_HGroup1_c()];
			this.currentState = "normal";
			states = [new State({
				"name":"normal",
				"overrides":[]
			}),new State({
				"name":"hovered",
				"stateGroups":["overAndSelectedStates"],
				"overrides":[]
			}),new State({
				"name":"selected",
				"stateGroups":["borderStates","overAndSelectedStates"],
				"overrides":[]
			}),new State({
				"name":"dragging",
				"stateGroups":["borderStates"],
				"overrides":[]
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
			EffectControlsItemRenderer._watcherSetupUtil = param1;
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
			var _loc2_:ThumbModel = null;
			super.data = param1;
			this.target = param1 as EffectAsset;
			if(this._target)
			{
				this._effectName = (this._target.thumb as EffectThumb).name;
				_loc2_ = new ThumbModel(this._target.thumb as EffectThumb);
				this.imageDisplay.model = _loc2_;
			}
		}
		
		protected function createEffectMenu() : void
		{
		}
		
		protected function onMenuItemClick(param1:MenuItemEvent) : void
		{
		}
		
		protected function onDelEffect() : void
		{
			var _loc1_:EffectTrayEvent = new EffectTrayEvent(EffectTrayEvent.EFFECT_TRAY_ACTION,EffectTrayEvent.DELETE_EFFECT,this._target);
			dispatchEvent(_loc1_);
		}
		
		public function set target(param1:Object) : void
		{
			if(this._target != param1)
			{
				if(this._target)
				{
					this._target.removeEventListener(AssetEvent.ASSET_TIMING_CHANGE,this.onAssetTimingChange);
					if(this._target.scene)
					{
						this._target.scene.removeEventListener(SceneEvent.DURATION_CHANGE,this.onSceneDurationChange);
					}
				}
				this._target = param1 as EffectAsset;
				if(this._target)
				{
					this._target.addEventListener(AssetEvent.ASSET_TIMING_CHANGE,this.onAssetTimingChange);
					if(this._target.scene)
					{
						this._target.scene.addEventListener(SceneEvent.DURATION_CHANGE,this.onSceneDurationChange);
						this.updateTimingRange();
					}
				}
			}
		}
		
		private function onAssetTimingChange(param1:AssetEvent) : void
		{
			this.updateTimingRangeValue();
		}
		
		private function onSceneDurationChange(param1:SceneEvent) : void
		{
			this.updateTimingRange();
		}
		
		private function updateTimingRange() : void
		{
			var _loc1_:Number = UtilUnitConvert.frameToDuration(this._target.scene.totalFrames);
			this.timingRangeSelector.minimum = 0;
			this.timingRangeSelector.maximum = _loc1_;
			this.updateTimingRangeValue();
		}
		
		private function updateTimingRangeValue() : void
		{
			if(this._target.spanWholeScene)
			{
				this.timingRangeSelector.startValue = this.timingRangeSelector.minimum;
				this.timingRangeSelector.endValue = this.timingRangeSelector.maximum;
			}
			else
			{
				this.timingRangeSelector.startValue = UtilUnitConvert.frameToTime(this._target.startFrame);
				this.timingRangeSelector.endValue = UtilUnitConvert.frameToTime(this._target.endFrame,false);
			}
		}
		
		protected function onTimingRangeSelectorChange(param1:Event) : void
		{
			this.updateEffectValue();
		}
		
		private function updateEffectValue() : void
		{
			var _loc1_:int = 0;
			var _loc2_:int = 0;
			if(this.timingRangeSelector.startValue == this.timingRangeSelector.minimum && this.timingRangeSelector.endValue == this.timingRangeSelector.maximum)
			{
				this._target.spanWholeScene = true;
			}
			else
			{
				_loc1_ = UtilUnitConvert.timeToFrame(this.timingRangeSelector.startValue);
				_loc2_ = UtilUnitConvert.durationToFrame(this.timingRangeSelector.endValue - this.timingRangeSelector.startValue);
				this._target.startFrame = _loc1_;
				this._target.duration = _loc2_;
				this._target.spanWholeScene = false;
			}
		}
		
		protected function onRangeSelectorThumbRelease(param1:Event) : void
		{
			var _loc2_:EffectTrayEvent = new EffectTrayEvent(EffectTrayEvent.EFFECT_TRAY_ACTION,EffectTrayEvent.TIMING_RELEASE,this._target);
			dispatchEvent(_loc2_);
			if(this._command)
			{
				if(this.timingRangeSelector.startValue == this.timingRangeSelector.minimum && this.timingRangeSelector.endValue == this.timingRangeSelector.maximum)
				{
					this._command.executeNow(true,this._target.startFrame,this._target.duration);
				}
				else
				{
					this._command.executeNow(false,UtilUnitConvert.timeToFrame(this.timingRangeSelector.startValue),UtilUnitConvert.durationToFrame(this.timingRangeSelector.endValue - this.timingRangeSelector.startValue));
				}
			}
		}
		
		protected function onRangeSelectorThumbPress(param1:Event) : void
		{
			var _loc2_:EffectTrayEvent = new EffectTrayEvent(EffectTrayEvent.EFFECT_TRAY_ACTION,EffectTrayEvent.TIMING_PRESS,this._target);
			dispatchEvent(_loc2_);
			this._command = new ChangeEffectAssetTimingCommand(this._target);
		}
		
		private function _EffectControlsItemRenderer_Rect1_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.stroke = this._EffectControlsItemRenderer_SolidColorStroke1_c();
			_loc1_.fill = this._EffectControlsItemRenderer_SolidColor1_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _EffectControlsItemRenderer_SolidColorStroke1_c() : SolidColorStroke
		{
			var _loc1_:SolidColorStroke = new SolidColorStroke();
			_loc1_.color = 14540253;
			return _loc1_;
		}
		
		private function _EffectControlsItemRenderer_SolidColor1_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 6142119;
			_loc1_.alpha = 0;
			return _loc1_;
		}
		
		private function _EffectControlsItemRenderer_HGroup1_c() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.verticalAlign = "middle";
			_loc1_.paddingLeft = 0;
			_loc1_.paddingRight = 0;
			_loc1_.paddingTop = 8;
			_loc1_.paddingBottom = 8;
			_loc1_.gap = 8;
			_loc1_.mxmlContent = [this._EffectControlsItemRenderer_Spacer1_c(),this._EffectControlsItemRenderer_EffectThumbSparkImage1_i(),this._EffectControlsItemRenderer_Line1_c(),this._EffectControlsItemRenderer_HGroup2_c(),this._EffectControlsItemRenderer_Line2_c(),this._EffectControlsItemRenderer_Group1_c()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _EffectControlsItemRenderer_Spacer1_c() : Spacer
		{
			var _loc1_:Spacer = new Spacer();
			_loc1_.width = 1;
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _EffectControlsItemRenderer_EffectThumbSparkImage1_i() : EffectThumbSparkImage
		{
			var _loc1_:EffectThumbSparkImage = new EffectThumbSparkImage();
			_loc1_.width = 30;
			_loc1_.height = 30;
			_loc1_.id = "imageDisplay";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.imageDisplay = _loc1_;
			BindingManager.executeBindings(this,"imageDisplay",this.imageDisplay);
			return _loc1_;
		}
		
		private function _EffectControlsItemRenderer_Line1_c() : Line
		{
			var _loc1_:Line = new Line();
			_loc1_.percentHeight = 80;
			_loc1_.stroke = this._EffectControlsItemRenderer_SolidColorStroke2_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _EffectControlsItemRenderer_SolidColorStroke2_c() : SolidColorStroke
		{
			var _loc1_:SolidColorStroke = new SolidColorStroke();
			_loc1_.color = 14540253;
			return _loc1_;
		}
		
		private function _EffectControlsItemRenderer_HGroup2_c() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.verticalAlign = "middle";
			_loc1_.percentWidth = 100;
			_loc1_.gap = 8;
			_loc1_.mxmlContent = [this._EffectControlsItemRenderer_Label1_i(),this._EffectControlsItemRenderer_RangeSelector1_i()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _EffectControlsItemRenderer_Label1_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.setStyle("fontSize",11);
			_loc1_.id = "_EffectControlsItemRenderer_Label1";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._EffectControlsItemRenderer_Label1 = _loc1_;
			BindingManager.executeBindings(this,"_EffectControlsItemRenderer_Label1",this._EffectControlsItemRenderer_Label1);
			return _loc1_;
		}
		
		private function _EffectControlsItemRenderer_RangeSelector1_i() : RangeSelector
		{
			var _loc1_:RangeSelector = new RangeSelector();
			_loc1_.width = 134;
			_loc1_.snapInterval = 0.125;
			_loc1_.setStyle("skinClass",TinyRangeSelectorSkin);
			_loc1_.addEventListener("startThumbPress",this.__timingRangeSelector_startThumbPress);
			_loc1_.addEventListener("startThumbRelease",this.__timingRangeSelector_startThumbRelease);
			_loc1_.addEventListener("endThumbPress",this.__timingRangeSelector_endThumbPress);
			_loc1_.addEventListener("endThumbRelease",this.__timingRangeSelector_endThumbRelease);
			_loc1_.addEventListener("change",this.__timingRangeSelector_change);
			_loc1_.id = "timingRangeSelector";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.timingRangeSelector = _loc1_;
			BindingManager.executeBindings(this,"timingRangeSelector",this.timingRangeSelector);
			return _loc1_;
		}
		
		public function __timingRangeSelector_startThumbPress(param1:Event) : void
		{
			this.onRangeSelectorThumbPress(param1);
		}
		
		public function __timingRangeSelector_startThumbRelease(param1:Event) : void
		{
			this.onRangeSelectorThumbRelease(param1);
		}
		
		public function __timingRangeSelector_endThumbPress(param1:Event) : void
		{
			this.onRangeSelectorThumbPress(param1);
		}
		
		public function __timingRangeSelector_endThumbRelease(param1:Event) : void
		{
			this.onRangeSelectorThumbRelease(param1);
		}
		
		public function __timingRangeSelector_change(param1:Event) : void
		{
			this.onTimingRangeSelectorChange(param1);
		}
		
		private function _EffectControlsItemRenderer_Line2_c() : Line
		{
			var _loc1_:Line = new Line();
			_loc1_.percentHeight = 80;
			_loc1_.stroke = this._EffectControlsItemRenderer_SolidColorStroke3_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _EffectControlsItemRenderer_SolidColorStroke3_c() : SolidColorStroke
		{
			var _loc1_:SolidColorStroke = new SolidColorStroke();
			_loc1_.color = 14540253;
			return _loc1_;
		}
		
		private function _EffectControlsItemRenderer_Group1_c() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.percentWidth = 100;
			_loc1_.mxmlContent = [this._EffectControlsItemRenderer_IconButton1_c()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _EffectControlsItemRenderer_IconButton1_c() : IconButton
		{
			var _loc1_:IconButton = new IconButton();
			_loc1_.horizontalCenter = 0;
			_loc1_.setStyle("icon",this._embed_mxml__styles_images_panel_fx_delete_png_1136997623);
			_loc1_.setStyle("iconOver",this._embed_mxml__styles_images_panel_fx_delete_png_1136997623);
			_loc1_.addEventListener("click",this.___EffectControlsItemRenderer_IconButton1_click);
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		public function ___EffectControlsItemRenderer_IconButton1_click(param1:MouseEvent) : void
		{
			this.onDelEffect();
		}
		
		private function _EffectControlsItemRenderer_bindingsSetup() : Array
		{
			var result:Array = [];
			result[0] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.toDisplay("go","Timing:");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_EffectControlsItemRenderer_Label1.text");
			return result;
		}
		
		[Bindable(event="propertyChange")]
		public function get imageDisplay() : EffectThumbSparkImage
		{
			return this._2024940825imageDisplay;
		}
		
		public function set imageDisplay(param1:EffectThumbSparkImage) : void
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
		public function get timingRangeSelector() : RangeSelector
		{
			return this._2001826798timingRangeSelector;
		}
		
		public function set timingRangeSelector(param1:RangeSelector) : void
		{
			var _loc2_:Object = this._2001826798timingRangeSelector;
			if(_loc2_ !== param1)
			{
				this._2001826798timingRangeSelector = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"timingRangeSelector",_loc2_,param1));
				}
			}
		}
	}
}
