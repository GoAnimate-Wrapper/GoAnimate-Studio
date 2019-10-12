package anifire.studio.components
{
   import anifire.studio.events.StageControlEvent;
   import anifire.studio.layouts.ZoomContainerLayout;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.IVisualElement;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.events.ResizeEvent;
   import mx.events.SliderEvent;
   import spark.components.Group;
   
   use namespace mx_internal;
   
   public class ZoomContainer extends Group implements IBindingClient
   {
      
      public static const CONTROL_AREA_OFFSET:Number = 60;
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _42694078horizontalScrollBar:FlatHScrollBar;
      
      private var _1618627376verticalScrollBar:FlatVScrollBar;
      
      private var _1196685478viewport:Group;
      
      private var _1634741566zoomLayer:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ZoomContainer()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._ZoomContainer_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_ZoomContainerWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ZoomContainer[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContent = [this._ZoomContainer_Group2_i(),this._ZoomContainer_FlatVScrollBar1_i(),this._ZoomContainer_FlatHScrollBar1_i()];
         this.addEventListener("creationComplete",this.___ZoomContainer_Group1_creationComplete);
         this.addEventListener("resize",this.___ZoomContainer_Group1_resize);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         ZoomContainer._watcherSetupUtil = param1;
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
         this.horizontalScrollBar.addEventListener(SliderEvent.CHANGE,this.sliderChange_handler);
         this.verticalScrollBar.addEventListener(SliderEvent.CHANGE,this.sliderChange_handler);
         callLater(this.centerContent);
         callLater(this.updateViewportContentPosition);
      }
      
      protected function sliderChange_handler(param1:Event) : void
      {
         dispatchEvent(param1);
      }
      
      protected function resizeHandler() : void
      {
         callLater(this.centerContent);
         callLater(this.updateViewportContentPosition);
         dispatchEvent(new StageControlEvent(StageControlEvent.STAGE_RESIZE));
      }
      
      protected function updateViewportContentPosition() : void
      {
         var _loc1_:Number = this.zoomLayer.getLayoutBoundsWidth();
         var _loc2_:Number = this.zoomLayer.getLayoutBoundsHeight();
         if(_loc1_ < this.viewport.width)
         {
            this.zoomLayer.x = (this.viewport.width - _loc1_) * 0.5;
         }
         else
         {
            this.zoomLayer.x = 0;
         }
         if(_loc2_ < this.viewport.height)
         {
            this.zoomLayer.y = (this.viewport.height - _loc2_) * 0.5;
         }
         else
         {
            this.zoomLayer.y = 0;
         }
      }
      
      protected function get isHScrollBarActive() : Boolean
      {
         return this.horizontalScrollBar.maximum > 0;
      }
      
      protected function get isVScrollBarActive() : Boolean
      {
         return this.verticalScrollBar.maximum > 0;
      }
      
      protected function centerContent() : void
      {
         if(this.isHScrollBarActive)
         {
            this.viewport.horizontalScrollPosition = this.horizontalScrollBar.maximum * 0.5;
         }
         if(this.isVScrollBarActive)
         {
            this.viewport.verticalScrollPosition = (this.verticalScrollBar.maximum + CONTROL_AREA_OFFSET) * 0.5;
         }
      }
      
      public function panTo(param1:Number, param2:Number) : void
      {
         var _loc3_:Number = this.zoomFactor;
         var _loc4_:Rectangle = this.viewport.scrollRect;
         this.pan(param1 * _loc3_ - _loc4_.x - _loc4_.width * 0.5,param2 * _loc3_ - _loc4_.y - (_loc4_.height - CONTROL_AREA_OFFSET) * 0.5);
      }
      
      public function pan(param1:Number, param2:Number) : void
      {
         var _loc3_:Rectangle = this.viewport.scrollRect;
         var _loc4_:Number = this.zoomFactor;
         var _loc5_:Number = this.zoomLayer.width * _loc4_;
         var _loc6_:Number = this.zoomLayer.height * _loc4_;
         if(_loc3_.width <= _loc5_)
         {
            if(_loc3_.x + param1 <= 0)
            {
               _loc3_.x = 0;
            }
            else if(_loc3_.x + param1 + _loc3_.width >= _loc5_)
            {
               _loc3_.x = _loc5_ - _loc3_.width;
            }
            else
            {
               _loc3_.x = _loc3_.x + param1;
            }
         }
         else
         {
            _loc3_.x = (_loc5_ - _loc3_.width) * 0.5;
         }
         if(_loc3_.height <= _loc6_)
         {
            if(_loc3_.y + param2 <= 0)
            {
               _loc3_.y = 0;
            }
            else if(_loc3_.y + param2 + _loc3_.height >= _loc6_)
            {
               _loc3_.y = _loc6_ - _loc3_.height;
            }
            else
            {
               _loc3_.y = _loc3_.y + param2;
            }
         }
         else
         {
            _loc3_.y = (_loc6_ - _loc3_.height) * 0.5;
         }
         this.viewport.scrollRect = _loc3_;
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function zoom(param1:Number) : void
      {
         this.zoomImpl(param1);
         callLater(this.centerContent);
      }
      
      public function zoomAndPan(param1:Number, param2:Number, param3:Number) : void
      {
         this.zoomImpl(param1);
         callLater(this.panTo,[param2,param3]);
      }
      
      protected function zoomImpl(param1:Number) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc2_:Boolean = this.isHScrollBarActive;
         var _loc3_:Boolean = this.isVScrollBarActive;
         if(_loc2_)
         {
            _loc4_ = this.horizontalScrollBar.value / this.horizontalScrollBar.maximum;
         }
         if(_loc3_)
         {
            _loc5_ = this.verticalScrollBar.value / this.verticalScrollBar.maximum;
         }
         if(param1 <= 0)
         {
            param1 = 1;
         }
         this.zoomLayer.scaleX = param1;
         this.zoomLayer.scaleY = param1;
         this.zoomLayer.validateNow();
         this.viewport.validateNow();
         this.updateViewportContentPosition();
         if(_loc2_)
         {
            this.horizontalScrollBar.value = _loc4_ * this.horizontalScrollBar.maximum;
         }
         if(_loc3_)
         {
            this.verticalScrollBar.value = _loc5_ * this.verticalScrollBar.maximum;
         }
         if(!_loc2_ && this.isHScrollBarActive || !_loc3_ && this.isVScrollBarActive)
         {
            this.centerContent();
         }
         var _loc6_:StageControlEvent = new StageControlEvent(StageControlEvent.STAGE_ZOOM_UPDATE);
         _loc6_.zoomValue = param1;
         dispatchEvent(_loc6_);
      }
      
      public function get zoomFactor() : Number
      {
         return this.zoomLayer.scaleX;
      }
      
      public function get viewCenter() : Point
      {
         var _loc1_:Number = this.zoomFactor;
         var _loc2_:Rectangle = this.viewport.scrollRect;
         return new Point((_loc2_.x + _loc2_.width * 0.5) / _loc1_,(_loc2_.y + _loc2_.height * 0.5) / _loc1_);
      }
      
      public function set targetDisplayObject(param1:IVisualElement) : void
      {
         this.zoomLayer.removeAllElements();
         this.zoomLayer.addElement(param1);
         this.zoomLayer.width = param1.width;
         this.zoomLayer.height = param1.height;
         this.zoomLayer.validateNow();
         this.zoomLayer.validateDisplayList();
         this.centerContent();
      }
      
      public function get effectiveHeight() : Number
      {
         return getLayoutBoundsHeight() - CONTROL_AREA_OFFSET;
      }
      
      public function get effectiveWidth() : Number
      {
         return getLayoutBoundsWidth();
      }
      
      public function enableScrollBars() : void
      {
         this.verticalScrollBar.mouseEnabled = true;
         this.horizontalScrollBar.mouseEnabled = true;
         this.verticalScrollBar.mouseChildren = true;
         this.horizontalScrollBar.mouseChildren = true;
      }
      
      public function disableScrollBars() : void
      {
         this.verticalScrollBar.mouseEnabled = false;
         this.horizontalScrollBar.mouseEnabled = false;
         this.verticalScrollBar.mouseChildren = false;
         this.horizontalScrollBar.mouseChildren = false;
      }
      
      private function _ZoomContainer_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.clipAndEnableScrolling = true;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.layout = this._ZoomContainer_ZoomContainerLayout1_c();
         _loc1_.mxmlContent = [this._ZoomContainer_Group3_i()];
         _loc1_.id = "viewport";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.viewport = _loc1_;
         BindingManager.executeBindings(this,"viewport",this.viewport);
         return _loc1_;
      }
      
      private function _ZoomContainer_ZoomContainerLayout1_c() : ZoomContainerLayout
      {
         var _loc1_:ZoomContainerLayout = new ZoomContainerLayout();
         return _loc1_;
      }
      
      private function _ZoomContainer_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.id = "zoomLayer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.zoomLayer = _loc1_;
         BindingManager.executeBindings(this,"zoomLayer",this.zoomLayer);
         return _loc1_;
      }
      
      private function _ZoomContainer_FlatVScrollBar1_i() : FlatVScrollBar
      {
         var _loc1_:FlatVScrollBar = new FlatVScrollBar();
         _loc1_.top = 10;
         _loc1_.right = 10;
         _loc1_.bottom = 82;
         _loc1_.alwaysActive = true;
         _loc1_.id = "verticalScrollBar";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.verticalScrollBar = _loc1_;
         BindingManager.executeBindings(this,"verticalScrollBar",this.verticalScrollBar);
         return _loc1_;
      }
      
      private function _ZoomContainer_FlatHScrollBar1_i() : FlatHScrollBar
      {
         var _loc1_:FlatHScrollBar = new FlatHScrollBar();
         _loc1_.left = 10;
         _loc1_.right = 10;
         _loc1_.bottom = 62;
         _loc1_.id = "horizontalScrollBar";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.horizontalScrollBar = _loc1_;
         BindingManager.executeBindings(this,"horizontalScrollBar",this.horizontalScrollBar);
         return _loc1_;
      }
      
      public function ___ZoomContainer_Group1_creationComplete(param1:FlexEvent) : void
      {
         this.init();
      }
      
      public function ___ZoomContainer_Group1_resize(param1:ResizeEvent) : void
      {
         this.resizeHandler();
      }
      
      private function _ZoomContainer_bindingsSetup() : Array
      {
         var _loc1_:Array = [];
         _loc1_[0] = new Binding(this,null,null,"verticalScrollBar.viewport","viewport");
         _loc1_[1] = new Binding(this,null,null,"horizontalScrollBar.viewport","viewport");
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get horizontalScrollBar() : FlatHScrollBar
      {
         return this._42694078horizontalScrollBar;
      }
      
      public function set horizontalScrollBar(param1:FlatHScrollBar) : void
      {
         var _loc2_:Object = this._42694078horizontalScrollBar;
         if(_loc2_ !== param1)
         {
            this._42694078horizontalScrollBar = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"horizontalScrollBar",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get verticalScrollBar() : FlatVScrollBar
      {
         return this._1618627376verticalScrollBar;
      }
      
      public function set verticalScrollBar(param1:FlatVScrollBar) : void
      {
         var _loc2_:Object = this._1618627376verticalScrollBar;
         if(_loc2_ !== param1)
         {
            this._1618627376verticalScrollBar = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"verticalScrollBar",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get viewport() : Group
      {
         return this._1196685478viewport;
      }
      
      public function set viewport(param1:Group) : void
      {
         var _loc2_:Object = this._1196685478viewport;
         if(_loc2_ !== param1)
         {
            this._1196685478viewport = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"viewport",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get zoomLayer() : Group
      {
         return this._1634741566zoomLayer;
      }
      
      public function set zoomLayer(param1:Group) : void
      {
         var _loc2_:Object = this._1634741566zoomLayer;
         if(_loc2_ !== param1)
         {
            this._1634741566zoomLayer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"zoomLayer",_loc2_,param1));
            }
         }
      }
   }
}
