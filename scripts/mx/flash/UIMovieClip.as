package mx.flash
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.InteractiveObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Matrix3D;
   import flash.geom.PerspectiveProjection;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.geom.Transform;
   import flash.geom.Vector3D;
   import flash.system.ApplicationDomain;
   import flash.ui.Keyboard;
   import mx.automation.IAutomationObject;
   import mx.core.AdvancedLayoutFeatures;
   import mx.core.DesignLayer;
   import mx.core.IConstraintClient;
   import mx.core.IDeferredInstantiationUIComponent;
   import mx.core.IFlexDisplayObject;
   import mx.core.IFlexModule;
   import mx.core.IFlexModuleFactory;
   import mx.core.IInvalidating;
   import mx.core.ILayoutElement;
   import mx.core.IStateClient;
   import mx.core.IUIComponent;
   import mx.core.IVisualElement;
   import mx.core.LayoutDirection;
   import mx.core.LayoutElementUIComponentUtils;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.MoveEvent;
   import mx.events.PropertyChangeEvent;
   import mx.events.ResizeEvent;
   import mx.events.StateChangeEvent;
   import mx.geom.TransformOffsets;
   import mx.managers.IFocusManagerComponent;
   import mx.managers.ISystemManager;
   import mx.managers.IToolTipManagerClient;
   import mx.utils.MatrixUtil;
   import mx.utils.TransformUtil;
   
   use namespace mx_internal;
   
   public dynamic class UIMovieClip extends MovieClip implements IDeferredInstantiationUIComponent, IToolTipManagerClient, IStateClient, IFocusManagerComponent, IConstraintClient, IAutomationObject, IVisualElement, ILayoutElement, IFlexModule
   {
       
      
      protected var initialized:Boolean = false;
      
      private var validateMeasuredSizeFlag:Boolean = true;
      
      private var _parent:DisplayObjectContainer;
      
      private var stateMap:Object;
      
      private var focusableObjects:Array;
      
      private var reverseDirectionFocus:Boolean = false;
      
      private var focusListenersAdded:Boolean = false;
      
      private var transitionStartFrame:Number;
      
      private var transitionEndFrame:Number;
      
      private var transitionDirection:Number = 0;
      
      private var transitionEndState:String;
      
      private var oldX:Number;
      
      private var oldY:Number;
      
      private var oldWidth:Number;
      
      private var oldHeight:Number;
      
      private var explicitSizeChanged:Boolean = false;
      
      private var explicitTabEnabledChanged:Boolean = false;
      
      private var _alpha:Number = 1.0;
      
      private var _autoUpdateMeasuredSize:Boolean = false;
      
      private var _autoUpdateCurrentState:Boolean = false;
      
      public var boundingBoxName:String = "boundingBox";
      
      private var _baseline;
      
      private var _bottom;
      
      private var _horizontalCenter;
      
      private var _left;
      
      private var _right;
      
      private var _top;
      
      private var _verticalCenter;
      
      private var _descriptor:UIComponentDescriptor;
      
      private var _id:String;
      
      mx_internal var _document:Object;
      
      private var _explicitHeight:Number;
      
      private var _explicitMaxHeight:Number;
      
      private var _explicitMaxWidth:Number;
      
      private var _explicitMinHeight:Number;
      
      private var _explicitMinWidth:Number;
      
      private var _explicitWidth:Number;
      
      private var _focusPane:Sprite;
      
      private var _includeInLayout:Boolean = true;
      
      private var _isPopUp:Boolean = false;
      
      private var _designLayer:DesignLayer;
      
      private var _measuredMinHeight:Number = 0;
      
      private var _measuredMinWidth:Number = 0;
      
      private var _moduleFactory:IFlexModuleFactory;
      
      private var _owner:DisplayObjectContainer;
      
      private var _percentHeight:Number;
      
      private var _percentWidth:Number;
      
      private var _systemManager:ISystemManager;
      
      private var _tweeningProperties:Array;
      
      private var _visible:Boolean = true;
      
      protected var _height:Number;
      
      private var _measuredHeight:Number;
      
      private var _measuredWidth:Number;
      
      protected var _width:Number;
      
      private var _toolTip:String;
      
      private var _focusEnabled:Boolean = true;
      
      private var _hasFocusableChildren:Boolean = true;
      
      private var _tabFocusEnabled:Boolean = true;
      
      private var _layoutDirection:String = null;
      
      private var _maintainProjectionCenter:Boolean = false;
      
      mx_internal var _layoutFeatures:AdvancedLayoutFeatures;
      
      protected var hasDeltaIdentityTransform:Boolean = true;
      
      private var _transform:flash.geom.Transform;
      
      private var _currentState:String;
      
      private var _automationDelegate:IAutomationObject;
      
      private var _automationName:String = null;
      
      private var _showInAutomationHierarchy:Boolean = true;
      
      public function UIMovieClip()
      {
         this.focusableObjects = [];
         super();
         addEventListener(FocusEvent.FOCUS_IN,this.focusInHandler,false,0,true);
         addEventListener(FlexEvent.CREATION_COMPLETE,this.creationCompleteHandler);
         addEventListener(Event.ENTER_FRAME,this.setUpFirstCurrentState);
      }
      
      override public function get alpha() : Number
      {
         return int(this._alpha * 256) / 256;
      }
      
      override public function set alpha(param1:Number) : void
      {
         if(this._alpha != param1)
         {
            this._alpha = param1;
            if(this.designLayer)
            {
               param1 = param1 * this.designLayer.effectiveAlpha;
            }
            super.alpha = param1;
         }
      }
      
      public function get autoUpdateMeasuredSize() : Boolean
      {
         return this._autoUpdateMeasuredSize;
      }
      
      public function set autoUpdateMeasuredSize(param1:Boolean) : void
      {
         if(this._autoUpdateMeasuredSize == param1)
         {
            return;
         }
         this._autoUpdateMeasuredSize = param1;
         if(this._autoUpdateMeasuredSize)
         {
            addEventListener(Event.ENTER_FRAME,this.autoUpdateMeasuredSizeEnterFrameHandler,false,0,true);
         }
         else
         {
            removeEventListener(Event.ENTER_FRAME,this.autoUpdateMeasuredSizeEnterFrameHandler);
         }
      }
      
      public function get autoUpdateCurrentState() : Boolean
      {
         return this._autoUpdateCurrentState;
      }
      
      public function set autoUpdateCurrentState(param1:Boolean) : void
      {
         if(this._autoUpdateCurrentState == param1)
         {
            return;
         }
         this._autoUpdateCurrentState = param1;
         if(this._autoUpdateCurrentState)
         {
            addEventListener(Event.ENTER_FRAME,this.autoUpdateCurrentStateEnterFrameHandler,false,0,true);
         }
         else
         {
            removeEventListener(Event.ENTER_FRAME,this.autoUpdateCurrentStateEnterFrameHandler);
         }
      }
      
      override public function get x() : Number
      {
         return this._layoutFeatures == null?Number(super.x):Number(this._layoutFeatures.layoutX);
      }
      
      override public function set x(param1:Number) : void
      {
         if(this.x == param1)
         {
            return;
         }
         if(this._layoutFeatures == null)
         {
            super.x = param1;
         }
         else
         {
            this._layoutFeatures.layoutX = param1;
            this.invalidateTransform();
         }
         addEventListener(Event.ENTER_FRAME,this.enterFrameHandler,false,0,true);
         this.invalidateParentSizeAndDisplayList();
      }
      
      override public function get y() : Number
      {
         return this._layoutFeatures == null?Number(super.y):Number(this._layoutFeatures.layoutY);
      }
      
      override public function set y(param1:Number) : void
      {
         if(this.y == param1)
         {
            return;
         }
         if(this._layoutFeatures == null)
         {
            super.y = param1;
         }
         else
         {
            this._layoutFeatures.layoutY = param1;
            this.invalidateTransform();
         }
         addEventListener(Event.ENTER_FRAME,this.enterFrameHandler,false,0,true);
         this.invalidateParentSizeAndDisplayList();
      }
      
      [Bindable("zChanged")]
      override public function get z() : Number
      {
         return this._layoutFeatures == null?Number(super.z):Number(this._layoutFeatures.layoutZ);
      }
      
      override public function set z(param1:Number) : void
      {
         if(this.z == param1)
         {
            return;
         }
         if(this._layoutFeatures == null)
         {
            this.initAdvancedLayoutFeatures();
         }
         this.hasDeltaIdentityTransform = false;
         this._layoutFeatures.layoutZ = param1;
         this.invalidateTransform();
         this.invalidateParentSizeAndDisplayList();
      }
      
      [Bindable(event="propertyChange")]
      public function get baseline() : Object
      {
         return this._baseline;
      }
      
      private function set _1720785339baseline(param1:Object) : void
      {
         if(param1 != this._baseline)
         {
            this._baseline = param1;
            this.invalidateParentSizeAndDisplayList();
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bottom() : Object
      {
         return this._bottom;
      }
      
      private function set _1383228885bottom(param1:Object) : void
      {
         if(param1 != this._bottom)
         {
            this._bottom = param1;
            this.invalidateParentSizeAndDisplayList();
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get horizontalCenter() : Object
      {
         return this._horizontalCenter;
      }
      
      private function set _2016110183horizontalCenter(param1:Object) : void
      {
         if(param1 != this._horizontalCenter)
         {
            this._horizontalCenter = param1;
            this.invalidateParentSizeAndDisplayList();
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get left() : Object
      {
         return this._left;
      }
      
      private function set _3317767left(param1:Object) : void
      {
         if(param1 != this._left)
         {
            this._left = param1;
            this.invalidateParentSizeAndDisplayList();
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get right() : Object
      {
         return this._right;
      }
      
      private function set _108511772right(param1:Object) : void
      {
         if(param1 != this._right)
         {
            this._right = param1;
            this.invalidateParentSizeAndDisplayList();
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get top() : Object
      {
         return this._top;
      }
      
      private function set _115029top(param1:Object) : void
      {
         if(param1 != this._top)
         {
            this._top = param1;
            this.invalidateParentSizeAndDisplayList();
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get verticalCenter() : Object
      {
         return this._verticalCenter;
      }
      
      private function set _926273685verticalCenter(param1:Object) : void
      {
         if(param1 != this._verticalCenter)
         {
            this._verticalCenter = param1;
            this.invalidateParentSizeAndDisplayList();
         }
      }
      
      public function set cacheHeuristic(param1:Boolean) : void
      {
      }
      
      public function get cachePolicy() : String
      {
         return "";
      }
      
      public function get descriptor() : UIComponentDescriptor
      {
         return this._descriptor;
      }
      
      public function set descriptor(param1:UIComponentDescriptor) : void
      {
         this._descriptor = param1;
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function set id(param1:String) : void
      {
         this._id = param1;
      }
      
      public function createReferenceOnParentDocument(param1:IFlexDisplayObject) : void
      {
         if(this.id && this.id != "")
         {
            param1[this.id] = this;
         }
      }
      
      public function deleteReferenceOnParentDocument(param1:IFlexDisplayObject) : void
      {
         if(this.id && this.id != "")
         {
            param1[this.id] = null;
         }
      }
      
      public function executeBindings(param1:Boolean = false) : void
      {
         var _loc2_:Object = this.descriptor && this.descriptor.document?this.descriptor.document:this.parentDocument;
         var _loc3_:* = ApplicationDomain.currentDomain.getDefinition("mx.binding.BindingManager");
         if(_loc3_ != null)
         {
            _loc3_.executeBindings(_loc2_,this.id,this);
         }
      }
      
      public function registerEffects(param1:Array) : void
      {
      }
      
      public function get baselinePosition() : Number
      {
         return 0;
      }
      
      public function get document() : Object
      {
         return this._document;
      }
      
      public function set document(param1:Object) : void
      {
         this._document = param1;
      }
      
      public function get explicitHeight() : Number
      {
         return this._explicitHeight;
      }
      
      public function set explicitHeight(param1:Number) : void
      {
         this._explicitHeight = param1;
         this.explicitSizeChanged = true;
         this.invalidateParentSizeAndDisplayList();
         addEventListener(Event.ENTER_FRAME,this.enterFrameHandler,false,0,true);
      }
      
      public function get explicitMaxHeight() : Number
      {
         return this._explicitMaxHeight;
      }
      
      public function set explicitMaxHeight(param1:Number) : void
      {
         this._explicitMaxHeight = param1;
         this.invalidateParentSizeAndDisplayList();
      }
      
      public function get explicitMaxWidth() : Number
      {
         return this._explicitMaxWidth;
      }
      
      public function set explicitMaxWidth(param1:Number) : void
      {
         this._explicitMaxWidth = param1;
         this.invalidateParentSizeAndDisplayList();
      }
      
      public function get explicitMinHeight() : Number
      {
         return this._explicitMinHeight;
      }
      
      public function set explicitMinHeight(param1:Number) : void
      {
         this._explicitMinHeight = param1;
         this.invalidateParentSizeAndDisplayList();
      }
      
      public function get explicitMinWidth() : Number
      {
         return this._explicitMinWidth;
      }
      
      public function set explicitMinWidth(param1:Number) : void
      {
         this._explicitMinWidth = param1;
         this.invalidateParentSizeAndDisplayList();
      }
      
      public function get explicitWidth() : Number
      {
         return this._explicitWidth;
      }
      
      public function set explicitWidth(param1:Number) : void
      {
         this._explicitWidth = param1;
         this.explicitSizeChanged = true;
         this.invalidateParentSizeAndDisplayList();
         addEventListener(Event.ENTER_FRAME,this.enterFrameHandler,false,0,true);
      }
      
      public function get focusPane() : Sprite
      {
         return this._focusPane;
      }
      
      public function set focusPane(param1:Sprite) : void
      {
         this._focusPane = param1;
      }
      
      public function get includeInLayout() : Boolean
      {
         return this._includeInLayout;
      }
      
      public function set includeInLayout(param1:Boolean) : void
      {
         this._includeInLayout = param1;
         this.invalidateParentSizeAndDisplayList();
      }
      
      public function get isPopUp() : Boolean
      {
         return this._isPopUp;
      }
      
      public function set isPopUp(param1:Boolean) : void
      {
         this._isPopUp = param1;
      }
      
      public function get designLayer() : DesignLayer
      {
         return this._designLayer;
      }
      
      public function set designLayer(param1:DesignLayer) : void
      {
         if(this._designLayer)
         {
            this._designLayer.removeEventListener("layerPropertyChange",this.layer_PropertyChange,false);
         }
         this._designLayer = param1;
         if(this._designLayer)
         {
            this._designLayer.addEventListener("layerPropertyChange",this.layer_PropertyChange,false,0,true);
         }
         super.alpha = !!this._designLayer?Number(this._alpha * this._designLayer.effectiveAlpha):Number(this._alpha);
         super.visible = !!this._designLayer?this._visible && this._designLayer.effectiveVisibility:Boolean(this._visible);
      }
      
      public function get maxHeight() : Number
      {
         return !!isNaN(this.explicitMaxHeight)?Number(10000):Number(this.explicitMaxHeight);
      }
      
      public function set maxHeight(param1:Number) : void
      {
         this.explicitMaxHeight = param1;
      }
      
      public function get maxWidth() : Number
      {
         return !!isNaN(this.explicitMaxWidth)?Number(10000):Number(this.explicitMaxWidth);
      }
      
      public function set maxWidth(param1:Number) : void
      {
         this.explicitMaxWidth = param1;
      }
      
      public function get measuredMinHeight() : Number
      {
         return this._measuredMinHeight;
      }
      
      public function set measuredMinHeight(param1:Number) : void
      {
         this._measuredMinHeight = param1;
      }
      
      public function get measuredMinWidth() : Number
      {
         return this._measuredMinWidth;
      }
      
      public function set measuredMinWidth(param1:Number) : void
      {
         this._measuredMinWidth = param1;
      }
      
      public function get minHeight() : Number
      {
         if(!isNaN(this.explicitMinHeight))
         {
            return this.explicitMinHeight;
         }
         return this.measuredMinHeight;
      }
      
      public function set minHeight(param1:Number) : void
      {
         this.explicitMinHeight = param1;
      }
      
      public function get minWidth() : Number
      {
         if(!isNaN(this.explicitMinWidth))
         {
            return this.explicitMinWidth;
         }
         return this.measuredMinWidth;
      }
      
      public function set minWidth(param1:Number) : void
      {
         this.explicitMinWidth = param1;
      }
      
      public function get moduleFactory() : IFlexModuleFactory
      {
         return this._moduleFactory;
      }
      
      public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         var _loc4_:IFlexModule = null;
         var _loc2_:int = numChildren;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = getChildAt(_loc3_) as IFlexModule;
            if(_loc4_)
            {
               if(_loc4_.moduleFactory == null || _loc4_.moduleFactory == this._moduleFactory)
               {
                  _loc4_.moduleFactory = param1;
               }
            }
            _loc3_++;
         }
         this._moduleFactory = param1;
      }
      
      public function get owner() : DisplayObjectContainer
      {
         return !!this._owner?this._owner:this.parent;
      }
      
      public function set owner(param1:DisplayObjectContainer) : void
      {
         this._owner = param1;
      }
      
      public function get percentHeight() : Number
      {
         return this._percentHeight;
      }
      
      public function set percentHeight(param1:Number) : void
      {
         this._percentHeight = param1;
         this.invalidateParentSizeAndDisplayList();
      }
      
      public function get percentWidth() : Number
      {
         return this._percentWidth;
      }
      
      public function set percentWidth(param1:Number) : void
      {
         this._percentWidth = param1;
         this.invalidateParentSizeAndDisplayList();
      }
      
      public function get systemManager() : ISystemManager
      {
         var _loc1_:DisplayObject = null;
         var _loc2_:DisplayObjectContainer = null;
         var _loc3_:IUIComponent = null;
         if(!this._systemManager)
         {
            _loc1_ = root;
            if(_loc1_ && !(_loc1_ is Stage))
            {
               this._systemManager = _loc1_ as ISystemManager;
            }
            else if(_loc1_)
            {
               this._systemManager = Stage(_loc1_).getChildAt(0) as ISystemManager;
            }
            else
            {
               _loc2_ = this.parent;
               while(_loc2_)
               {
                  _loc3_ = _loc2_ as IUIComponent;
                  if(_loc3_)
                  {
                     this._systemManager = _loc3_.systemManager;
                     break;
                  }
                  if(_loc2_ is ISystemManager)
                  {
                     this._systemManager = _loc2_ as ISystemManager;
                     break;
                  }
                  _loc2_ = _loc2_.parent;
               }
            }
         }
         return this._systemManager;
      }
      
      public function set systemManager(param1:ISystemManager) : void
      {
         this._systemManager = param1;
      }
      
      public function get tweeningProperties() : Array
      {
         return this._tweeningProperties;
      }
      
      public function set tweeningProperties(param1:Array) : void
      {
         this._tweeningProperties = param1;
      }
      
      override public function get visible() : Boolean
      {
         return this._visible;
      }
      
      override public function set visible(param1:Boolean) : void
      {
         this.setVisible(param1);
      }
      
      override public function get height() : Number
      {
         if(!isNaN(this._height))
         {
            return this._height;
         }
         return super.height;
      }
      
      override public function set height(param1:Number) : void
      {
         this.explicitHeight = param1;
      }
      
      public function get measuredHeight() : Number
      {
         this.validateMeasuredSize();
         return this._measuredHeight;
      }
      
      public function get measuredWidth() : Number
      {
         this.validateMeasuredSize();
         return this._measuredWidth;
      }
      
      override public function get width() : Number
      {
         if(!isNaN(this._width))
         {
            return this._width;
         }
         return super.width;
      }
      
      override public function set width(param1:Number) : void
      {
         this.explicitWidth = param1;
      }
      
      override public function get scaleX() : Number
      {
         return this._layoutFeatures == null?Number(1):Number(this._layoutFeatures.layoutScaleX);
      }
      
      override public function set scaleX(param1:Number) : void
      {
         if(param1 == this.scaleX)
         {
            return;
         }
         if(this._layoutFeatures == null)
         {
            this.initAdvancedLayoutFeatures();
         }
         this.hasDeltaIdentityTransform = false;
         this._layoutFeatures.layoutScaleX = param1;
         this.invalidateTransform();
         this.invalidateParentSizeAndDisplayList();
      }
      
      mx_internal function get $scaleX() : Number
      {
         return super.scaleX;
      }
      
      mx_internal function set $scaleX(param1:Number) : void
      {
         super.scaleX = param1;
      }
      
      override public function get scaleY() : Number
      {
         return this._layoutFeatures == null?Number(1):Number(this._layoutFeatures.layoutScaleY);
      }
      
      override public function set scaleY(param1:Number) : void
      {
         if(param1 == this.scaleY)
         {
            return;
         }
         if(this._layoutFeatures == null)
         {
            this.initAdvancedLayoutFeatures();
         }
         this.hasDeltaIdentityTransform = false;
         this._layoutFeatures.layoutScaleY = param1;
         this.invalidateTransform();
         this.invalidateParentSizeAndDisplayList();
      }
      
      mx_internal function get $scaleY() : Number
      {
         return super.scaleY;
      }
      
      mx_internal function set $scaleY(param1:Number) : void
      {
         super.scaleY = param1;
      }
      
      override public function get scaleZ() : Number
      {
         return this._layoutFeatures == null?Number(super.scaleZ):Number(this._layoutFeatures.layoutScaleZ);
      }
      
      override public function set scaleZ(param1:Number) : void
      {
         if(this.scaleZ == param1)
         {
            return;
         }
         if(this._layoutFeatures == null)
         {
            this.initAdvancedLayoutFeatures();
         }
         this.hasDeltaIdentityTransform = false;
         this._layoutFeatures.layoutScaleZ = param1;
         this.invalidateTransform();
         this.invalidateParentSizeAndDisplayList();
      }
      
      public function get toolTip() : String
      {
         return this._toolTip;
      }
      
      public function set toolTip(param1:String) : void
      {
         var _loc2_:* = ApplicationDomain.currentDomain.getDefinition("mx.managers.ToolTipManager");
         var _loc3_:String = this._toolTip;
         this._toolTip = param1;
         if(_loc2_)
         {
            _loc2_.registerToolTip(this,_loc3_,param1);
         }
      }
      
      public function get focusEnabled() : Boolean
      {
         return this._focusEnabled && this.focusableObjects.length > 0;
      }
      
      public function set focusEnabled(param1:Boolean) : void
      {
         this._focusEnabled = param1;
      }
      
      [Bindable("hasFocusableChildrenChange")]
      public function get hasFocusableChildren() : Boolean
      {
         return this._hasFocusableChildren;
      }
      
      public function set hasFocusableChildren(param1:Boolean) : void
      {
         if(param1 != this._hasFocusableChildren)
         {
            this._hasFocusableChildren = param1;
            dispatchEvent(new Event("hasFocusableChildrenChange"));
         }
      }
      
      public function get mouseFocusEnabled() : Boolean
      {
         return false;
      }
      
      [Bindable("tabFocusEnabledChange")]
      public function get tabFocusEnabled() : Boolean
      {
         return this._tabFocusEnabled;
      }
      
      public function set tabFocusEnabled(param1:Boolean) : void
      {
         if(param1 != this._tabFocusEnabled)
         {
            this._tabFocusEnabled = param1;
            dispatchEvent(new Event("tabFocusEnabledChange"));
         }
      }
      
      public function getConstraintValue(param1:String) : *
      {
         return this["_" + param1];
      }
      
      public function setConstraintValue(param1:String, param2:*) : void
      {
         this[param1] = param2;
         this["_" + param1] = param2;
      }
      
      public function get depth() : Number
      {
         return this._layoutFeatures == null?Number(0):Number(this._layoutFeatures.depth);
      }
      
      public function set depth(param1:Number) : void
      {
         if(param1 == this.depth)
         {
            return;
         }
         if(this._layoutFeatures == null)
         {
            this.initAdvancedLayoutFeatures();
         }
         this._layoutFeatures.depth = param1;
         if(this.parent != null && "invalidateLayering" in this.parent && this.parent["invalidateLayering"] is Function)
         {
            this.parent["invalidateLayering"]();
         }
      }
      
      public function get transformX() : Number
      {
         return this._layoutFeatures == null?Number(0):Number(this._layoutFeatures.transformX);
      }
      
      public function set transformX(param1:Number) : void
      {
         if(this.transformX == param1)
         {
            return;
         }
         if(this._layoutFeatures == null)
         {
            this.initAdvancedLayoutFeatures();
         }
         this._layoutFeatures.transformX = param1;
         this.invalidateTransform();
         this.invalidateParentSizeAndDisplayList();
      }
      
      public function get transformY() : Number
      {
         return this._layoutFeatures == null?Number(0):Number(this._layoutFeatures.transformY);
      }
      
      public function set transformY(param1:Number) : void
      {
         if(this.transformY == param1)
         {
            return;
         }
         if(this._layoutFeatures == null)
         {
            this.initAdvancedLayoutFeatures();
         }
         this._layoutFeatures.transformY = param1;
         this.invalidateTransform();
         this.invalidateParentSizeAndDisplayList();
      }
      
      public function get transformZ() : Number
      {
         return this._layoutFeatures == null?Number(0):Number(this._layoutFeatures.transformZ);
      }
      
      public function set transformZ(param1:Number) : void
      {
         if(this.transformZ == param1)
         {
            return;
         }
         if(this._layoutFeatures == null)
         {
            this.initAdvancedLayoutFeatures();
         }
         this._layoutFeatures.transformZ = param1;
         this.invalidateTransform();
         this.invalidateParentSizeAndDisplayList();
      }
      
      override public function get rotation() : Number
      {
         return this._layoutFeatures == null?Number(super.rotation):Number(this._layoutFeatures.layoutRotationZ);
      }
      
      override public function set rotation(param1:Number) : void
      {
         if(this.rotation == param1)
         {
            return;
         }
         this.hasDeltaIdentityTransform = false;
         if(this._layoutFeatures == null)
         {
            super.rotation = MatrixUtil.clampRotation(param1);
         }
         else
         {
            this._layoutFeatures.layoutRotationZ = param1;
         }
         this.invalidateTransform();
         this.invalidateParentSizeAndDisplayList();
      }
      
      override public function get rotationX() : Number
      {
         return this._layoutFeatures == null?Number(super.rotationX):Number(this._layoutFeatures.layoutRotationX);
      }
      
      override public function set rotationX(param1:Number) : void
      {
         if(this.rotationX == param1)
         {
            return;
         }
         if(this._layoutFeatures == null)
         {
            this.initAdvancedLayoutFeatures();
         }
         this._layoutFeatures.layoutRotationX = param1;
         this.invalidateTransform();
         this.invalidateParentSizeAndDisplayList();
      }
      
      override public function get rotationY() : Number
      {
         return this._layoutFeatures == null?Number(super.rotationY):Number(this._layoutFeatures.layoutRotationY);
      }
      
      override public function set rotationY(param1:Number) : void
      {
         if(this.rotationY == param1)
         {
            return;
         }
         if(this._layoutFeatures == null)
         {
            this.initAdvancedLayoutFeatures();
         }
         this._layoutFeatures.layoutRotationY = param1;
         this.invalidateTransform();
         this.invalidateParentSizeAndDisplayList();
      }
      
      override public function get rotationZ() : Number
      {
         return this.rotation;
      }
      
      override public function set rotationZ(param1:Number) : void
      {
         this.rotation = param1;
      }
      
      public function get layoutDirection() : String
      {
         if(this._layoutDirection != null)
         {
            return this._layoutDirection;
         }
         var _loc1_:IVisualElement = this.parent as IVisualElement;
         return !!_loc1_?_loc1_.layoutDirection:LayoutDirection.LTR;
      }
      
      public function set layoutDirection(param1:String) : void
      {
         if(this._layoutDirection == param1)
         {
            return;
         }
         this._layoutDirection = param1;
         this.invalidateLayoutDirection();
      }
      
      public function invalidateLayoutDirection() : void
      {
         var _loc1_:IVisualElement = this.parent as IVisualElement;
         if(!_loc1_)
         {
            return;
         }
         var _loc2_:Boolean = this._layoutDirection != null && this._layoutDirection != _loc1_.layoutDirection;
         if(!!this._layoutFeatures?_loc2_ != this._layoutFeatures.mirror:Boolean(_loc2_))
         {
            if(this._layoutFeatures == null)
            {
               this.initAdvancedLayoutFeatures();
            }
            this._layoutFeatures.mirror = _loc2_;
            this.invalidateTransform();
            this.invalidateParentSizeAndDisplayList();
         }
      }
      
      public function set postLayoutTransformOffsets(param1:TransformOffsets) : void
      {
         if(this._layoutFeatures == null)
         {
            this.initAdvancedLayoutFeatures();
         }
         if(this._layoutFeatures.postLayoutTransformOffsets != null)
         {
            this._layoutFeatures.postLayoutTransformOffsets.removeEventListener(Event.CHANGE,this.transformOffsetsChangedHandler);
         }
         this._layoutFeatures.postLayoutTransformOffsets = param1;
         if(this._layoutFeatures.postLayoutTransformOffsets != null)
         {
            this._layoutFeatures.postLayoutTransformOffsets.addEventListener(Event.CHANGE,this.transformOffsetsChangedHandler);
         }
         this.invalidateTransform();
      }
      
      public function get postLayoutTransformOffsets() : TransformOffsets
      {
         return this._layoutFeatures != null?this._layoutFeatures.postLayoutTransformOffsets:null;
      }
      
      private function transformOffsetsChangedHandler(param1:Event) : void
      {
         this.invalidateTransform();
      }
      
      override public function get transform() : flash.geom.Transform
      {
         if(this._transform == null)
         {
            this.setTransform(new mx.geom.Transform(this));
         }
         return this._transform;
      }
      
      override public function set transform(param1:flash.geom.Transform) : void
      {
         var _loc2_:Matrix = param1.matrix;
         var _loc3_:Matrix3D = param1.matrix3D;
         var _loc4_:ColorTransform = param1.colorTransform;
         var _loc5_:PerspectiveProjection = param1.perspectiveProjection;
         var _loc6_:mx.geom.Transform = param1 as mx.geom.Transform;
         if(_loc6_)
         {
            if(!_loc6_.applyMatrix)
            {
               _loc2_ = null;
            }
            if(!_loc6_.applyMatrix3D)
            {
               _loc3_ = null;
            }
         }
         this.setTransform(param1);
         if(_loc2_ != null)
         {
            this.setLayoutMatrix(_loc2_.clone(),true);
         }
         else if(_loc3_ != null)
         {
            this.setLayoutMatrix3D(_loc3_.clone(),true);
         }
         super.transform.colorTransform = _loc4_;
         super.transform.perspectiveProjection = _loc5_;
         if(this.maintainProjectionCenter)
         {
            this.applyPerspectiveProjection();
         }
      }
      
      mx_internal function get $transform() : flash.geom.Transform
      {
         return super.transform;
      }
      
      public function set maintainProjectionCenter(param1:Boolean) : void
      {
         this._maintainProjectionCenter = param1;
         if(param1 && super.transform.perspectiveProjection == null)
         {
            super.transform.perspectiveProjection = new PerspectiveProjection();
         }
         this.applyPerspectiveProjection();
      }
      
      public function get maintainProjectionCenter() : Boolean
      {
         return this._maintainProjectionCenter;
      }
      
      public function getLayoutMatrix() : Matrix
      {
         if(this._layoutFeatures != null || super.transform.matrix == null)
         {
            if(this._layoutFeatures == null)
            {
               this.initAdvancedLayoutFeatures();
            }
            return this._layoutFeatures.layoutMatrix.clone();
         }
         return super.transform.matrix;
      }
      
      public function setLayoutMatrix(param1:Matrix, param2:Boolean) : void
      {
         this.hasDeltaIdentityTransform = false;
         if(this._layoutFeatures == null)
         {
            super.transform.matrix = param1;
         }
         else
         {
            this._layoutFeatures.layoutMatrix = param1;
            this.invalidateTransform();
         }
         if(param2)
         {
            this.invalidateParentSizeAndDisplayList();
         }
      }
      
      public function getLayoutMatrix3D() : Matrix3D
      {
         if(this._layoutFeatures == null)
         {
            this.initAdvancedLayoutFeatures();
         }
         return this._layoutFeatures.layoutMatrix3D.clone();
      }
      
      public function get hasLayoutMatrix3D() : Boolean
      {
         return !!this._layoutFeatures?Boolean(this._layoutFeatures.layoutIs3D):false;
      }
      
      public function get is3D() : Boolean
      {
         return !!this._layoutFeatures?Boolean(this._layoutFeatures.is3D):false;
      }
      
      public function setLayoutMatrix3D(param1:Matrix3D, param2:Boolean) : void
      {
         if(this._layoutFeatures == null)
         {
            this.initAdvancedLayoutFeatures();
         }
         this._layoutFeatures.layoutMatrix3D = param1;
         this.invalidateTransform();
         if(param2)
         {
            this.invalidateParentSizeAndDisplayList();
         }
      }
      
      private function setTransform(param1:flash.geom.Transform) : void
      {
         var _loc2_:mx.geom.Transform = this._transform as mx.geom.Transform;
         if(_loc2_)
         {
            _loc2_.target = null;
         }
         var _loc3_:mx.geom.Transform = param1 as mx.geom.Transform;
         if(_loc3_)
         {
            _loc3_.target = this;
         }
         this._transform = param1;
      }
      
      public function transformAround(param1:Vector3D, param2:Vector3D = null, param3:Vector3D = null, param4:Vector3D = null, param5:Vector3D = null, param6:Vector3D = null, param7:Vector3D = null, param8:Boolean = true) : void
      {
         var _loc9_:Boolean = false;
         if(!param8)
         {
            _loc9_ = this._includeInLayout;
            this._includeInLayout = false;
         }
         TransformUtil.transformAround(this,param1,param2,param3,param4,param5,param6,param7,this._layoutFeatures,this.initAdvancedLayoutFeatures);
         if(this._layoutFeatures != null)
         {
            this.invalidateTransform();
            this.invalidateParentSizeAndDisplayList();
         }
         if(!param8)
         {
            this._includeInLayout = _loc9_;
         }
      }
      
      public function transformPointToParent(param1:Vector3D, param2:Vector3D, param3:Vector3D) : void
      {
         TransformUtil.transformPointToParent(this,param1,param2,param3,this._layoutFeatures);
      }
      
      protected function invalidateParentSizeAndDisplayList() : void
      {
         if(!this.includeInLayout)
         {
            return;
         }
         var _loc1_:IInvalidating = this.parent as IInvalidating;
         if(!_loc1_)
         {
            return;
         }
         _loc1_.invalidateSize();
         _loc1_.invalidateDisplayList();
      }
      
      private function initAdvancedLayoutFeatures() : AdvancedLayoutFeatures
      {
         var _loc1_:AdvancedLayoutFeatures = new AdvancedLayoutFeatures();
         this.hasDeltaIdentityTransform = false;
         _loc1_.layoutScaleX = this.scaleX;
         _loc1_.layoutScaleY = this.scaleY;
         _loc1_.layoutScaleZ = this.scaleZ;
         _loc1_.layoutRotationX = this.rotationX;
         _loc1_.layoutRotationY = this.rotationY;
         _loc1_.layoutRotationZ = this.rotation;
         _loc1_.layoutX = this.x;
         _loc1_.layoutY = this.y;
         _loc1_.layoutZ = this.z;
         _loc1_.layoutWidth = this._width;
         this._layoutFeatures = _loc1_;
         this.invalidateTransform();
         return _loc1_;
      }
      
      private function invalidateTransform() : void
      {
         if(this._layoutFeatures && this._layoutFeatures.updatePending == false)
         {
            this._layoutFeatures.updatePending = true;
            this.applyComputedMatrix();
         }
      }
      
      private function applyComputedMatrix() : void
      {
         this._layoutFeatures.updatePending = false;
         if(this._layoutFeatures.is3D)
         {
            super.transform.matrix3D = this._layoutFeatures.computedMatrix3D;
         }
         else
         {
            super.transform.matrix = this._layoutFeatures.computedMatrix;
         }
      }
      
      private function applyPerspectiveProjection() : void
      {
         var _loc1_:PerspectiveProjection = super.transform.perspectiveProjection;
         if(_loc1_ != null)
         {
            _loc1_.projectionCenter = new Point(this.width / 2,this.height / 2);
         }
      }
      
      public function getPreferredBoundsWidth(param1:Boolean = true) : Number
      {
         return LayoutElementUIComponentUtils.getPreferredBoundsWidth(this,!!param1?this.nonDeltaLayoutMatrix():null);
      }
      
      public function getPreferredBoundsHeight(param1:Boolean = true) : Number
      {
         return LayoutElementUIComponentUtils.getPreferredBoundsHeight(this,!!param1?this.nonDeltaLayoutMatrix():null);
      }
      
      public function getMinBoundsWidth(param1:Boolean = true) : Number
      {
         return LayoutElementUIComponentUtils.getMinBoundsWidth(this,!!param1?this.nonDeltaLayoutMatrix():null);
      }
      
      public function getMinBoundsHeight(param1:Boolean = true) : Number
      {
         return LayoutElementUIComponentUtils.getMinBoundsHeight(this,!!param1?this.nonDeltaLayoutMatrix():null);
      }
      
      public function getMaxBoundsWidth(param1:Boolean = true) : Number
      {
         return LayoutElementUIComponentUtils.getMaxBoundsWidth(this,!!param1?this.nonDeltaLayoutMatrix():null);
      }
      
      public function getMaxBoundsHeight(param1:Boolean = true) : Number
      {
         return LayoutElementUIComponentUtils.getMaxBoundsHeight(this,!!param1?this.nonDeltaLayoutMatrix():null);
      }
      
      public function getBoundsXAtSize(param1:Number, param2:Number, param3:Boolean = true) : Number
      {
         return LayoutElementUIComponentUtils.getBoundsXAtSize(this,param1,param2,!!param3?this.nonDeltaLayoutMatrix():null);
      }
      
      public function getBoundsYAtSize(param1:Number, param2:Number, param3:Boolean = true) : Number
      {
         return LayoutElementUIComponentUtils.getBoundsYAtSize(this,param1,param2,!!param3?this.nonDeltaLayoutMatrix():null);
      }
      
      public function getLayoutBoundsWidth(param1:Boolean = true) : Number
      {
         return LayoutElementUIComponentUtils.getLayoutBoundsWidth(this,!!param1?this.nonDeltaLayoutMatrix():null);
      }
      
      public function getLayoutBoundsHeight(param1:Boolean = true) : Number
      {
         return LayoutElementUIComponentUtils.getLayoutBoundsHeight(this,!!param1?this.nonDeltaLayoutMatrix():null);
      }
      
      public function getLayoutBoundsX(param1:Boolean = true) : Number
      {
         return LayoutElementUIComponentUtils.getLayoutBoundsX(this,!!param1?this.nonDeltaLayoutMatrix():null);
      }
      
      public function getLayoutBoundsY(param1:Boolean = true) : Number
      {
         return LayoutElementUIComponentUtils.getLayoutBoundsY(this,!!param1?this.nonDeltaLayoutMatrix():null);
      }
      
      public function setLayoutBoundsPosition(param1:Number, param2:Number, param3:Boolean = true) : void
      {
         LayoutElementUIComponentUtils.setLayoutBoundsPosition(this,param1,param2,!!param3?this.nonDeltaLayoutMatrix():null);
      }
      
      public function setLayoutBoundsSize(param1:Number, param2:Number, param3:Boolean = true) : void
      {
         LayoutElementUIComponentUtils.setLayoutBoundsSize(this,param1,param2,!!param3?this.nonDeltaLayoutMatrix():null);
      }
      
      private function nonDeltaLayoutMatrix() : Matrix
      {
         if(this.hasDeltaIdentityTransform)
         {
            return null;
         }
         if(this._layoutFeatures != null)
         {
            return this._layoutFeatures.layoutMatrix;
         }
         return MatrixUtil.composeMatrix(this.x,this.y,1,1,this.rotation,this.transformX,this.transformY);
      }
      
      protected function get bounds() : Rectangle
      {
         if(this.boundingBoxName && this.boundingBoxName != "" && this.boundingBoxName in this && this[this.boundingBoxName])
         {
            return this[this.boundingBoxName].getBounds(this);
         }
         return getBounds(this);
      }
      
      override public function get parent() : DisplayObjectContainer
      {
         return !!this._parent?this._parent:super.parent;
      }
      
      public function get parentDocument() : Object
      {
         var _loc1_:IUIComponent = null;
         var _loc2_:ISystemManager = null;
         if(this.document == this)
         {
            _loc1_ = this.parent as IUIComponent;
            if(_loc1_)
            {
               return _loc1_.document;
            }
            _loc2_ = this.parent as ISystemManager;
            if(_loc2_)
            {
               return _loc2_.document;
            }
            return null;
         }
         return this.document;
      }
      
      public function get currentState() : String
      {
         return this._currentState;
      }
      
      public function set currentState(param1:String) : void
      {
         var _loc2_:* = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:StateChangeEvent = null;
         if(param1 == this._currentState)
         {
            return;
         }
         if(!this.stateMap)
         {
            this.buildStateMap();
         }
         if(this.stateMap[param1])
         {
            _loc2_ = this._currentState + "-" + param1 + ":start";
            if(this.stateMap[_loc2_])
            {
               _loc3_ = this.stateMap[_loc2_].frame;
               _loc4_ = this.stateMap[this._currentState + "-" + param1 + ":end"].frame;
            }
            if(isNaN(_loc3_))
            {
               _loc2_ = param1 + "-" + this._currentState + ":end";
               if(this.stateMap[_loc2_])
               {
                  _loc3_ = this.stateMap[_loc2_].frame;
                  _loc4_ = this.stateMap[param1 + "-" + this._currentState + ":start"].frame;
               }
            }
            if(isNaN(_loc3_))
            {
               _loc2_ = "*-" + param1 + ":start";
               if(this.stateMap[_loc2_])
               {
                  _loc3_ = this.stateMap[_loc2_].frame;
                  _loc4_ = this.stateMap["*-" + param1 + ":end"].frame;
               }
            }
            if(isNaN(_loc3_))
            {
               _loc2_ = param1 + "-*:end";
               if(this.stateMap[_loc2_])
               {
                  _loc3_ = this.stateMap[_loc2_].frame;
                  _loc4_ = this.stateMap[param1 + "-*:start"].frame;
               }
            }
            if(isNaN(_loc3_))
            {
               _loc2_ = this._currentState + "-*:start";
               if(this.stateMap[_loc2_])
               {
                  _loc3_ = this.stateMap[_loc2_].frame;
                  _loc4_ = this.stateMap[this._currentState + "-*:end"].frame;
               }
            }
            if(isNaN(_loc3_))
            {
               _loc2_ = "*-" + this._currentState + ":end";
               if(this.stateMap[_loc2_])
               {
                  _loc3_ = this.stateMap[_loc2_].frame;
                  _loc4_ = this.stateMap["*-" + this._currentState + ":start"].frame;
               }
            }
            if(isNaN(_loc3_))
            {
               _loc2_ = "*-*:start";
               if(this.stateMap[_loc2_])
               {
                  _loc3_ = this.stateMap[_loc2_].frame;
                  _loc4_ = this.stateMap["*-*:end"].frame;
               }
            }
            if(isNaN(_loc3_) && param1 in this.stateMap)
            {
               _loc3_ = this.stateMap[param1].frame;
            }
            if(isNaN(_loc3_))
            {
               return;
            }
            _loc5_ = new StateChangeEvent(StateChangeEvent.CURRENT_STATE_CHANGING);
            _loc5_.oldState = this._currentState;
            _loc5_.newState = param1;
            dispatchEvent(_loc5_);
            if(isNaN(_loc4_))
            {
               gotoAndStop(_loc3_);
               this.transitionDirection = 0;
            }
            else
            {
               addEventListener(Event.ENTER_FRAME,this.transitionEnterFrameHandler,false,0,true);
               if(currentFrame < Math.min(_loc3_,_loc4_) || currentFrame > Math.max(_loc3_,_loc4_))
               {
                  gotoAndStop(_loc3_);
               }
               else
               {
                  _loc3_ = currentFrame;
               }
               this.transitionStartFrame = _loc3_;
               this.transitionEndFrame = _loc4_;
               this.transitionDirection = _loc4_ > _loc3_?Number(1):Number(-1);
               this.transitionEndState = param1;
            }
            _loc5_ = new StateChangeEvent(StateChangeEvent.CURRENT_STATE_CHANGE);
            _loc5_.oldState = this._currentState;
            _loc5_.newState = param1;
            dispatchEvent(_loc5_);
            this._currentState = param1;
         }
      }
      
      override public function get tabEnabled() : Boolean
      {
         return super.tabEnabled;
      }
      
      override public function set tabEnabled(param1:Boolean) : void
      {
         super.tabEnabled = param1;
         this.explicitTabEnabledChanged = true;
      }
      
      public function initialize() : void
      {
         var _loc2_:IUIComponent = null;
         this.initialized = true;
         dispatchEvent(new FlexEvent(FlexEvent.PREINITIALIZE));
         if(this.boundingBoxName && this.boundingBoxName != "" && this.boundingBoxName in this && this[this.boundingBoxName])
         {
            this[this.boundingBoxName].visible = false;
         }
         this.validateMeasuredSize();
         if(isNaN(this.oldX))
         {
            this.oldX = this.x;
         }
         if(isNaN(this.oldY))
         {
            this.oldY = this.y;
         }
         if(isNaN(this.oldWidth))
         {
            this.oldWidth = this._width = this.measuredWidth;
         }
         if(isNaN(this.oldHeight))
         {
            this.oldHeight = this._height = this.measuredHeight;
         }
         if(this.explicitSizeChanged)
         {
            this.explicitSizeChanged = false;
            this.setActualSize(this.getExplicitOrMeasuredWidth(),this.getExplicitOrMeasuredHeight());
         }
         this.findFocusCandidates(this);
         var _loc1_:int = 0;
         while(_loc1_ < numChildren)
         {
            _loc2_ = getChildAt(_loc1_) as IUIComponent;
            if(_loc2_)
            {
               _loc2_.initialize();
            }
            _loc1_++;
         }
         dispatchEvent(new FlexEvent(FlexEvent.INITIALIZE));
         dispatchEvent(new FlexEvent(FlexEvent.CREATION_COMPLETE));
      }
      
      public function parentChanged(param1:DisplayObjectContainer) : void
      {
         if(!param1)
         {
            this._parent = null;
         }
         else if(param1 is IUIComponent || param1 is ISystemManager)
         {
            this._parent = param1;
         }
         else
         {
            this._parent = param1.parent;
         }
      }
      
      public function getExplicitOrMeasuredWidth() : Number
      {
         var _loc1_:Number = NaN;
         if(isNaN(this.explicitWidth))
         {
            _loc1_ = this.measuredWidth;
            if(!isNaN(this.explicitMinWidth) && _loc1_ < this.explicitMinWidth)
            {
               _loc1_ = this.explicitMinWidth;
            }
            if(!isNaN(this.explicitMaxWidth) && _loc1_ > this.explicitMaxWidth)
            {
               _loc1_ = this.explicitMaxWidth;
            }
            return _loc1_;
         }
         return this.explicitWidth;
      }
      
      public function getExplicitOrMeasuredHeight() : Number
      {
         var _loc1_:Number = NaN;
         if(isNaN(this.explicitHeight))
         {
            _loc1_ = this.measuredHeight;
            if(!isNaN(this.explicitMinHeight) && _loc1_ < this.explicitMinHeight)
            {
               _loc1_ = this.explicitMinHeight;
            }
            if(!isNaN(this.explicitMaxHeight) && _loc1_ > this.explicitMaxHeight)
            {
               _loc1_ = this.explicitMaxHeight;
            }
            return _loc1_;
         }
         return this.explicitHeight;
      }
      
      public function setVisible(param1:Boolean, param2:Boolean = false) : void
      {
         this._visible = param1;
         if(this.designLayer && !this.designLayer.effectiveVisibility)
         {
            param1 = false;
         }
         if(super.visible == param1)
         {
            return;
         }
         super.visible = param1;
         if(!param2)
         {
            dispatchEvent(new FlexEvent(!!param1?FlexEvent.SHOW:FlexEvent.HIDE));
         }
      }
      
      public function owns(param1:DisplayObject) : Boolean
      {
         while(param1 && param1 != this)
         {
            if(param1 is IUIComponent)
            {
               param1 = IUIComponent(param1).owner;
            }
            else
            {
               param1 = param1.parent;
            }
         }
         return param1 == this;
      }
      
      public function move(param1:Number, param2:Number) : void
      {
         var _loc3_:Boolean = false;
         if(param1 != this.x)
         {
            if(this._layoutFeatures == null)
            {
               super.x = param1;
            }
            else
            {
               this._layoutFeatures.layoutX = param1;
            }
            dispatchEvent(new Event("xChanged"));
            _loc3_ = true;
         }
         if(param2 != this.y)
         {
            if(this._layoutFeatures == null)
            {
               super.y = param2;
            }
            else
            {
               this._layoutFeatures.layoutY = param2;
            }
            dispatchEvent(new Event("yChanged"));
            _loc3_ = true;
         }
         if(_loc3_)
         {
            this.invalidateTransform();
            this.dispatchMoveEvent();
         }
      }
      
      public function setActualSize(param1:Number, param2:Number) : void
      {
         this._width = param1;
         this._height = param2;
         var _loc3_:Number = param1 / this.measuredWidth;
         var _loc4_:Number = param2 / this.measuredHeight;
         if(_loc3_ != 1 || _loc4_ != 1 || this._layoutFeatures != null)
         {
            if(this._layoutFeatures == null)
            {
               this.initAdvancedLayoutFeatures();
            }
            this._layoutFeatures.stretchX = _loc3_;
            this._layoutFeatures.stretchY = _loc4_;
            this.invalidateTransform();
         }
         if(this.sizeChanged(this.width,this.oldWidth) || this.sizeChanged(this.height,this.oldHeight))
         {
            this.dispatchResizeEvent();
         }
      }
      
      public function setFocus() : void
      {
         stage.focus = this.focusableObjects[!!this.reverseDirectionFocus?this.focusableObjects.length - 1:0];
         this.addFocusEventListeners();
      }
      
      public function drawFocus(param1:Boolean) : void
      {
      }
      
      private function validateMeasuredSize() : void
      {
         if(this.validateMeasuredSizeFlag)
         {
            this.validateMeasuredSizeFlag = false;
            this._measuredWidth = this.bounds.width;
            this._measuredHeight = this.bounds.height;
         }
      }
      
      protected function notifySizeChanged() : void
      {
         this.invalidateParentSizeAndDisplayList();
      }
      
      private function dispatchMoveEvent() : void
      {
         var _loc1_:MoveEvent = new MoveEvent(MoveEvent.MOVE);
         _loc1_.oldX = this.oldX;
         _loc1_.oldY = this.oldY;
         dispatchEvent(_loc1_);
         this.oldX = this.x;
         this.oldY = this.y;
      }
      
      protected function dispatchResizeEvent() : void
      {
         var _loc1_:ResizeEvent = new ResizeEvent(ResizeEvent.RESIZE);
         _loc1_.oldWidth = this.oldWidth;
         _loc1_.oldHeight = this.oldHeight;
         dispatchEvent(_loc1_);
         this.oldWidth = this.width;
         this.oldHeight = this.height;
      }
      
      protected function sizeChanged(param1:Number, param2:Number) : Boolean
      {
         return Math.abs(param1 - param2) > 1;
      }
      
      protected function findFocusCandidates(param1:DisplayObjectContainer) : void
      {
         var _loc3_:InteractiveObject = null;
         var _loc2_:int = 0;
         while(_loc2_ < param1.numChildren)
         {
            _loc3_ = param1.getChildAt(_loc2_) as InteractiveObject;
            if(_loc3_ && _loc3_.tabEnabled)
            {
               this.focusableObjects.push(_loc3_);
               if(!this.explicitTabEnabledChanged)
               {
                  this.tabEnabled = true;
                  this.tabFocusEnabled = true;
               }
            }
            if(_loc3_ is DisplayObjectContainer)
            {
               this.findFocusCandidates(DisplayObjectContainer(_loc3_));
            }
            _loc2_++;
         }
      }
      
      private function buildStateMap() : void
      {
         var _loc1_:Array = currentLabels;
         this.stateMap = {};
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.length)
         {
            this.stateMap[_loc1_[_loc2_].name] = _loc1_[_loc2_];
            _loc2_++;
         }
      }
      
      protected function enterFrameHandler(param1:Event) : void
      {
         if(this.explicitSizeChanged)
         {
            this.explicitSizeChanged = false;
            this.setActualSize(this.getExplicitOrMeasuredWidth(),this.getExplicitOrMeasuredHeight());
         }
         if(this.x != this.oldX || this.y != this.oldY)
         {
            this.dispatchMoveEvent();
         }
         removeEventListener(Event.ENTER_FRAME,this.enterFrameHandler);
      }
      
      protected function autoUpdateMeasuredSizeEnterFrameHandler(param1:Event) : void
      {
         var _loc2_:Rectangle = this.bounds;
         if(this._layoutFeatures != null)
         {
            _loc2_.width = _loc2_.width * this._layoutFeatures.stretchX;
            _loc2_.height = _loc2_.height * this._layoutFeatures.stretchY;
         }
         if(this.sizeChanged(_loc2_.width,this.oldWidth) || this.sizeChanged(_loc2_.height,this.oldHeight))
         {
            this._width = _loc2_.width;
            this._height = _loc2_.height;
            this.validateMeasuredSizeFlag = true;
            this.notifySizeChanged();
            this.dispatchResizeEvent();
         }
         else if(this.sizeChanged(this.width,this.oldWidth) || this.sizeChanged(this.height,this.oldHeight))
         {
            this.dispatchResizeEvent();
         }
      }
      
      protected function autoUpdateCurrentStateEnterFrameHandler(param1:Event) : void
      {
         if(currentLabel && currentLabel.indexOf(":") < 0 && currentLabel != this._currentState)
         {
            this._currentState = currentLabel;
         }
      }
      
      private function setUpFirstCurrentState(param1:Event) : void
      {
         removeEventListener(Event.ENTER_FRAME,this.setUpFirstCurrentState);
         if(currentLabel && currentLabel.indexOf(":") < 0 && currentLabel != this._currentState)
         {
            this._currentState = currentLabel;
         }
      }
      
      protected function transitionEnterFrameHandler(param1:Event) : void
      {
         var _loc2_:Number = currentFrame + this.transitionDirection;
         if(this.transitionDirection > 0 && _loc2_ >= this.transitionEndFrame || this.transitionDirection < 0 && _loc2_ <= this.transitionEndFrame)
         {
            gotoAndStop(this.stateMap[this.transitionEndState].frame);
            this.transitionDirection = 0;
            removeEventListener(Event.ENTER_FRAME,this.transitionEnterFrameHandler);
         }
         else
         {
            gotoAndStop(_loc2_);
         }
      }
      
      private function addFocusEventListeners() : void
      {
         try
         {
            stage.addEventListener(FocusEvent.KEY_FOCUS_CHANGE,this.keyFocusChangeHandler,false,1,true);
            stage.addEventListener(FocusEvent.FOCUS_OUT,this.focusOutHandler,false,0,true);
         }
         catch(err:SecurityError)
         {
            systemManager.addEventListener(FocusEvent.KEY_FOCUS_CHANGE,keyFocusChangeHandler,false,1,true);
            systemManager.addEventListener(FocusEvent.FOCUS_OUT,focusOutHandler,false,0,true);
         }
         this.focusListenersAdded = true;
      }
      
      private function removeFocusEventListeners() : void
      {
         try
         {
            if(stage)
            {
               stage.removeEventListener(FocusEvent.KEY_FOCUS_CHANGE,this.keyFocusChangeHandler);
               stage.removeEventListener(FocusEvent.FOCUS_OUT,this.focusOutHandler);
            }
         }
         catch(err:SecurityError)
         {
            systemManager.removeEventListener(FocusEvent.KEY_FOCUS_CHANGE,keyFocusChangeHandler);
            systemManager.removeEventListener(FocusEvent.FOCUS_OUT,focusOutHandler);
         }
         this.focusListenersAdded = false;
      }
      
      private function keyFocusChangeHandler(param1:FocusEvent) : void
      {
         if(param1.keyCode == Keyboard.TAB)
         {
            if(stage.focus == this.focusableObjects[!!param1.shiftKey?0:this.focusableObjects.length - 1])
            {
               this.removeFocusEventListeners();
            }
            else
            {
               param1.stopImmediatePropagation();
            }
         }
      }
      
      protected function focusInHandler(param1:FocusEvent) : void
      {
         if(!this.focusListenersAdded)
         {
            this.addFocusEventListeners();
         }
      }
      
      private function focusOutHandler(param1:FocusEvent) : void
      {
         if(this.focusableObjects.indexOf(param1.relatedObject) == -1)
         {
            this.removeFocusEventListeners();
         }
      }
      
      private function keyFocusChangeCaptureHandler(param1:FocusEvent) : void
      {
         this.reverseDirectionFocus = param1.shiftKey;
      }
      
      private function creationCompleteHandler(param1:Event) : void
      {
         var event:Event = param1;
         removeEventListener(FlexEvent.CREATION_COMPLETE,this.creationCompleteHandler);
         if(this.systemManager)
         {
            try
            {
               this.systemManager.stage.addEventListener(FocusEvent.KEY_FOCUS_CHANGE,this.keyFocusChangeCaptureHandler,true,0,true);
            }
            catch(err:SecurityError)
            {
               systemManager.addEventListener(FocusEvent.KEY_FOCUS_CHANGE,keyFocusChangeCaptureHandler,true,0,true);
            }
         }
         else if(this.parentDocument && this.parentDocument.systemManager)
         {
            try
            {
               this.parentDocument.systemManager.stage.addEventListener(FocusEvent.KEY_FOCUS_CHANGE,this.keyFocusChangeCaptureHandler,true,0,true);
               return;
            }
            catch(err:SecurityError)
            {
               parentDocument.systemManager.addEventListener(FocusEvent.KEY_FOCUS_CHANGE,keyFocusChangeCaptureHandler,true,0,true);
               return;
            }
         }
      }
      
      protected function layer_PropertyChange(param1:PropertyChangeEvent) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:Number = NaN;
         switch(param1.property)
         {
            case "effectiveVisibility":
               _loc2_ = param1.newValue && this._visible;
               if(_loc2_ != super.visible)
               {
                  super.visible = _loc2_;
               }
               break;
            case "effectiveAlpha":
               _loc3_ = Number(param1.newValue) * this._alpha;
               if(_loc3_ != super.alpha)
               {
                  super.alpha = _loc3_;
               }
         }
      }
      
      public function get automationDelegate() : Object
      {
         return this._automationDelegate;
      }
      
      public function set automationDelegate(param1:Object) : void
      {
         this._automationDelegate = param1 as IAutomationObject;
      }
      
      public function get automationName() : String
      {
         if(this._automationName)
         {
            return this._automationName;
         }
         if(this.automationDelegate)
         {
            return this.automationDelegate.automationName;
         }
         return "";
      }
      
      public function set automationName(param1:String) : void
      {
         this._automationName = param1;
      }
      
      public function get automationValue() : Array
      {
         if(this.automationDelegate)
         {
            return this.automationDelegate.automationValue;
         }
         return [];
      }
      
      public function get automationOwner() : DisplayObjectContainer
      {
         return this.owner;
      }
      
      public function get automationParent() : DisplayObjectContainer
      {
         return this.parent;
      }
      
      public function get automationEnabled() : Boolean
      {
         return enabled;
      }
      
      public function get automationVisible() : Boolean
      {
         return this.visible;
      }
      
      public function get showInAutomationHierarchy() : Boolean
      {
         return this._showInAutomationHierarchy;
      }
      
      public function set showInAutomationHierarchy(param1:Boolean) : void
      {
         this._showInAutomationHierarchy = param1;
      }
      
      public function createAutomationIDPart(param1:IAutomationObject) : Object
      {
         if(this.automationDelegate)
         {
            return this.automationDelegate.createAutomationIDPart(param1);
         }
         return null;
      }
      
      public function createAutomationIDPartWithRequiredProperties(param1:IAutomationObject, param2:Array) : Object
      {
         if(this.automationDelegate)
         {
            return this.automationDelegate.createAutomationIDPartWithRequiredProperties(param1,param2);
         }
         return null;
      }
      
      public function resolveAutomationIDPart(param1:Object) : Array
      {
         if(this.automationDelegate)
         {
            return this.automationDelegate.resolveAutomationIDPart(param1);
         }
         return [];
      }
      
      public function getAutomationChildAt(param1:int) : IAutomationObject
      {
         if(this.automationDelegate)
         {
            return this.automationDelegate.getAutomationChildAt(param1);
         }
         return null;
      }
      
      public function getAutomationChildren() : Array
      {
         if(this.automationDelegate)
         {
            return this.automationDelegate.getAutomationChildren();
         }
         return null;
      }
      
      public function get numAutomationChildren() : int
      {
         if(this.automationDelegate)
         {
            return this.automationDelegate.numAutomationChildren;
         }
         return 0;
      }
      
      public function get automationTabularData() : Object
      {
         if(this.automationDelegate)
         {
            return this.automationDelegate.automationTabularData;
         }
         return null;
      }
      
      public function replayAutomatableEvent(param1:Event) : Boolean
      {
         if(this.automationDelegate)
         {
            return this.automationDelegate.replayAutomatableEvent(param1);
         }
         return false;
      }
      
      public function set right(param1:Object) : void
      {
         var _loc2_:Object = this.right;
         if(_loc2_ !== param1)
         {
            this._108511772right = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"right",_loc2_,param1));
            }
         }
      }
      
      public function set top(param1:Object) : void
      {
         var _loc2_:Object = this.top;
         if(_loc2_ !== param1)
         {
            this._115029top = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"top",_loc2_,param1));
            }
         }
      }
      
      public function set baseline(param1:Object) : void
      {
         var _loc2_:Object = this.baseline;
         if(_loc2_ !== param1)
         {
            this._1720785339baseline = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"baseline",_loc2_,param1));
            }
         }
      }
      
      public function set left(param1:Object) : void
      {
         var _loc2_:Object = this.left;
         if(_loc2_ !== param1)
         {
            this._3317767left = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"left",_loc2_,param1));
            }
         }
      }
      
      public function set bottom(param1:Object) : void
      {
         var _loc2_:Object = this.bottom;
         if(_loc2_ !== param1)
         {
            this._1383228885bottom = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bottom",_loc2_,param1));
            }
         }
      }
      
      public function set horizontalCenter(param1:Object) : void
      {
         var _loc2_:Object = this.horizontalCenter;
         if(_loc2_ !== param1)
         {
            this._2016110183horizontalCenter = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"horizontalCenter",_loc2_,param1));
            }
         }
      }
      
      public function set verticalCenter(param1:Object) : void
      {
         var _loc2_:Object = this.verticalCenter;
         if(_loc2_ !== param1)
         {
            this._926273685verticalCenter = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"verticalCenter",_loc2_,param1));
            }
         }
      }
   }
}
