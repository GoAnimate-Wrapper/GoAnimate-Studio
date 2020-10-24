package anifire.studio.components
{
	import anifire.studio.events.StageControlEvent;
	import anifire.studio.skins.TooltipIconButtonSkin;
	import anifire.util.UtilDict;
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
	import mx.states.SetProperty;
	import mx.states.State;
	import spark.components.Group;
	import spark.components.HGroup;
	import spark.components.HSlider;
	import spark.formatters.NumberFormatter;
	
	use namespace mx_internal;
	
	public class StageControlPanel extends Group implements IBindingClient, IStateClient2
	{
		
		private static var _watcherSetupUtil:IWatcherSetupUtil2;
		 
		
		private var _1143747871_StageControlPanel_HGroup1:HGroup;
		
		private var _312699062closeButton:IconButton;
		
		private var _206441020fitToStageButton:IconButton;
		
		private var _137111012openButton:IconButton;
		
		private var _1931449851percentFormatter:NumberFormatter;
		
		private var _652534124zoomSlider:HSlider;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		private var _embed_mxml__styles_images_stage_fittoscreen_on_png_1989028343:Class;
		
		private var _embed_mxml__styles_images_stage_fittoscreen_hover_png_2014408329:Class;
		
		private var _embed_mxml__styles_images_stage_zoom_hover_png_540223489:Class;
		
		private var _embed_mxml__styles_images_stage_zoom_collapse_png_1921954497:Class;
		
		private var _embed_mxml__styles_images_stage_zoom_expand_on_png_110013119:Class;
		
		private var _embed_mxml__styles_images_stage_zoom_expand_hover_png_2011076617:Class;
		
		private var _embed_mxml__styles_images_stage_fittoscreen_off_png_248937023:Class;
		
		mx_internal var _bindings:Array;
		
		mx_internal var _watchers:Array;
		
		mx_internal var _bindingsByDestination:Object;
		
		mx_internal var _bindingsBeginWithWord:Object;
		
		public function StageControlPanel()
		{
			var bindings:Array = null;
			var target:Object = null;
			var watcherSetupUtilClass:Object = null;
			this._embed_mxml__styles_images_stage_fittoscreen_on_png_1989028343 = StageControlPanel__embed_mxml__styles_images_stage_fittoscreen_on_png_1989028343;
			this._embed_mxml__styles_images_stage_fittoscreen_hover_png_2014408329 = StageControlPanel__embed_mxml__styles_images_stage_fittoscreen_hover_png_2014408329;
			this._embed_mxml__styles_images_stage_zoom_hover_png_540223489 = StageControlPanel__embed_mxml__styles_images_stage_zoom_hover_png_540223489;
			this._embed_mxml__styles_images_stage_zoom_collapse_png_1921954497 = StageControlPanel__embed_mxml__styles_images_stage_zoom_collapse_png_1921954497;
			this._embed_mxml__styles_images_stage_zoom_expand_on_png_110013119 = StageControlPanel__embed_mxml__styles_images_stage_zoom_expand_on_png_110013119;
			this._embed_mxml__styles_images_stage_zoom_expand_hover_png_2011076617 = StageControlPanel__embed_mxml__styles_images_stage_zoom_expand_hover_png_2011076617;
			this._embed_mxml__styles_images_stage_fittoscreen_off_png_248937023 = StageControlPanel__embed_mxml__styles_images_stage_fittoscreen_off_png_248937023;
			this._bindings = [];
			this._watchers = [];
			this._bindingsByDestination = {};
			this._bindingsBeginWithWord = {};
			super();
			mx_internal::_document = this;
			bindings = this._StageControlPanel_bindingsSetup();
			var watchers:Array = [];
			target = this;
			if(_watcherSetupUtil == null)
			{
				watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_StageControlPanelWatcherSetupUtil");
				watcherSetupUtilClass["init"](null);
			}
			_watcherSetupUtil.setup(this,function(param1:String):*
			{
				return target[param1];
			},function(param1:String):*
			{
				return StageControlPanel[param1];
			},bindings,watchers);
			mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
			mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
			this.mxmlContent = [this._StageControlPanel_HGroup1_i(),this._StageControlPanel_IconButton3_i()];
			this.currentState = "closeState";
			this._StageControlPanel_NumberFormatter1_i();
			states = [new State({
				"name":"closeState",
				"overrides":[new SetProperty().initializeFromObject({
					"target":"openButton",
					"name":"visible",
					"value":true
				})]
			}),new State({
				"name":"openState",
				"overrides":[new SetProperty().initializeFromObject({
					"target":"_StageControlPanel_HGroup1",
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
			StageControlPanel._watcherSetupUtil = param1;
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
		
		private function zoomSlider_doubleClickHandler(param1:MouseEvent) : void
		{
			this.zoomSlider.value = 1;
			var _loc2_:StageControlEvent = new StageControlEvent(StageControlEvent.UPDATE_ZOOM);
			_loc2_.zoomValue = 1;
			dispatchEvent(_loc2_);
		}
		
		private function zoomSliderDataTip(param1:Number) : Object
		{
			return this.percentFormatter.format(param1 * 100) + " %";
		}
		
		private function zoomSlider_changeHandler(param1:Event) : void
		{
			var _loc2_:StageControlEvent = new StageControlEvent(StageControlEvent.UPDATE_ZOOM);
			_loc2_.zoomValue = this.zoomSlider.value;
			dispatchEvent(_loc2_);
		}
		
		protected function fitToStageButton_clickHandler(param1:MouseEvent) : void
		{
			var _loc2_:StageControlEvent = new StageControlEvent(StageControlEvent.FIT_TO_STAGE);
			dispatchEvent(_loc2_);
		}
		
		protected function openButton_clickHandler(param1:MouseEvent) : void
		{
			this.currentState = "openState";
		}
		
		protected function closeButton_clickHandler(param1:MouseEvent) : void
		{
			this.currentState = "closeState";
		}
		
		public function enableFitToStage() : void
		{
			this.fitToStageButton.enabled = true;
		}
		
		public function disableFitToStage() : void
		{
			this.fitToStageButton.enabled = false;
		}
		
		public function updateZoomSlider(param1:Number) : void
		{
			this.zoomSlider.value = param1;
		}
		
		private function _StageControlPanel_NumberFormatter1_i() : NumberFormatter
		{
			var _loc1_:NumberFormatter = new NumberFormatter();
			_loc1_.fractionalDigits = 0;
			_loc1_.initialized(this,"percentFormatter");
			this.percentFormatter = _loc1_;
			BindingManager.executeBindings(this,"percentFormatter",this.percentFormatter);
			return _loc1_;
		}
		
		private function _StageControlPanel_HGroup1_i() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.visible = false;
			_loc1_.mxmlContent = [this._StageControlPanel_IconButton1_i(),this._StageControlPanel_HSlider1_i(),this._StageControlPanel_IconButton2_i()];
			_loc1_.id = "_StageControlPanel_HGroup1";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._StageControlPanel_HGroup1 = _loc1_;
			BindingManager.executeBindings(this,"_StageControlPanel_HGroup1",this._StageControlPanel_HGroup1);
			return _loc1_;
		}
		
		private function _StageControlPanel_IconButton1_i() : IconButton
		{
			var _loc1_:IconButton = new IconButton();
			_loc1_.focusEnabled = false;
			_loc1_.setStyle("icon",this._embed_mxml__styles_images_stage_zoom_expand_on_png_110013119);
			_loc1_.setStyle("iconOver",this._embed_mxml__styles_images_stage_zoom_expand_hover_png_2011076617);
			_loc1_.addEventListener("click",this.__closeButton_click);
			_loc1_.id = "closeButton";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.closeButton = _loc1_;
			BindingManager.executeBindings(this,"closeButton",this.closeButton);
			return _loc1_;
		}
		
		public function __closeButton_click(param1:MouseEvent) : void
		{
			this.closeButton_clickHandler(param1);
		}
		
		private function _StageControlPanel_HSlider1_i() : HSlider
		{
			var _loc1_:HSlider = new HSlider();
			_loc1_.minimum = 0.5;
			_loc1_.maximum = 4;
			_loc1_.snapInterval = 0.05;
			_loc1_.value = 1;
			_loc1_.stepSize = 0.1;
			_loc1_.buttonMode = true;
			_loc1_.doubleClickEnabled = true;
			_loc1_.dataTipFormatFunction = this.zoomSliderDataTip;
			_loc1_.setStyle("liveDragging",true);
			_loc1_.addEventListener("change",this.__zoomSlider_change);
			_loc1_.addEventListener("doubleClick",this.__zoomSlider_doubleClick);
			_loc1_.id = "zoomSlider";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.zoomSlider = _loc1_;
			BindingManager.executeBindings(this,"zoomSlider",this.zoomSlider);
			return _loc1_;
		}
		
		public function __zoomSlider_change(param1:Event) : void
		{
			this.zoomSlider_changeHandler(param1);
		}
		
		public function __zoomSlider_doubleClick(param1:MouseEvent) : void
		{
			this.zoomSlider_doubleClickHandler(param1);
		}
		
		private function _StageControlPanel_IconButton2_i() : IconButton
		{
			var _loc1_:IconButton = new IconButton();
			_loc1_.focusEnabled = false;
			_loc1_.setStyle("icon",this._embed_mxml__styles_images_stage_fittoscreen_on_png_1989028343);
			_loc1_.setStyle("iconOver",this._embed_mxml__styles_images_stage_fittoscreen_hover_png_2014408329);
			_loc1_.setStyle("iconDisabled",this._embed_mxml__styles_images_stage_fittoscreen_off_png_248937023);
			_loc1_.setStyle("skinClass",TooltipIconButtonSkin);
			_loc1_.addEventListener("click",this.__fitToStageButton_click);
			_loc1_.id = "fitToStageButton";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.fitToStageButton = _loc1_;
			BindingManager.executeBindings(this,"fitToStageButton",this.fitToStageButton);
			return _loc1_;
		}
		
		public function __fitToStageButton_click(param1:MouseEvent) : void
		{
			this.fitToStageButton_clickHandler(param1);
		}
		
		private function _StageControlPanel_IconButton3_i() : IconButton
		{
			var _loc1_:IconButton = new IconButton();
			_loc1_.focusEnabled = false;
			_loc1_.visible = false;
			_loc1_.setStyle("icon",this._embed_mxml__styles_images_stage_zoom_collapse_png_1921954497);
			_loc1_.setStyle("iconOver",this._embed_mxml__styles_images_stage_zoom_hover_png_540223489);
			_loc1_.setStyle("skinClass",TooltipIconButtonSkin);
			_loc1_.addEventListener("click",this.__openButton_click);
			_loc1_.id = "openButton";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.openButton = _loc1_;
			BindingManager.executeBindings(this,"openButton",this.openButton);
			return _loc1_;
		}
		
		public function __openButton_click(param1:MouseEvent) : void
		{
			this.openButton_clickHandler(param1);
		}
		
		private function _StageControlPanel_bindingsSetup() : Array
		{
			var result:Array = [];
			result[0] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("Fit to Screen");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"fitToStageButton.label");
			result[1] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("Zoom");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"openButton.label");
			return result;
		}
		
		[Bindable(event="propertyChange")]
		public function get _StageControlPanel_HGroup1() : HGroup
		{
			return this._1143747871_StageControlPanel_HGroup1;
		}
		
		public function set _StageControlPanel_HGroup1(param1:HGroup) : void
		{
			var _loc2_:Object = this._1143747871_StageControlPanel_HGroup1;
			if(_loc2_ !== param1)
			{
				this._1143747871_StageControlPanel_HGroup1 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_StageControlPanel_HGroup1",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get closeButton() : IconButton
		{
			return this._312699062closeButton;
		}
		
		public function set closeButton(param1:IconButton) : void
		{
			var _loc2_:Object = this._312699062closeButton;
			if(_loc2_ !== param1)
			{
				this._312699062closeButton = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"closeButton",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get fitToStageButton() : IconButton
		{
			return this._206441020fitToStageButton;
		}
		
		public function set fitToStageButton(param1:IconButton) : void
		{
			var _loc2_:Object = this._206441020fitToStageButton;
			if(_loc2_ !== param1)
			{
				this._206441020fitToStageButton = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fitToStageButton",_loc2_,param1));
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
		public function get zoomSlider() : HSlider
		{
			return this._652534124zoomSlider;
		}
		
		public function set zoomSlider(param1:HSlider) : void
		{
			var _loc2_:Object = this._652534124zoomSlider;
			if(_loc2_ !== param1)
			{
				this._652534124zoomSlider = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"zoomSlider",_loc2_,param1));
				}
			}
		}
	}
}
