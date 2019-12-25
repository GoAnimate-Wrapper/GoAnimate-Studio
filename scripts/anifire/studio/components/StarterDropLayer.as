package anifire.studio.components
{
	import anifire.studio.core.Console;
	import anifire.studio.interfaces.IAssetView;
	import anifire.util.UtilDict;
	import anifire.util.UtilDraw;
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.getDefinitionByName;
	import mx.binding.Binding;
	import mx.binding.BindingManager;
	import mx.binding.IBindingClient;
	import mx.binding.IWatcherSetupUtil2;
	import mx.core.IFlexModuleFactory;
	import mx.core.UIComponent;
	import mx.core.mx_internal;
	import mx.events.EffectEvent;
	import mx.events.FlexEvent;
	import mx.events.PropertyChangeEvent;
	import mx.graphics.SolidColor;
	import mx.graphics.SolidColorStroke;
	import spark.components.Group;
	import spark.components.HGroup;
	import spark.components.Label;
	import spark.core.SpriteVisualElement;
	import spark.effects.Fade;
	import spark.primitives.BitmapImage;
	import spark.primitives.Rect;
	
	use namespace mx_internal;
	
	public class StarterDropLayer extends Group implements IBindingClient
	{
		
		private static const MASK_LAYER_ALPHA:Number = 0.8;
		
		private static const GREY_BORDER_COLOR:uint = 5267058;
		
		private static const GREY_BORDER_THICKNESS:uint = 2;
		
		private static const DASHLINE_LENGTH:int = 5;
		
		private static const DASHLINE_GAP:int = 3;
		
		private static const SCENE_THUMBNAIL_HEIGHT:int = 52;
		
		private static var _watcherSetupUtil:IWatcherSetupUtil2;
		 
		
		public var _StarterDropLayer_Label1:Label;
		
		private var _97692013frame:Group;
		
		private var _1567465743greenBorder:Group;
		
		private var _2080239986layerFadeIn:Fade;
		
		private var _62936225layerFadeOut:Fade;
		
		private var _69905979maskLayer:SpriteVisualElement;
		
		private var _1093783385stageCover:StarterDropStageCover;
		
		private var _1430456859stageCoverMask:Group;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		private var _targetRect:Rectangle;
		
		private var _layoutRect:Rectangle;
		
		private var _targetComponent:DisplayObject;
		
		private var _shouldLayoutByComponent:Boolean;
		
		private var _stageArea:UIComponent;
		
		private var _sceneEditor:SceneEditor;
		
		private var _embed_mxml__styles_images_icons_ico_addtemp_init_png_1024164055:Class;
		
		mx_internal var _bindings:Array;
		
		mx_internal var _watchers:Array;
		
		mx_internal var _bindingsByDestination:Object;
		
		mx_internal var _bindingsBeginWithWord:Object;
		
		public function StarterDropLayer()
		{
			var target:Object = null;
			var watcherSetupUtilClass:Object = null;
			this._embed_mxml__styles_images_icons_ico_addtemp_init_png_1024164055 = StarterDropLayer__embed_mxml__styles_images_icons_ico_addtemp_init_png_1024164055;
			this._bindings = [];
			this._watchers = [];
			this._bindingsByDestination = {};
			this._bindingsBeginWithWord = {};
			super();
			mx_internal::_document = this;
			var bindings:Array = this._StarterDropLayer_bindingsSetup();
			var watchers:Array = [];
			target = this;
			if(_watcherSetupUtil == null)
			{
				watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_StarterDropLayerWatcherSetupUtil");
				watcherSetupUtilClass["init"](null);
			}
			_watcherSetupUtil.setup(this,function(param1:String):*
			{
				return target[param1];
			},function(param1:String):*
			{
				return StarterDropLayer[param1];
			},bindings,watchers);
			mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
			mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
			this.visible = false;
			this.autoLayout = false;
			this.mouseEnabled = false;
			this.percentWidth = 100;
			this.percentHeight = 100;
			this.mxmlContent = [this._StarterDropLayer_Group2_i(),this._StarterDropLayer_SpriteVisualElement1_i(),this._StarterDropLayer_Group3_i(),this._StarterDropLayer_StarterDropStageCover1_i(),this._StarterDropLayer_Group4_i()];
			this._StarterDropLayer_Fade2_i();
			this._StarterDropLayer_Fade1_i();
			this.addEventListener("creationComplete",this.___StarterDropLayer_Group1_creationComplete);
			this.addEventListener("mouseUp",this.___StarterDropLayer_Group1_mouseUp);
			var i:uint = 0;
			while(i < bindings.length)
			{
				Binding(bindings[i]).execute();
				i++;
			}
		}
		
		public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
		{
			StarterDropLayer._watcherSetupUtil = param1;
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
			this._sceneEditor = Console.getConsole().sceneEditor;
			this._stageArea = Console.getConsole().mainStage._stageArea;
			this.targetComponent = Console.getConsole().timeline.sceneContainer;
			this.updateMaskLayer();
		}
		
		public function get targetComponent() : DisplayObject
		{
			return this._targetComponent;
		}
		
		public function set targetComponent(param1:DisplayObject) : void
		{
			if(this._targetComponent != param1)
			{
				if(this._targetComponent)
				{
					this._targetComponent.removeEventListener(FlexEvent.UPDATE_COMPLETE,this.onComponentUpdate);
					this._targetComponent.removeEventListener(Event.RESIZE,this.onComponentUpdate);
				}
				this._targetComponent = param1;
				if(this._targetComponent)
				{
					this.frame.visible = true;
					this._targetComponent.addEventListener(Event.RESIZE,this.onComponentUpdate);
					this._targetComponent.addEventListener(FlexEvent.UPDATE_COMPLETE,this.onComponentUpdate);
					this.updateTargetComponentFrame();
				}
				else
				{
					this.frame.visible = false;
					this.updateMaskLayer();
				}
			}
		}
		
		private function updateMaskLayer(param1:Rectangle = null) : void
		{
			var _loc2_:Rectangle = null;
			var _loc3_:Rectangle = null;
			var _loc4_:Rectangle = null;
			this.maskLayer.graphics.clear();
			this.maskLayer.graphics.lineStyle(0,0,0);
			this.maskLayer.graphics.beginFill(0,MASK_LAYER_ALPHA);
			this.maskLayer.graphics.drawRect(0,0,stage.width,stage.height);
			if(param1)
			{
				this.maskLayer.graphics.drawRect(param1.x,param1.y,param1.width,param1.height);
			}
			if(this._sceneEditor && this._sceneEditor.visualStageArea)
			{
				_loc2_ = this._sceneEditor.visualStageArea.getRect(this);
				this.stageCover.x = _loc2_.x;
				this.stageCover.y = _loc2_.y;
				this.stageCover.width = _loc2_.width;
				this.stageCover.height = _loc2_.height;
				this.stageCover.updateDashBorder();
				_loc3_ = Console.getConsole().mainStage._stageArea.getRect(this);
				this.stageCoverMask.x = _loc3_.x;
				this.stageCoverMask.y = _loc3_.y;
				this.stageCoverMask.width = _loc3_.width;
				this.stageCoverMask.height = _loc3_.height;
				this.stageCover.mask = this.stageCoverMask;
				_loc4_ = _loc2_.intersection(_loc3_);
				this.maskLayer.graphics.drawRect(_loc4_.x,_loc4_.y,_loc4_.width,_loc4_.height);
			}
			this.maskLayer.graphics.endFill();
		}
		
		private function getTargetRect(param1:DisplayObject) : Rectangle
		{
			var _loc2_:Rectangle = null;
			var _loc4_:Point = null;
			var _loc3_:UIComponent = param1 as UIComponent;
			if(_loc3_ && !(param1 is IAssetView))
			{
				_loc4_ = globalToLocal(_loc3_.localToGlobal(new Point(0,0)));
				_loc2_ = new Rectangle(_loc4_.x,_loc4_.y,_loc3_.getLayoutBoundsWidth(),_loc3_.getLayoutBoundsHeight());
			}
			else
			{
				_loc2_ = param1.getRect(this);
				if(param1 is IAssetView)
				{
					_loc2_.inflate(10,10);
				}
			}
			return _loc2_;
		}
		
		private function updateTargetComponentFrame() : void
		{
			this._targetRect = this.getTargetRect(this._targetComponent);
			this._targetRect.height = SCENE_THUMBNAIL_HEIGHT;
			this._layoutRect = this._targetRect;
			this.frame.width = this.greenBorder.width = this._targetRect.width;
			this.frame.height = this.greenBorder.height = this._targetRect.height;
			this.frame.x = this.greenBorder.x = this._targetRect.x;
			this.frame.y = this.greenBorder.y = this._targetRect.y;
			this.frame.graphics.lineStyle(GREY_BORDER_THICKNESS,GREY_BORDER_COLOR);
			UtilDraw.drawDashRect(this.frame,0,0,this.frame.width,this.frame.height,DASHLINE_LENGTH,DASHLINE_GAP);
			this.updateMaskLayer(this._targetRect);
			if(this._shouldLayoutByComponent)
			{
				this.updateLayoutByTargetComponent();
			}
		}
		
		private function onComponentUpdate(param1:Event) : void
		{
			this.updateTargetComponentFrame();
		}
		
		public function showDropLayer() : void
		{
			this.updateTargetComponentFrame();
			visible = true;
			mouseChildren = true;
			this.layerFadeIn.play();
		}
		
		public function hideDropLayer() : void
		{
			mouseChildren = false;
			this.layerFadeOut.play();
		}
		
		private function updateLayoutByTargetComponent() : void
		{
			var _loc1_:Rectangle = null;
			var _loc2_:int = 0;
			var _loc3_:Boolean = false;
			var _loc4_:Number = NaN;
			var _loc5_:Number = NaN;
			if(this._targetComponent && this._layoutRect)
			{
				_loc1_ = this._layoutRect;
				_loc2_ = 0;
				_loc4_ = this.maskLayer.getLayoutBoundsWidth();
				_loc5_ = this.maskLayer.getLayoutBoundsHeight();
			}
		}
		
		override protected function updateDisplayList(param1:Number, param2:Number) : void
		{
			super.updateDisplayList(param1,param2);
			this.maskLayer.width = param1;
			this.maskLayer.height = param2;
			this.updateMaskLayer();
			if(this._targetComponent is UIComponent)
			{
				(this._targetComponent as UIComponent).invalidateDisplayList();
			}
		}
		
		protected function onLayerFadeOutComplete(param1:EffectEvent) : void
		{
			visible = false;
		}
		
		protected function starterDropLayer_mouseUpHandler(param1:MouseEvent) : void
		{
			this.hideDropLayer();
			Console.getConsole().thumbTray.clearAllBackgroundThumbState();
		}
		
		protected function frame_rollOverHandler(param1:MouseEvent) : void
		{
			this.frame.visible = false;
			this.greenBorder.visible = true;
		}
		
		protected function mask_rollOverHandler(param1:MouseEvent) : void
		{
			this.frame.visible = true;
			this.greenBorder.visible = false;
		}
		
		private function _StarterDropLayer_Fade2_i() : Fade
		{
			var _loc1_:Fade = new Fade();
			_loc1_.alphaFrom = 0;
			_loc1_.alphaTo = 1;
			_loc1_.duration = 100;
			this.layerFadeIn = _loc1_;
			BindingManager.executeBindings(this,"layerFadeIn",this.layerFadeIn);
			return _loc1_;
		}
		
		private function _StarterDropLayer_Fade1_i() : Fade
		{
			var _loc1_:Fade = new Fade();
			_loc1_.alphaFrom = 1;
			_loc1_.alphaTo = 0;
			_loc1_.duration = 100;
			_loc1_.addEventListener("effectEnd",this.__layerFadeOut_effectEnd);
			this.layerFadeOut = _loc1_;
			BindingManager.executeBindings(this,"layerFadeOut",this.layerFadeOut);
			return _loc1_;
		}
		
		public function __layerFadeOut_effectEnd(param1:EffectEvent) : void
		{
			this.onLayerFadeOutComplete(param1);
		}
		
		private function _StarterDropLayer_Group2_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.mxmlContent = [this._StarterDropLayer_Rect1_c(),this._StarterDropLayer_HGroup1_c()];
			_loc1_.addEventListener("rollOver",this.__frame_rollOver);
			_loc1_.id = "frame";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.frame = _loc1_;
			BindingManager.executeBindings(this,"frame",this.frame);
			return _loc1_;
		}
		
		private function _StarterDropLayer_Rect1_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.fill = this._StarterDropLayer_SolidColor1_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _StarterDropLayer_SolidColor1_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.alpha = 0.95;
			_loc1_.color = 16777215;
			return _loc1_;
		}
		
		private function _StarterDropLayer_HGroup1_c() : HGroup
		{
			var _loc1_:HGroup = new HGroup();
			_loc1_.horizontalCenter = 0;
			_loc1_.verticalCenter = 0;
			_loc1_.gap = 10;
			_loc1_.verticalAlign = "middle";
			_loc1_.mxmlContent = [this._StarterDropLayer_BitmapImage1_c(),this._StarterDropLayer_Label1_i()];
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			return _loc1_;
		}
		
		private function _StarterDropLayer_BitmapImage1_c() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.width = 32;
			_loc1_.height = 17;
			_loc1_.smooth = true;
			_loc1_.source = this._embed_mxml__styles_images_icons_ico_addtemp_init_png_1024164055;
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _StarterDropLayer_Label1_i() : Label
		{
			var _loc1_:Label = new Label();
			_loc1_.horizontalCenter = 0;
			_loc1_.verticalCenter = 0;
			_loc1_.setStyle("fontSize",24);
			_loc1_.setStyle("color",5267058);
			_loc1_.id = "_StarterDropLayer_Label1";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this._StarterDropLayer_Label1 = _loc1_;
			BindingManager.executeBindings(this,"_StarterDropLayer_Label1",this._StarterDropLayer_Label1);
			return _loc1_;
		}
		
		public function __frame_rollOver(param1:MouseEvent) : void
		{
			this.frame_rollOverHandler(param1);
		}
		
		private function _StarterDropLayer_SpriteVisualElement1_i() : SpriteVisualElement
		{
			var _loc1_:SpriteVisualElement = new SpriteVisualElement();
			_loc1_.addEventListener("rollOver",this.__maskLayer_rollOver);
			_loc1_.initialized(this,"maskLayer");
			this.maskLayer = _loc1_;
			BindingManager.executeBindings(this,"maskLayer",this.maskLayer);
			return _loc1_;
		}
		
		public function __maskLayer_rollOver(param1:MouseEvent) : void
		{
			this.mask_rollOverHandler(param1);
		}
		
		private function _StarterDropLayer_Group3_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.mouseEnabled = false;
			_loc1_.mouseChildren = false;
			_loc1_.mxmlContent = [this._StarterDropLayer_Rect2_c()];
			_loc1_.id = "greenBorder";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.greenBorder = _loc1_;
			BindingManager.executeBindings(this,"greenBorder",this.greenBorder);
			return _loc1_;
		}
		
		private function _StarterDropLayer_Rect2_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.stroke = this._StarterDropLayer_SolidColorStroke1_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _StarterDropLayer_SolidColorStroke1_c() : SolidColorStroke
		{
			var _loc1_:SolidColorStroke = new SolidColorStroke();
			_loc1_.weight = 5;
			_loc1_.color = 3389861;
			return _loc1_;
		}
		
		private function _StarterDropLayer_StarterDropStageCover1_i() : StarterDropStageCover
		{
			var _loc1_:StarterDropStageCover = new StarterDropStageCover();
			_loc1_.id = "stageCover";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.stageCover = _loc1_;
			BindingManager.executeBindings(this,"stageCover",this.stageCover);
			return _loc1_;
		}
		
		private function _StarterDropLayer_Group4_i() : Group
		{
			var _loc1_:Group = new Group();
			_loc1_.mxmlContent = [this._StarterDropLayer_Rect3_c()];
			_loc1_.id = "stageCoverMask";
			if(!_loc1_.document)
			{
				_loc1_.document = this;
			}
			this.stageCoverMask = _loc1_;
			BindingManager.executeBindings(this,"stageCoverMask",this.stageCoverMask);
			return _loc1_;
		}
		
		private function _StarterDropLayer_Rect3_c() : Rect
		{
			var _loc1_:Rect = new Rect();
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.fill = this._StarterDropLayer_SolidColor2_c();
			_loc1_.initialized(this,null);
			return _loc1_;
		}
		
		private function _StarterDropLayer_SolidColor2_c() : SolidColor
		{
			var _loc1_:SolidColor = new SolidColor();
			_loc1_.color = 16711680;
			return _loc1_;
		}
		
		public function ___StarterDropLayer_Group1_creationComplete(param1:FlexEvent) : void
		{
			this.init();
		}
		
		public function ___StarterDropLayer_Group1_mouseUp(param1:MouseEvent) : void
		{
			this.starterDropLayer_mouseUpHandler(param1);
		}
		
		private function _StarterDropLayer_bindingsSetup() : Array
		{
			var result:Array = [];
			result[0] = new Binding(this,function():Object
			{
				return this;
			},null,"layerFadeOut.target");
			result[1] = new Binding(this,function():Object
			{
				return this;
			},null,"layerFadeIn.target");
			result[2] = new Binding(this,function():String
			{
				var _loc1_:* = UtilDict.translate("Insert a new scene");
				return _loc1_ == undefined?null:String(_loc1_);
			},null,"_StarterDropLayer_Label1.text");
			return result;
		}
		
		[Bindable(event="propertyChange")]
		public function get frame() : Group
		{
			return this._97692013frame;
		}
		
		public function set frame(param1:Group) : void
		{
			var _loc2_:Object = this._97692013frame;
			if(_loc2_ !== param1)
			{
				this._97692013frame = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"frame",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get greenBorder() : Group
		{
			return this._1567465743greenBorder;
		}
		
		public function set greenBorder(param1:Group) : void
		{
			var _loc2_:Object = this._1567465743greenBorder;
			if(_loc2_ !== param1)
			{
				this._1567465743greenBorder = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"greenBorder",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get layerFadeIn() : Fade
		{
			return this._2080239986layerFadeIn;
		}
		
		public function set layerFadeIn(param1:Fade) : void
		{
			var _loc2_:Object = this._2080239986layerFadeIn;
			if(_loc2_ !== param1)
			{
				this._2080239986layerFadeIn = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"layerFadeIn",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get layerFadeOut() : Fade
		{
			return this._62936225layerFadeOut;
		}
		
		public function set layerFadeOut(param1:Fade) : void
		{
			var _loc2_:Object = this._62936225layerFadeOut;
			if(_loc2_ !== param1)
			{
				this._62936225layerFadeOut = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"layerFadeOut",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get maskLayer() : SpriteVisualElement
		{
			return this._69905979maskLayer;
		}
		
		public function set maskLayer(param1:SpriteVisualElement) : void
		{
			var _loc2_:Object = this._69905979maskLayer;
			if(_loc2_ !== param1)
			{
				this._69905979maskLayer = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"maskLayer",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get stageCover() : StarterDropStageCover
		{
			return this._1093783385stageCover;
		}
		
		public function set stageCover(param1:StarterDropStageCover) : void
		{
			var _loc2_:Object = this._1093783385stageCover;
			if(_loc2_ !== param1)
			{
				this._1093783385stageCover = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"stageCover",_loc2_,param1));
				}
			}
		}
		
		[Bindable(event="propertyChange")]
		public function get stageCoverMask() : Group
		{
			return this._1430456859stageCoverMask;
		}
		
		public function set stageCoverMask(param1:Group) : void
		{
			var _loc2_:Object = this._1430456859stageCoverMask;
			if(_loc2_ !== param1)
			{
				this._1430456859stageCoverMask = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"stageCoverMask",_loc2_,param1));
				}
			}
		}
	}
}
