package anifire.studio.components
{
	import flash.utils.getDefinitionByName;
	import mx.binding.Binding;
	import mx.binding.BindingManager;
	import mx.binding.IBindingClient;
	import mx.binding.IWatcherSetupUtil2;
	import mx.core.IFlexModuleFactory;
	import mx.core.mx_internal;
	import mx.events.PropertyChangeEvent;
	import mx.graphics.SolidColor;
	import mx.graphics.SolidColorStroke;
	import spark.components.Group;
	import spark.primitives.BitmapImage;
	import spark.primitives.Rect;
	
	use namespace mx_internal;
	
	public class ColorDisplayGroup extends Group implements IBindingClient
	{
		
		private static var _watcherSetupUtil:IWatcherSetupUtil2;
		 
		
		public var _ColorDisplayGroup_BitmapImage1:BitmapImage;
		
		private var _358089761colorDisplay:SolidColor;
		
		private var _1442907498currentColor:Rect;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		protected var _color:uint;
		
		private var _embed_mxml__styles_images_panel_text_nocolor_png_1640861249:Class;
		
		mx_internal var _bindings:Array;
		
		mx_internal var _watchers:Array;
		
		mx_internal var _bindingsByDestination:Object;
		
		mx_internal var _bindingsBeginWithWord:Object;
		
		public function ColorDisplayGroup()
		{
			var target:Object = null;
			var watcherSetupUtilClass:Object = null;
			this._embed_mxml__styles_images_panel_text_nocolor_png_1640861249 = ColorDisplayGroup__embed_mxml__styles_images_panel_text_nocolor_png_1640861249;
			this._bindings = [];
			this._watchers = [];
			this._bindingsByDestination = {};
			this._bindingsBeginWithWord = {};
			super();
			mx_internal::_document = this;
			var bindings:Array = this._ColorDisplayGroup_bindingsSetup();
			var watchers:Array = [];
			target = this;
			if(_watcherSetupUtil == null)
			{
				watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_ColorDisplayGroupWatcherSetupUtil");
				watcherSetupUtilClass["init"](null);
			}
			_watcherSetupUtil.setup(this,function(param1:String):*
			{
				return target[param1];
			},function(param1:String):*
			{
				return ColorDisplayGroup[param1];
			},bindings,watchers);
			mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
			mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
			this.width = 20;
			this.height = 20;
			this.mxmlContent = [this._ColorDisplayGroup_Rect1_i(),this._ColorDisplayGroup_BitmapImage1_i()];
			var i:uint = 0;
			while(i < bindings.length)
			{
				Binding(bindings[i]).execute();
				i++;
			}
		}
		
		public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
		{
			ColorDisplayGroup._watcherSetupUtil = param1;
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
		
		private function set _94842723color(param1:uint) : void
		{
			if(this._color != param1)
			{
				this._color = param1;
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get color() : uint
		{
			return this._color;
		}
		
		private function _ColorDisplayGroup_Rect1_i() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.fill = this._ColorDisplayGroup_SolidColor1_i();
			_loc1_.stroke = this._ColorDisplayGroup_SolidColorStroke1_c();
			_loc1_.initialized(this,"currentColor");
			this.currentColor = _loc1_;
			BindingManager.executeBindings(this,"currentColor",this.currentColor);
			return _loc1_;
		}
		
		private function _ColorDisplayGroup_SolidColor1_i() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			this.colorDisplay = _loc1_;
			BindingManager.executeBindings(this,"colorDisplay",this.colorDisplay);
			return _loc1_;
		}
		
		private function _ColorDisplayGroup_SolidColorStroke1_c() : SolidColorStroke
		{
			var _loc1_:SolidColorStroke = new SolidColorStroke();
			_loc1_.color = 13421772;
			return _loc1_;
		}
		
		private function _ColorDisplayGroup_BitmapImage1_i() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.source = this._embed_mxml__styles_images_panel_text_nocolor_png_1640861249;
			_loc1_.initialized(this,"_ColorDisplayGroup_BitmapImage1");
			this._ColorDisplayGroup_BitmapImage1 = _loc1_;
			BindingManager.executeBindings(this,"_ColorDisplayGroup_BitmapImage1",this._ColorDisplayGroup_BitmapImage1);
			return _loc1_;
		}
		
		private function _ColorDisplayGroup_bindingsSetup() : Array
		{
			var result:Array = [];
			result[0] = new Binding(this,null,null,"colorDisplay.color","color");
			result[1] = new Binding(this,function():Boolean
			{
				return color == uint.MAX_VALUE;
			},null,"_ColorDisplayGroup_BitmapImage1.visible");
			return result;
		}
		
		[Bindable(event="propertyChange")]
		public function get colorDisplay() : SolidColor
		{
			return this._358089761colorDisplay;
		}
		
		public function set colorDisplay(param1:SolidColor) : void
		{
			var _loc2_:Object = this._358089761colorDisplay;
			if(_loc2_ !== param1)
			{
				this._358089761colorDisplay = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"colorDisplay",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get currentColor() : Rect
		{
			return this._1442907498currentColor;
		}
		
		public function set currentColor(param1:Rect) : void
		{
			var _loc2_:Object = this._1442907498currentColor;
			if(_loc2_ !== param1)
			{
				this._1442907498currentColor = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"currentColor",_loc2_,param1));
				}
			}
		}
		
		public function set color(param1:uint) : void
		{
			var _loc2_:Object = this.color;
			if(_loc2_ !== param1)
			{
				this._94842723color = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"color",_loc2_,param1));
				}
			}
		}
	}
}
