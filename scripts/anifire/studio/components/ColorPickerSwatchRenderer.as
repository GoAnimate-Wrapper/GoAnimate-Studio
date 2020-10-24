package anifire.studio.components
{
	import anifire.event.ColorPaletteEvent;
	import anifire.studio.managers.StudioDragManager;
	import anifire.studio.models.ColorPaletteItem;
	import anifire.util.UtilDict;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.utils.getDefinitionByName;
	import mx.binding.Binding;
	import mx.binding.BindingManager;
	import mx.binding.IBindingClient;
	import mx.binding.IWatcherSetupUtil2;
	import mx.core.DeferredInstanceFromFunction;
	import mx.core.DragSource;
	import mx.core.IFlexDisplayObject;
	import mx.core.IFlexModuleFactory;
	import mx.core.IStateClient2;
	import mx.core.mx_internal;
	import mx.events.FlexEvent;
	import mx.events.PropertyChangeEvent;
	import mx.graphics.SolidColor;
	import mx.graphics.SolidColorStroke;
	import mx.managers.DragManager;
	import mx.states.AddItems;
	import mx.states.SetProperty;
	import mx.states.State;
	import spark.components.Group;
	import spark.components.Label;
	import spark.components.supportClasses.ItemRenderer;
	import spark.filters.DropShadowFilter;
	import spark.primitives.BitmapImage;
	import spark.primitives.Ellipse;
	import spark.primitives.Path;
	import spark.primitives.Rect;
	
	use namespace mx_internal;
	
	public class ColorPickerSwatchRenderer extends ItemRenderer implements IBindingClient, IStateClient2
	{
		
		private static var _watcherSetupUtil:IWatcherSetupUtil2;
		 
		
		public var _ColorPickerSwatchRenderer_Ellipse2:Ellipse;
		
		public var _ColorPickerSwatchRenderer_Label1:Label;
		
		public var _ColorPickerSwatchRenderer_SolidColor1:SolidColor;
		
		private var _1117658388addColorButton:BitmapImage;
		
		private var _268453613popUpGroup:Group;
		
		private var _889711556swatch:Ellipse;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		protected var _isMouseDown:Boolean = false;
		
		protected var _dragSource:DragSource;
		
		protected var _dragProxy:IFlexDisplayObject;
		
		private var _embed_mxml__styles_images_icons_icon_add_png_848902145:Class;
		
		mx_internal var _bindings:Array;
		
		mx_internal var _watchers:Array;
		
		mx_internal var _bindingsByDestination:Object;
		
		mx_internal var _bindingsBeginWithWord:Object;
		
		public function ColorPickerSwatchRenderer()
		{
			var bindings:Array = null;
			var target:Object = null;
			var watcherSetupUtilClass:Object = null;
			this._embed_mxml__styles_images_icons_icon_add_png_848902145 = ColorPickerSwatchRenderer__embed_mxml__styles_images_icons_icon_add_png_848902145;
			this._bindings = [];
			this._watchers = [];
			this._bindingsByDestination = {};
			this._bindingsBeginWithWord = {};
			super();
			mx_internal::_document = this;
			bindings = this._ColorPickerSwatchRenderer_bindingsSetup();
			var watchers:Array = [];
			target = this;
			if(_watcherSetupUtil == null)
			{
				watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_ColorPickerSwatchRendererWatcherSetupUtil");
				watcherSetupUtilClass["init"](null);
			}
			_watcherSetupUtil.setup(this,function(param1:String):*
			{
				return target[param1];
			},function(param1:String):*
			{
				return ColorPickerSwatchRenderer[param1];
			},bindings,watchers);
			mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
			mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
			this.autoDrawBackground = false;
			this.buttonMode = true;
			this.width = 28;
			this.height = 28;
			this.mxmlContent = [this._ColorPickerSwatchRenderer_Ellipse1_i(),this._ColorPickerSwatchRenderer_Group1_i(),this._ColorPickerSwatchRenderer_BitmapImage1_i()];
			this.currentState = "normal";
			this.addEventListener("mouseDown",this.___ColorPickerSwatchRenderer_ItemRenderer1_mouseDown);
			this.addEventListener("mouseMove",this.___ColorPickerSwatchRenderer_ItemRenderer1_mouseMove);
			this.addEventListener("mouseUp",this.___ColorPickerSwatchRenderer_ItemRenderer1_mouseUp);
			this.addEventListener("click",this.___ColorPickerSwatchRenderer_ItemRenderer1_click);
			this.addEventListener("creationComplete",this.___ColorPickerSwatchRenderer_ItemRenderer1_creationComplete);
			var _ColorPickerSwatchRenderer_Ellipse2_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._ColorPickerSwatchRenderer_Ellipse2_i);
			states = [new State({
				"name":"normal",
				"overrides":[]
			}),new State({
				"name":"hovered",
				"overrides":[]
			}),new State({
				"name":"selected",
				"overrides":[new AddItems().initializeFromObject({
					"itemsFactory":_ColorPickerSwatchRenderer_Ellipse2_factory,
					"destination":null,
					"propertyName":"mxmlContent",
					"position":"after",
					"relativeTo":["swatch"]
				})]
			}),new State({
				"name":"dragging",
				"overrides":[new SetProperty().initializeFromObject({
					"target":"swatch",
					"name":"alpha",
					"value":0.5
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
			ColorPickerSwatchRenderer._watcherSetupUtil = param1;
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
		
		protected function init() : void
		{
			this.popUpGroup.x = this.swatch.width / 2 - this.popUpGroup.width / 2 + 2;
			this.popUpGroup.y = -3;
		}
		
		protected function shouldStartDrag(param1:MouseEvent) : Boolean
		{
			return !data.isAddColorButton;
		}
		
		protected function createDragProxy() : IFlexDisplayObject
		{
			var _loc1_:ColorPickerSwatchRenderer = new ColorPickerSwatchRenderer();
			_loc1_.dragging = true;
			_loc1_.data = data;
			return _loc1_;
		}
		
		protected function clearDrag() : void
		{
			this._dragProxy = null;
			this._dragSource = null;
			this._isMouseDown = false;
		}
		
		protected function createDragSource(param1:IFlexDisplayObject, param2:MouseEvent) : DragSource
		{
			var _loc3_:DragSource = new DragSource();
			_loc3_.addData(param1,StudioDragManager.DRAG_IMAGE);
			_loc3_.addData(data.color,StudioDragManager.DRAG_FORMAT_COLOR_SWATCH_REMOVE);
			return _loc3_;
		}
		
		private function mouseDownHandler(param1:MouseEvent) : void
		{
			param1.stopImmediatePropagation();
			if(this.shouldStartDrag(param1))
			{
				StudioDragManager.startRemoveColor();
				this._dragProxy = this.createDragProxy();
				this._dragSource = this.createDragSource(this._dragProxy,param1);
				this._dragProxy.addEventListener(ColorPaletteEvent.COLOR_PICKER_DROP,this.dragProxy_droppedHandler);
				this._isMouseDown = true;
			}
		}
		
		private function dragProxy_droppedHandler(param1:ColorPaletteEvent) : void
		{
			var _loc2_:ColorPaletteEvent = new ColorPaletteEvent(ColorPaletteEvent.COLOR_PICKER_DROP);
			if(param1.releasePoint)
			{
				_loc2_.releasePoint = param1.releasePoint.clone();
				_loc2_.colorCode = param1.colorCode;
			}
			this.dispatchEvent(_loc2_);
		}
		
		private function mouseMoveHandler(param1:MouseEvent) : void
		{
			if(this._isMouseDown && this._dragSource)
			{
				DragManager.doDrag(this,this._dragSource,param1,this._dragProxy,this._dragProxy.width * 0.5 - param1.localX,this._dragProxy.height * 0.5 - param1.localY,1);
			}
		}
		
		private function mouseUpHandler(param1:MouseEvent) : void
		{
			var _loc2_:ColorPaletteEvent = null;
			if(dragging)
			{
				_loc2_ = new ColorPaletteEvent(ColorPaletteEvent.COLOR_PICKER_DROP);
				_loc2_.releasePoint = new Point(param1.stageX,param1.stageY);
				_loc2_.colorCode = data.color;
				this.clearDrag();
				dispatchEvent(_loc2_);
				StudioDragManager.finishRemoveColor();
			}
		}
		
		private function clickHandler(param1:MouseEvent) : void
		{
			var _loc2_:ColorPaletteEvent = null;
			if(data.isAddColorButton)
			{
				param1.stopImmediatePropagation();
				_loc2_ = new ColorPaletteEvent(ColorPaletteEvent.ADD_COLOR_BUTTON_CLICK);
				data.isAddColorButton = false;
			}
			else
			{
				_loc2_ = new ColorPaletteEvent(ColorPaletteEvent.SWATCH_PICK);
				_loc2_.colorCode = (data as ColorPaletteItem).color;
			}
			dispatchEvent(_loc2_);
		}
		
		public function showTips() : void
		{
			this.popUpGroup.visible = true;
		}
		
		public function hideTips() : void
		{
			this.popUpGroup.visible = false;
		}
		
		private function _ColorPickerSwatchRenderer_Ellipse1_i() : Ellipse
		{
			var _loc1_:Ellipse = new Ellipse();
			_loc1_.width = 28;
			_loc1_.height = 28;
			_loc1_.fill = this._ColorPickerSwatchRenderer_SolidColor1_i();
			_loc1_.stroke = this._ColorPickerSwatchRenderer_SolidColorStroke1_c();
			_loc1_.filters = [this._ColorPickerSwatchRenderer_DropShadowFilter1_c()];
			_loc1_.initialized(this,"swatch");
			this.swatch = _loc1_;
			BindingManager.executeBindings(this,"swatch",this.swatch);
			return _loc1_;
		}
		
		private function _ColorPickerSwatchRenderer_SolidColor1_i() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			this._ColorPickerSwatchRenderer_SolidColor1 = _loc1_;
			BindingManager.executeBindings(this,"_ColorPickerSwatchRenderer_SolidColor1",this._ColorPickerSwatchRenderer_SolidColor1);
			return _loc1_;
		}
		
		private function _ColorPickerSwatchRenderer_SolidColorStroke1_c() : SolidColorStroke
		{
			var _loc1_:SolidColorStroke = new SolidColorStroke();
			_loc1_.color = 14803430;
			return _loc1_;
		}
		
		private function _ColorPickerSwatchRenderer_DropShadowFilter1_c() : DropShadowFilter
		{
			var _loc1_:DropShadowFilter = new DropShadowFilter();
			_loc1_.color = 0;
			_loc1_.alpha = 0.15;
			_loc1_.distance = 3;
			_loc1_.inner = true;
			_loc1_.angle = 90;
			return _loc1_;
		}
		
		private function _ColorPickerSwatchRenderer_Ellipse2_i() : Ellipse
		{
			var _loc1_:Ellipse = new Ellipse();
			_loc1_.width = 32;
			_loc1_.height = 32;
			_loc1_.verticalCenter = 0;
			_loc1_.horizontalCenter = 0;
			_loc1_.stroke = this._ColorPickerSwatchRenderer_SolidColorStroke2_c();
			_loc1_.initialized(this,"_ColorPickerSwatchRenderer_Ellipse2");
			this._ColorPickerSwatchRenderer_Ellipse2 = _loc1_;
			BindingManager.executeBindings(this,"_ColorPickerSwatchRenderer_Ellipse2",this._ColorPickerSwatchRenderer_Ellipse2);
			return _loc1_;
		}
		
		private function _ColorPickerSwatchRenderer_SolidColorStroke2_c() : SolidColorStroke
		{
			var _loc1_:SolidColorStroke = new SolidColorStroke();
			_loc1_.color = 4439206;
			_loc1_.weight = 2;
			return _loc1_;
		}
		
		private function _ColorPickerSwatchRenderer_Group1_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.visible = false;
			_loc1_.mouseEnabled = false;
			_loc1_.mouseChildren = false;
			_loc1_.blendMode = "layer";
			_loc1_.alpha = 0.9;
			_loc1_.includeInLayout = false;
			_loc1_.mxmlContent = [this._ColorPickerSwatchRenderer_Path1_c(),this._ColorPickerSwatchRenderer_Group2_c()];
			_loc1_.id = "popUpGroup";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.popUpGroup = _loc1_;
			BindingManager.executeBindings(this,"popUpGroup",this.popUpGroup);
			return _loc1_;
		}
		
		private function _ColorPickerSwatchRenderer_Path1_c() : Path
		{
			var _loc1_:Path = new Path();
			_loc1_.horizontalCenter = 0;
			_loc1_.data = "M 0 0 l 5 5 l 5 -5 Z";
			_loc1_.fill = this._ColorPickerSwatchRenderer_SolidColor2_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _ColorPickerSwatchRenderer_SolidColor2_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 2829099;
			return _loc1_;
		}
		
		private function _ColorPickerSwatchRenderer_Group2_c() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.minWidth = 30;
			_loc1_.horizontalCenter = 0;
			_loc1_.bottom = 0;
			_loc1_.mxmlContent = [this._ColorPickerSwatchRenderer_Rect1_c(),this._ColorPickerSwatchRenderer_Label1_i()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _ColorPickerSwatchRenderer_Rect1_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.fill = this._ColorPickerSwatchRenderer_SolidColor3_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _ColorPickerSwatchRenderer_SolidColor3_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 2829099;
			return _loc1_;
		}
		
		private function _ColorPickerSwatchRenderer_Label1_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.setStyle("color",16777215);
			_loc1_.setStyle("textAlign","center");
			_loc1_.setStyle("paddingLeft",10);
			_loc1_.setStyle("paddingRight",10);
			_loc1_.setStyle("paddingTop",5);
			_loc1_.setStyle("paddingBottom",5);
			_loc1_.id = "_ColorPickerSwatchRenderer_Label1";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._ColorPickerSwatchRenderer_Label1 = _loc1_;
			BindingManager.executeBindings(this,"_ColorPickerSwatchRenderer_Label1",this._ColorPickerSwatchRenderer_Label1);
			return _loc1_;
		}
		
		private function _ColorPickerSwatchRenderer_BitmapImage1_i() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.width = 16;
			_loc1_.height = 16;
			_loc1_.verticalCenter = 0;
			_loc1_.horizontalCenter = 0;
			_loc1_.source = this._embed_mxml__styles_images_icons_icon_add_png_848902145;
			_loc1_.initialized(this,"addColorButton");
			this.addColorButton = _loc1_;
			BindingManager.executeBindings(this,"addColorButton",this.addColorButton);
			return _loc1_;
		}
		
		public function ___ColorPickerSwatchRenderer_ItemRenderer1_mouseDown(param1:MouseEvent) : void
		{
			this.mouseDownHandler(param1);
		}
		
		public function ___ColorPickerSwatchRenderer_ItemRenderer1_mouseMove(param1:MouseEvent) : void
		{
			this.mouseMoveHandler(param1);
		}
		
		public function ___ColorPickerSwatchRenderer_ItemRenderer1_mouseUp(param1:MouseEvent) : void
		{
			this.mouseUpHandler(param1);
		}
		
		public function ___ColorPickerSwatchRenderer_ItemRenderer1_click(param1:MouseEvent) : void
		{
			this.clickHandler(param1);
		}
		
		public function ___ColorPickerSwatchRenderer_ItemRenderer1_creationComplete(param1:FlexEvent) : void
		{
			this.init();
		}
		
		private function _ColorPickerSwatchRenderer_bindingsSetup() : Array
		{
			var result:Array = [];
			result[0] = new Binding(this,function():Boolean
			{
				return !data.isAddColorButton;
			},null,"swatch.visible");
			result[1] = new Binding(this,function():Boolean
			{
				return !data.isAddColorButton;
			},null,"swatch.includeInLayout");
			result[2] = new Binding(this,function():uint
			{
				return data.color;
			},null,"_ColorPickerSwatchRenderer_SolidColor1.color");
			result[3] = new Binding(this,function():Boolean
			{
				return !data.isAddColorButton;
			},null,"_ColorPickerSwatchRenderer_Ellipse2.visible");
			result[4] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("Remove");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_ColorPickerSwatchRenderer_Label1.text");
			result[5] = new Binding(this,function():Boolean
			{
				return data.isAddColorButton;
			},null,"addColorButton.visible");
			result[6] = new Binding(this,function():Boolean
			{
				return data.isAddColorButton;
			},null,"addColorButton.includeInLayout");
			return result;
		}
		
		[Bindable(event="propertyChange")]
		public function get addColorButton() : BitmapImage
		{
			return this._1117658388addColorButton;
		}
		
		public function set addColorButton(param1:BitmapImage) : void
		{
			var _loc2_:Object = this._1117658388addColorButton;
			if(_loc2_ !== param1)
			{
				this._1117658388addColorButton = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"addColorButton",_loc2_,param1));
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
		public function get swatch() : Ellipse
		{
			return this._889711556swatch;
		}
		
		public function set swatch(param1:Ellipse) : void
		{
			var _loc2_:Object = this._889711556swatch;
			if(_loc2_ !== param1)
			{
				this._889711556swatch = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"swatch",_loc2_,param1));
				}
			}
		}
	}
}
