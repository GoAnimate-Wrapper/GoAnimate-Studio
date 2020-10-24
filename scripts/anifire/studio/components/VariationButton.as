package anifire.studio.components
{
	import anifire.util.UtilDict;
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
	import mx.states.AddItems;
	import mx.states.State;
	import spark.components.Group;
	import spark.components.Image;
	
	use namespace mx_internal;
	
	public class VariationButton extends Group implements IBindingClient, IStateClient2
	{
		
		private static const HORIZONTAL_PADDING:Number = 14;
		
		private static const VERTICAL_PADDING:Number = 2;
		
		private static const LABEL_SEE_VARIATION:String = "See variations";
		
		private static var _watcherSetupUtil:IWatcherSetupUtil2;
		 
		
		public var _VariationButton_Image1:Image;
		
		public var _VariationButton_Image2:Image;
		
		public var _VariationButton_Image3:Image;
		
		public var _VariationButton_PopUpAnchor1:spark.components.PopUpAnchor;
		
		private var _1284010086arrowToolTip:ArrowToolTipGroup;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		protected var _previewOnly:Boolean;
		
		private var _embed_mxml__styles_images_tray_icon_version_disabled_png_2004487551:Class;
		
		private var _embed_mxml__styles_images_tray_icon_version_init_png_1239704201:Class;
		
		private var _embed_mxml__styles_images_tray_icon_version_over_png_1725422081:Class;
		
		mx_internal var _bindings:Array;
		
		mx_internal var _watchers:Array;
		
		mx_internal var _bindingsByDestination:Object;
		
		mx_internal var _bindingsBeginWithWord:Object;
		
		public function VariationButton()
		{
			var bindings:Array = null;
			var target:Object = null;
			var watcherSetupUtilClass:Object = null;
			this._embed_mxml__styles_images_tray_icon_version_disabled_png_2004487551 = VariationButton__embed_mxml__styles_images_tray_icon_version_disabled_png_2004487551;
			this._embed_mxml__styles_images_tray_icon_version_init_png_1239704201 = VariationButton__embed_mxml__styles_images_tray_icon_version_init_png_1239704201;
			this._embed_mxml__styles_images_tray_icon_version_over_png_1725422081 = VariationButton__embed_mxml__styles_images_tray_icon_version_over_png_1725422081;
			this._bindings = [];
			this._watchers = [];
			this._bindingsByDestination = {};
			this._bindingsBeginWithWord = {};
			super();
			mx_internal::_document = this;
			bindings = this._VariationButton_bindingsSetup();
			var watchers:Array = [];
			target = this;
			if(_watcherSetupUtil == null)
			{
				watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_VariationButtonWatcherSetupUtil");
				watcherSetupUtilClass["init"](null);
			}
			_watcherSetupUtil.setup(this,function(param1:String):*
			{
				return target[param1];
			},function(param1:String):*
			{
				return VariationButton[param1];
			},bindings,watchers);
			mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
			mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
			this.buttonMode = true;
			this.useHandCursor = true;
			this.mxmlContent = [];
			this.currentState = "normal";
			this.addEventListener("rollOver",this.___VariationButton_Group1_rollOver);
			this.addEventListener("rollOut",this.___VariationButton_Group1_rollOut);
			this.addEventListener("mouseUp",this.___VariationButton_Group1_mouseUp);
			this.addEventListener("mouseDown",this.___VariationButton_Group1_mouseDown);
			var _VariationButton_Image1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._VariationButton_Image1_i);
			var _VariationButton_Image2_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._VariationButton_Image2_i);
			var _VariationButton_Image3_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._VariationButton_Image3_i);
			var _VariationButton_PopUpAnchor1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._VariationButton_PopUpAnchor1_i);
			states = [new State({
				"name":"normal",
				"overrides":[new AddItems().initializeFromObject({
					"itemsFactory":_VariationButton_Image1_factory,
					"destination":null,
					"propertyName":"mxmlContent",
					"position":"first"
				})]
			}),new State({
				"name":"hover",
				"overrides":[new AddItems().initializeFromObject({
					"itemsFactory":_VariationButton_PopUpAnchor1_factory,
					"destination":null,
					"propertyName":"mxmlContent",
					"position":"first"
				}),new AddItems().initializeFromObject({
					"itemsFactory":_VariationButton_Image2_factory,
					"destination":null,
					"propertyName":"mxmlContent",
					"position":"first"
				})]
			}),new State({
				"name":"preview",
				"overrides":[new AddItems().initializeFromObject({
					"itemsFactory":_VariationButton_Image3_factory,
					"destination":null,
					"propertyName":"mxmlContent",
					"position":"first"
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
			VariationButton._watcherSetupUtil = param1;
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
		
		[Bindable(event="propertyChange")]
		public function get previewOnly() : Boolean
		{
			return this._previewOnly;
		}
		
		private function set _1291365484previewOnly(param1:Boolean) : void
		{
			this._previewOnly = param1;
			this.updateIcon();
		}
		
		protected function mouseOverHandler(param1:MouseEvent) : void
		{
			this.currentState = "hover";
		}
		
		protected function mouseOutHandler(param1:MouseEvent) : void
		{
			this.updateIcon();
		}
		
		protected function mouseUpHandler(param1:MouseEvent) : void
		{
			param1.stopImmediatePropagation();
		}
		
		protected function updateIcon() : void
		{
			if(this.previewOnly)
			{
				this.currentState = "preview";
			}
			else
			{
				this.currentState = "normal";
			}
		}
		
		protected function mouseDownHandler(param1:MouseEvent) : void
		{
			param1.stopImmediatePropagation();
		}
		
		private function _VariationButton_Image1_i() : Image
		{
			var _loc1_:Image = new Image();
			_loc1_.width = 28;
			_loc1_.height = 14;
			_loc1_.source = this._embed_mxml__styles_images_tray_icon_version_init_png_1239704201;
			_loc1_.id = "_VariationButton_Image1";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._VariationButton_Image1 = _loc1_;
			BindingManager.executeBindings(this,"_VariationButton_Image1",this._VariationButton_Image1);
			return _loc1_;
		}
		
		private function _VariationButton_Image2_i() : Image
		{
			var _loc1_:Image = new Image();
			_loc1_.width = 28;
			_loc1_.height = 14;
			_loc1_.source = this._embed_mxml__styles_images_tray_icon_version_over_png_1725422081;
			_loc1_.id = "_VariationButton_Image2";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._VariationButton_Image2 = _loc1_;
			BindingManager.executeBindings(this,"_VariationButton_Image2",this._VariationButton_Image2);
			return _loc1_;
		}
		
		private function _VariationButton_Image3_i() : Image
		{
			var _loc1_:Image = new Image();
			_loc1_.width = 28;
			_loc1_.height = 14;
			_loc1_.source = this._embed_mxml__styles_images_tray_icon_version_disabled_png_2004487551;
			_loc1_.id = "_VariationButton_Image3";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._VariationButton_Image3 = _loc1_;
			BindingManager.executeBindings(this,"_VariationButton_Image3",this._VariationButton_Image3);
			return _loc1_;
		}
		
		private function _VariationButton_PopUpAnchor1_i() : spark.components.PopUpAnchor
		{
			var _loc1_:spark.components.PopUpAnchor = new spark.components.PopUpAnchor();
			_loc1_.bottom = 0;
			_loc1_.displayPopUp = true;
			_loc1_.popUpWidthMatchesAnchorWidth = true;
			_loc1_.popUpHeightMatchesAnchorHeight = true;
			_loc1_.popUp = this._VariationButton_Group2_c();
			_loc1_.id = "_VariationButton_PopUpAnchor1";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._VariationButton_PopUpAnchor1 = _loc1_;
			BindingManager.executeBindings(this,"_VariationButton_PopUpAnchor1",this._VariationButton_PopUpAnchor1);
			return _loc1_;
		}
		
		private function _VariationButton_Group2_c() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.percentHeight = 100;
			_loc1_.mxmlContent = [this._VariationButton_ArrowToolTipGroup1_i()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _VariationButton_ArrowToolTipGroup1_i() : ArrowToolTipGroup
		{
			var _loc1_:ArrowToolTipGroup = new ArrowToolTipGroup();
			_loc1_.arrowDirection = "down";
			_loc1_.verticalCenter = 0;
			_loc1_.horizontalCenter = 0;
			_loc1_.id = "arrowToolTip";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.arrowToolTip = _loc1_;
			BindingManager.executeBindings(this,"arrowToolTip",this.arrowToolTip);
			return _loc1_;
		}
		
		public function ___VariationButton_Group1_rollOver(param1:MouseEvent) : void
		{
			this.mouseOverHandler(param1);
		}
		
		public function ___VariationButton_Group1_rollOut(param1:MouseEvent) : void
		{
			this.mouseOutHandler(param1);
		}
		
		public function ___VariationButton_Group1_mouseUp(param1:MouseEvent) : void
		{
			this.mouseUpHandler(param1);
		}
		
		public function ___VariationButton_Group1_mouseDown(param1:MouseEvent) : void
		{
			this.mouseDownHandler(param1);
		}
		
		private function _VariationButton_bindingsSetup() : Array
		{
			var result:Array = [];
			result[0] = new Binding(this,function():Object
			{
				return HORIZONTAL_PADDING;
			},null,"_VariationButton_PopUpAnchor1.left");
			result[1] = new Binding(this,function():Object
			{
				return -arrowToolTip.height - VERTICAL_PADDING;
			},null,"_VariationButton_PopUpAnchor1.top");
			result[2] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate(LABEL_SEE_VARIATION);
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"arrowToolTip.label");
			return result;
		}
		
		[Bindable(event="propertyChange")]
		public function get arrowToolTip() : ArrowToolTipGroup
		{
			return this._1284010086arrowToolTip;
		}
		
		public function set arrowToolTip(param1:ArrowToolTipGroup) : void
		{
			var _loc2_:Object = this._1284010086arrowToolTip;
			if(_loc2_ !== param1)
			{
				this._1284010086arrowToolTip = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"arrowToolTip",_loc2_,param1));
				}
			}
		}
		
		public function set previewOnly(param1:Boolean) : void
		{
			var _loc2_:Object = this.previewOnly;
			if(_loc2_ !== param1)
			{
				this._1291365484previewOnly = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"previewOnly",_loc2_,param1));
				}
			}
		}
	}
}
