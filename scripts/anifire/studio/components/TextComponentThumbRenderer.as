package anifire.studio.components
{
	import anifire.studio.core.Thumb;
	import anifire.studio.managers.TextComponentManager;
	import anifire.studio.models.TextComponentThumb;
	import anifire.studio.models.ThumbModel;
	import anifire.util.UtilDict;
	import anifire.util.UtilUser;
	import flash.events.MouseEvent;
	import flash.utils.getDefinitionByName;
	import mx.binding.Binding;
	import mx.binding.BindingManager;
	import mx.binding.IBindingClient;
	import mx.binding.IWatcherSetupUtil2;
	import mx.core.DragSource;
	import mx.core.IFlexDisplayObject;
	import mx.core.IFlexModuleFactory;
	import mx.core.IStateClient2;
	import mx.core.UIComponent;
	import mx.core.mx_internal;
	import mx.events.FlexEvent;
	import mx.events.PropertyChangeEvent;
	import mx.graphics.SolidColor;
	import mx.graphics.SolidColorStroke;
	import mx.states.SetProperty;
	import mx.states.State;
	import spark.events.PopUpEvent;
	import spark.filters.DropShadowFilter;
	import spark.primitives.BitmapImage;
	import spark.primitives.Rect;
	
	use namespace mx_internal;
	
	public class TextComponentThumbRenderer extends ThumbRendererBase implements IBindingClient, IStateClient2
	{
		
		private static var _watcherSetupUtil:IWatcherSetupUtil2;
		 
		
		private var _606729903_TextComponentThumbRenderer_IconButton1:IconButton;
		
		private var _1919331761_TextComponentThumbRenderer_SetProperty1:SetProperty;
		
		private var _1919331762_TextComponentThumbRenderer_SetProperty2:SetProperty;
		
		private var _1589946826_TextComponentThumbRenderer_SolidColorStroke1:SolidColorStroke;
		
		private var _2024940825imageDisplay:BitmapImage;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		protected var _model:ThumbModel;
		
		protected var _thumb:TextComponentThumb;
		
		private var _52291435_allowDelete:Boolean;
		
		mx_internal var _bindings:Array;
		
		mx_internal var _watchers:Array;
		
		mx_internal var _bindingsByDestination:Object;
		
		mx_internal var _bindingsBeginWithWord:Object;
		
		public function TextComponentThumbRenderer()
		{
			var bindings:Array = null;
			var target:Object = null;
			var watcherSetupUtilClass:Object = null;
			this._bindings = [];
			this._watchers = [];
			this._bindingsByDestination = {};
			this._bindingsBeginWithWord = {};
			super();
			mx_internal::_document = this;
			bindings = this._TextComponentThumbRenderer_bindingsSetup();
			var watchers:Array = [];
			target = this;
			if(_watcherSetupUtil == null)
			{
				watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_TextComponentThumbRendererWatcherSetupUtil");
				watcherSetupUtilClass["init"](null);
			}
			_watcherSetupUtil.setup(this,function(param1:String):*
			{
				return target[param1];
			},function(param1:String):*
			{
				return TextComponentThumbRenderer[param1];
			},bindings,watchers);
			mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
			mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
			this.width = 135;
			this.height = 76;
			this.buttonMode = true;
			this.mxmlContent = [this._TextComponentThumbRenderer_Rect1_c(),this._TextComponentThumbRenderer_BitmapImage1_i(),this._TextComponentThumbRenderer_Rect2_c(),this._TextComponentThumbRenderer_IconButton1_i()];
			this.currentState = "normal";
			this.addEventListener("creationComplete",this.___TextComponentThumbRenderer_ThumbRendererBase1_creationComplete);
			states = [new State({
				"name":"normal",
				"overrides":[new SetProperty().initializeFromObject({
					"target":"_TextComponentThumbRenderer_SolidColorStroke1",
					"name":"alpha",
					"value":0
				})]
			}),new State({
				"name":"hovered",
				"overrides":[this._TextComponentThumbRenderer_SetProperty1 = SetProperty(new SetProperty().initializeFromObject({
					"target":"_TextComponentThumbRenderer_IconButton1",
					"name":"visible",
					"value":undefined
				}))]
			}),new State({
				"name":"selected",
				"overrides":[this._TextComponentThumbRenderer_SetProperty2 = SetProperty(new SetProperty().initializeFromObject({
					"target":"_TextComponentThumbRenderer_IconButton1",
					"name":"visible",
					"value":undefined
				}))]
			}),new State({
				"name":"dragging",
				"overrides":[]
			})];
			BindingManager.executeBindings(this,"_TextComponentThumbRenderer_SetProperty1",this._TextComponentThumbRenderer_SetProperty1);
			BindingManager.executeBindings(this,"_TextComponentThumbRenderer_SetProperty2",this._TextComponentThumbRenderer_SetProperty2);
			var i:uint = 0;
			while(i < bindings.length)
			{
				Binding(bindings[i]).execute();
				i++;
			}
		}
		
		public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
		{
			TextComponentThumbRenderer._watcherSetupUtil = param1;
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
			super.data = param1;
			this._model = param1 as ThumbModel;
			if(this._model)
			{
				this._thumb = this._model.thumb as TextComponentThumb;
			}
			else
			{
				this._thumb = null;
			}
			this.updateUI();
		}
		
		override protected function createDragProxy() : IFlexDisplayObject
		{
			_dragProxyImageAlpha = 0.8;
			var _loc1_:TextComponentThumbRenderer = new TextComponentThumbRenderer();
			_loc1_.data = this.data;
			_loc1_.rotation = 5;
			_loc1_.y = _loc1_.height / 2;
			_loc1_.mouseEnabled = false;
			_loc1_.mouseChildren = false;
			var _loc2_:DropShadowFilter = new DropShadowFilter();
			_loc2_.color = 0;
			_loc2_.distance = 2;
			_loc2_.angle = 70;
			_loc2_.alpha = 0.5;
			_loc1_.filters = [_loc2_];
			return _loc1_;
		}
		
		override protected function createDragSource(param1:IFlexDisplayObject, param2:MouseEvent) : DragSource
		{
			var _loc3_:DragSource = new DragSource();
			_loc3_.addData(this._thumb,Thumb.DRAG_DATA_FORMAT);
			return _loc3_;
		}
		
		protected function updateUI() : void
		{
			if(!this._thumb)
			{
				return;
			}
			_toolTipContent = this._thumb.name;
			this.imageDisplay.source = this._thumb.thumbnailUrl;
		}
		
		protected function deleteButton_mouseDownHandler(param1:MouseEvent) : void
		{
			param1.stopImmediatePropagation();
		}
		
		private function deleteButton_clickHandler(param1:MouseEvent) : void
		{
			param1.stopImmediatePropagation();
			this.showDeletePopUp();
		}
		
		protected function showDeletePopUp() : void
		{
			var _loc1_:ConfirmPopUp = new ConfirmPopUp();
			_loc1_.title = UtilDict.translate("Delete Text Component");
			_loc1_.message = UtilDict.translate("You will not be able to use this text component any more!");
			_loc1_.confirmText = UtilDict.translate("Delete");
			_loc1_.cancelText = UtilDict.translate("Cancel");
			_loc1_.addEventListener(PopUpEvent.CLOSE,this.deletePopUp_closeHandler);
			_loc1_.open(parentApplication as UIComponent,true);
		}
		
		protected function deletePopUp_closeHandler(param1:PopUpEvent) : void
		{
			if(param1.commit)
			{
				this.confirmDelete();
			}
		}
		
		private function confirmDelete() : void
		{
			if(!this._thumb)
			{
				return;
			}
			var _loc1_:TextComponentManager = TextComponentManager.instance;
			_loc1_.deleteTextComponent(this._thumb.id);
		}
		
		protected function creationCompleteHandler(param1:FlexEvent) : void
		{
			this._allowDelete = UtilUser.isContentAdmin;
		}
		
		private function _TextComponentThumbRenderer_Rect1_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.fill = this._TextComponentThumbRenderer_SolidColor1_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _TextComponentThumbRenderer_SolidColor1_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 15987700;
			return _loc1_;
		}
		
		private function _TextComponentThumbRenderer_BitmapImage1_i() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.percentWidth = 100;
			_loc1_.percentHeight = 100;
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.initialized(this,"imageDisplay");
			this.imageDisplay = _loc1_;
			BindingManager.executeBindings(this,"imageDisplay",this.imageDisplay);
			return _loc1_;
		}
		
		private function _TextComponentThumbRenderer_Rect2_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.stroke = this._TextComponentThumbRenderer_SolidColorStroke1_i();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _TextComponentThumbRenderer_SolidColorStroke1_i() : SolidColorStroke
		{
			var _loc1_:SolidColorStroke = new SolidColorStroke();
			_loc1_.color = 5093288;
			this._TextComponentThumbRenderer_SolidColorStroke1 = _loc1_;
			BindingManager.executeBindings(this,"_TextComponentThumbRenderer_SolidColorStroke1",this._TextComponentThumbRenderer_SolidColorStroke1);
			return _loc1_;
		}
		
		private function _TextComponentThumbRenderer_IconButton1_i() : IconButton
		{
			var _loc1_:IconButton = new IconButton();
			_loc1_.styleName = "deleteSmall";
			_loc1_.top = 4;
			_loc1_.left = 4;
			_loc1_.visible = false;
			_loc1_.addEventListener("click",this.___TextComponentThumbRenderer_IconButton1_click);
			_loc1_.addEventListener("mouseDown",this.___TextComponentThumbRenderer_IconButton1_mouseDown);
			_loc1_.id = "_TextComponentThumbRenderer_IconButton1";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._TextComponentThumbRenderer_IconButton1 = _loc1_;
			BindingManager.executeBindings(this,"_TextComponentThumbRenderer_IconButton1",this._TextComponentThumbRenderer_IconButton1);
			return _loc1_;
		}
		
		public function ___TextComponentThumbRenderer_IconButton1_click(param1:MouseEvent) : void
		{
			this.deleteButton_clickHandler(param1);
		}
		
		public function ___TextComponentThumbRenderer_IconButton1_mouseDown(param1:MouseEvent) : void
		{
			this.deleteButton_mouseDownHandler(param1);
		}
		
		public function ___TextComponentThumbRenderer_ThumbRendererBase1_creationComplete(param1:FlexEvent) : void
		{
			this.creationCompleteHandler(param1);
		}
		
		private function _TextComponentThumbRenderer_bindingsSetup() : Array
		{
			var result:Array = [];
			result[0] = new Binding(this,function():*
			{
				return _allowDelete;
			},null,"_TextComponentThumbRenderer_SetProperty1.value");
			result[1] = new Binding(this,function():*
			{
				return _allowDelete;
			},null,"_TextComponentThumbRenderer_SetProperty2.value");
			return result;
		}
		
		[Bindable(event="propertyChange")]
		public function get _TextComponentThumbRenderer_IconButton1() : IconButton
		{
			return this._606729903_TextComponentThumbRenderer_IconButton1;
		}
		
		public function set _TextComponentThumbRenderer_IconButton1(param1:IconButton) : void
		{
			var _loc2_:Object = this._606729903_TextComponentThumbRenderer_IconButton1;
			if(_loc2_ !== param1)
			{
				this._606729903_TextComponentThumbRenderer_IconButton1 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_TextComponentThumbRenderer_IconButton1",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _TextComponentThumbRenderer_SetProperty1() : SetProperty
		{
			return this._1919331761_TextComponentThumbRenderer_SetProperty1;
		}
		
		public function set _TextComponentThumbRenderer_SetProperty1(param1:SetProperty) : void
		{
			var _loc2_:Object = this._1919331761_TextComponentThumbRenderer_SetProperty1;
			if(_loc2_ !== param1)
			{
				this._1919331761_TextComponentThumbRenderer_SetProperty1 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_TextComponentThumbRenderer_SetProperty1",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _TextComponentThumbRenderer_SetProperty2() : SetProperty
		{
			return this._1919331762_TextComponentThumbRenderer_SetProperty2;
		}
		
		public function set _TextComponentThumbRenderer_SetProperty2(param1:SetProperty) : void
		{
			var _loc2_:Object = this._1919331762_TextComponentThumbRenderer_SetProperty2;
			if(_loc2_ !== param1)
			{
				this._1919331762_TextComponentThumbRenderer_SetProperty2 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_TextComponentThumbRenderer_SetProperty2",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _TextComponentThumbRenderer_SolidColorStroke1() : SolidColorStroke
		{
			return this._1589946826_TextComponentThumbRenderer_SolidColorStroke1;
		}
		
		public function set _TextComponentThumbRenderer_SolidColorStroke1(param1:SolidColorStroke) : void
		{
			var _loc2_:Object = this._1589946826_TextComponentThumbRenderer_SolidColorStroke1;
			if(_loc2_ !== param1)
			{
				this._1589946826_TextComponentThumbRenderer_SolidColorStroke1 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_TextComponentThumbRenderer_SolidColorStroke1",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get imageDisplay() : BitmapImage
		{
			return this._2024940825imageDisplay;
		}
		
		public function set imageDisplay(param1:BitmapImage) : void
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
		private function get _allowDelete() : Boolean
		{
			return this._52291435_allowDelete;
		}
		
		private function set _allowDelete(param1:Boolean) : void
		{
			var _loc2_:Object = this._52291435_allowDelete;
			if(_loc2_ !== param1)
			{
				this._52291435_allowDelete = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_allowDelete",_loc2_,param1));
				}
			}
		}
	}
}
