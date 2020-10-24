package anifire.studio.components
{
	import anifire.constant.AnimeConstants;
	import anifire.studio.core.BackgroundThumb;
	import anifire.studio.core.Console;
	import anifire.studio.core.Thumb;
	import anifire.util.UtilDict;
	import anifire.util.UtilDraw;
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
	import mx.events.DragEvent;
	import mx.events.FlexEvent;
	import mx.events.PropertyChangeEvent;
	import mx.graphics.SolidColor;
	import mx.graphics.SolidColorStroke;
	import mx.managers.DragManager;
	import mx.states.AddItems;
	import mx.states.SetProperty;
	import mx.states.State;
	import spark.components.Group;
	import spark.components.HGroup;
	import spark.components.Label;
	import spark.primitives.BitmapImage;
	import spark.primitives.Rect;
	
	use namespace mx_internal;
	
	public class StarterDropStageCover extends Group implements IBindingClient, IStateClient2
	{
		
		private static const GREY_BORDER_COLOR:uint = 5267058;
		
		private static const GREY_BORDER_THICKNESS:uint = 2;
		
		private static const DASHLINE_LENGTH:int = 5;
		
		private static const DASHLINE_GAP:int = 3;
		
		private static var _watcherSetupUtil:IWatcherSetupUtil2;
		 
		
		private var _680841651_StarterDropStageCover_HGroup1:HGroup;
		
		private var _680841652_StarterDropStageCover_HGroup2:HGroup;
		
		public var _StarterDropStageCover_Rect2:Rect;
		
		private var _1721564075baseRect:Group;
		
		private var _606785824labelReplace:Label;
		
		private var _977945604labelReplaceHover:Label;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		private var _embed_mxml__styles_images_icons_ico_replacetemp_init_png_1225274441:Class;
		
		private var _embed_mxml__styles_images_icons_ico_replacetemp_hover_png_633702657:Class;
		
		mx_internal var _bindings:Array;
		
		mx_internal var _watchers:Array;
		
		mx_internal var _bindingsByDestination:Object;
		
		mx_internal var _bindingsBeginWithWord:Object;
		
		public function StarterDropStageCover()
		{
			var bindings:Array = null;
			var target:Object = null;
			var watcherSetupUtilClass:Object = null;
			this._embed_mxml__styles_images_icons_ico_replacetemp_init_png_1225274441 = StarterDropStageCover__embed_mxml__styles_images_icons_ico_replacetemp_init_png_1225274441;
			this._embed_mxml__styles_images_icons_ico_replacetemp_hover_png_633702657 = StarterDropStageCover__embed_mxml__styles_images_icons_ico_replacetemp_hover_png_633702657;
			this._bindings = [];
			this._watchers = [];
			this._bindingsByDestination = {};
			this._bindingsBeginWithWord = {};
			super();
			mx_internal::_document = this;
			bindings = this._StarterDropStageCover_bindingsSetup();
			var watchers:Array = [];
			target = this;
			if(_watcherSetupUtil == null)
			{
				watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_StarterDropStageCoverWatcherSetupUtil");
				watcherSetupUtilClass["init"](null);
			}
			_watcherSetupUtil.setup(this,function(param1:String):*
			{
				return target[param1];
			},function(param1:String):*
			{
				return StarterDropStageCover[param1];
			},bindings,watchers);
			mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
			mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
			this.mxmlContent = [this._StarterDropStageCover_HGroup2_i()];
			this.currentState = "normal";
			this.addEventListener("creationComplete",this.___StarterDropStageCover_Group1_creationComplete);
			this.addEventListener("rollOver",this.___StarterDropStageCover_Group1_rollOver);
			this.addEventListener("rollOut",this.___StarterDropStageCover_Group1_rollOut);
			this.addEventListener("dragEnter",this.___StarterDropStageCover_Group1_dragEnter);
			this.addEventListener("dragDrop",this.___StarterDropStageCover_Group1_dragDrop);
			var _StarterDropStageCover_Group2_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._StarterDropStageCover_Group2_i);
			var _StarterDropStageCover_Rect2_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._StarterDropStageCover_Rect2_i);
			states = [new State({
				"name":"normal",
				"overrides":[new AddItems().initializeFromObject({
					"itemsFactory":_StarterDropStageCover_Group2_factory,
					"destination":null,
					"propertyName":"mxmlContent",
					"position":"first"
				}),new SetProperty().initializeFromObject({
					"target":"_StarterDropStageCover_HGroup1",
					"name":"visible",
					"value":true
				})]
			}),new State({
				"name":"hover",
				"overrides":[new AddItems().initializeFromObject({
					"itemsFactory":_StarterDropStageCover_Rect2_factory,
					"destination":null,
					"propertyName":"mxmlContent",
					"position":"first"
				}),new SetProperty().initializeFromObject({
					"target":"_StarterDropStageCover_HGroup2",
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
			StarterDropStageCover._watcherSetupUtil = param1;
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
		}
		
		public function updateDashBorder() : void
		{
			this.baseRect.graphics.lineStyle(GREY_BORDER_THICKNESS,GREY_BORDER_COLOR);
			UtilDraw.drawDashRect(this.baseRect,0,0,this.width,this.height,DASHLINE_LENGTH,DASHLINE_GAP);
			if(this.labelReplace)
			{
				this.labelReplace.visible = this.labelReplace.includeInLayout = this.width >= AnimeConstants.SCREEN_WIDTH;
			}
			if(this.labelReplaceHover)
			{
				this.labelReplaceHover.visible = this.labelReplaceHover.includeInLayout = this.width >= AnimeConstants.SCREEN_WIDTH;
			}
		}
		
		protected function rollOverHandler(param1:MouseEvent) : void
		{
			this.currentState = "hover";
		}
		
		protected function rollOutHandler(param1:MouseEvent) : void
		{
			this.currentState = "normal";
		}
		
		protected function dragEnterHandler(param1:DragEvent) : void
		{
			DragManager.acceptDragDrop(this);
			DragManager.showFeedback(DragManager.COPY);
		}
		
		protected function dragDropHandler(param1:DragEvent) : void
		{
			var _loc2_:Console = Console.getConsole();
			var _loc3_:Thumb = Thumb(param1.dragSource.dataForFormat(Thumb.DRAG_DATA_FORMAT));
			if(_loc3_.isStarter)
			{
				_loc2_.addStarter(_loc3_ as BackgroundThumb,_loc2_.currentSceneIndex);
			}
			_loc2_.currDragSource = null;
		}
		
		private function _StarterDropStageCover_Group2_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.mxmlContent = [this._StarterDropStageCover_Rect1_c(),this._StarterDropStageCover_HGroup1_i()];
			_loc1_.id = "baseRect";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.baseRect = _loc1_;
			BindingManager.executeBindings(this,"baseRect",this.baseRect);
			return _loc1_;
		}
		
		private function _StarterDropStageCover_Rect1_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.fill = this._StarterDropStageCover_SolidColor1_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _StarterDropStageCover_SolidColor1_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.alpha = 0.95;
			_loc1_.color = 16777215;
			return _loc1_;
		}
		
		private function _StarterDropStageCover_HGroup1_i() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.visible = false;
			_loc1_.horizontalCenter = 0;
			_loc1_.verticalCenter = 0;
			_loc1_.gap = 15;
			_loc1_.mxmlContent = [this._StarterDropStageCover_BitmapImage1_c(),this._StarterDropStageCover_Label1_i()];
			_loc1_.id = "_StarterDropStageCover_HGroup1";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._StarterDropStageCover_HGroup1 = _loc1_;
			BindingManager.executeBindings(this,"_StarterDropStageCover_HGroup1",this._StarterDropStageCover_HGroup1);
			return _loc1_;
		}
		
		private function _StarterDropStageCover_BitmapImage1_c() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.width = 51;
			_loc1_.height = 32;
			_loc1_.source = this._embed_mxml__styles_images_icons_ico_replacetemp_init_png_1225274441;
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _StarterDropStageCover_Label1_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.horizontalCenter = 0;
			_loc1_.verticalCenter = 0;
			_loc1_.setStyle("fontSize",30);
			_loc1_.setStyle("color",5267058);
			_loc1_.id = "labelReplace";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.labelReplace = _loc1_;
			BindingManager.executeBindings(this,"labelReplace",this.labelReplace);
			return _loc1_;
		}
		
		private function _StarterDropStageCover_Rect2_i() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.stroke = this._StarterDropStageCover_SolidColorStroke1_c();
			_loc1_.fill = this._StarterDropStageCover_SolidColor2_c();
			_loc1_.initialized(this,"_StarterDropStageCover_Rect2");
			this._StarterDropStageCover_Rect2 = _loc1_;
			BindingManager.executeBindings(this,"_StarterDropStageCover_Rect2",this._StarterDropStageCover_Rect2);
			return _loc1_;
		}
		
		private function _StarterDropStageCover_SolidColorStroke1_c() : SolidColorStroke
		{
			var _loc1_:SolidColorStroke = new SolidColorStroke();
			_loc1_.weight = 5;
			_loc1_.color = 3389861;
			return _loc1_;
		}
		
		private function _StarterDropStageCover_SolidColor2_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.alpha = 0.95;
			_loc1_.color = 13623775;
			return _loc1_;
		}
		
		private function _StarterDropStageCover_HGroup2_i() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.visible = false;
			_loc1_.horizontalCenter = 0;
			_loc1_.verticalCenter = 0;
			_loc1_.gap = 15;
			_loc1_.mxmlContent = [this._StarterDropStageCover_BitmapImage2_c(),this._StarterDropStageCover_Label2_i()];
			_loc1_.id = "_StarterDropStageCover_HGroup2";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._StarterDropStageCover_HGroup2 = _loc1_;
			BindingManager.executeBindings(this,"_StarterDropStageCover_HGroup2",this._StarterDropStageCover_HGroup2);
			return _loc1_;
		}
		
		private function _StarterDropStageCover_BitmapImage2_c() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.width = 51;
			_loc1_.height = 32;
			_loc1_.source = this._embed_mxml__styles_images_icons_ico_replacetemp_hover_png_633702657;
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _StarterDropStageCover_Label2_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.horizontalCenter = 0;
			_loc1_.verticalCenter = 0;
			_loc1_.setStyle("fontSize",30);
			_loc1_.setStyle("color",3389861);
			_loc1_.id = "labelReplaceHover";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.labelReplaceHover = _loc1_;
			BindingManager.executeBindings(this,"labelReplaceHover",this.labelReplaceHover);
			return _loc1_;
		}
		
		public function ___StarterDropStageCover_Group1_creationComplete(param1:FlexEvent) : void
		{
			this.init();
		}
		
		public function ___StarterDropStageCover_Group1_rollOver(param1:MouseEvent) : void
		{
			this.rollOverHandler(param1);
		}
		
		public function ___StarterDropStageCover_Group1_rollOut(param1:MouseEvent) : void
		{
			this.rollOutHandler(param1);
		}
		
		public function ___StarterDropStageCover_Group1_dragEnter(param1:DragEvent) : void
		{
			this.dragEnterHandler(param1);
		}
		
		public function ___StarterDropStageCover_Group1_dragDrop(param1:DragEvent) : void
		{
			this.dragDropHandler(param1);
		}
		
		private function _StarterDropStageCover_bindingsSetup() : Array
		{
			var result:Array = [];
			result[0] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("Replace the current scene");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"labelReplace.text");
			result[1] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("Replace the current scene");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"labelReplaceHover.text");
			return result;
		}
		
		[Bindable(event="propertyChange")]
		public function get _StarterDropStageCover_HGroup1() : HGroup
		{
			return this._680841651_StarterDropStageCover_HGroup1;
		}
		
		public function set _StarterDropStageCover_HGroup1(param1:HGroup) : void
		{
			var _loc2_:Object = this._680841651_StarterDropStageCover_HGroup1;
			if(_loc2_ !== param1)
			{
				this._680841651_StarterDropStageCover_HGroup1 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_StarterDropStageCover_HGroup1",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get _StarterDropStageCover_HGroup2() : HGroup
		{
			return this._680841652_StarterDropStageCover_HGroup2;
		}
		
		public function set _StarterDropStageCover_HGroup2(param1:HGroup) : void
		{
			var _loc2_:Object = this._680841652_StarterDropStageCover_HGroup2;
			if(_loc2_ !== param1)
			{
				this._680841652_StarterDropStageCover_HGroup2 = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_StarterDropStageCover_HGroup2",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get baseRect() : Group
		{
			return this._1721564075baseRect;
		}
		
		public function set baseRect(param1:Group) : void
		{
			var _loc2_:Object = this._1721564075baseRect;
			if(_loc2_ !== param1)
			{
				this._1721564075baseRect = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"baseRect",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get labelReplace() : Label
		{
			return this._606785824labelReplace;
		}
		
		public function set labelReplace(param1:Label) : void
		{
			var _loc2_:Object = this._606785824labelReplace;
			if(_loc2_ !== param1)
			{
				this._606785824labelReplace = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"labelReplace",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get labelReplaceHover() : Label
		{
			return this._977945604labelReplaceHover;
		}
		
		public function set labelReplaceHover(param1:Label) : void
		{
			var _loc2_:Object = this._977945604labelReplaceHover;
			if(_loc2_ !== param1)
			{
				this._977945604labelReplaceHover = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"labelReplaceHover",_loc2_,param1));
				}
			}
		}
	}
}
