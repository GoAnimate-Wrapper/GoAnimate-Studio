package anifire.studio.skins
{
   import anifire.studio.components.DefaultDropDownListItemRenderer;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.ClassFactory;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.SetStyle;
   import mx.states.State;
   import spark.components.Button;
   import spark.components.DataGroup;
   import spark.components.DropDownList;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.PopUpAnchor;
   import spark.components.Scroller;
   import spark.layouts.VerticalLayout;
   import spark.primitives.BitmapImage;
   import spark.primitives.Rect;
   import spark.primitives.RectangularDropShadow;
   import spark.skins.SparkSkin;
   
   use namespace mx_internal;
   
   public class DefaultDropDownListSkin extends SparkSkin implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _1391998104bgFill:SolidColor;
      
      private var _1383304148border:Rect;
      
      private var _1395787140borderStroke:SolidColorStroke;
      
      private var _385593099dataGroup:DataGroup;
      
      private var _433014735dropDown:Group;
      
      private var _906978543dropShadow:RectangularDropShadow;
      
      private var _1031744009iconDisplay:BitmapImage;
      
      private var _1184053038labelDisplay:Label;
      
      private var _137111012openButton:Button;
      
      private var _106851532popUp:PopUpAnchor;
      
      private var _402164678scroller:Scroller;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:DropDownList;
      
      public function DefaultDropDownListSkin()
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
         bindings = this._DefaultDropDownListSkin_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_skins_DefaultDropDownListSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return DefaultDropDownListSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 110;
         this.minHeight = 32;
         this.mxmlContent = [this._DefaultDropDownListSkin_Button1_i(),this._DefaultDropDownListSkin_HGroup1_c()];
         this.currentState = "normal";
         var _DefaultDropDownListSkin_PopUpAnchor1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._DefaultDropDownListSkin_PopUpAnchor1_i,this._DefaultDropDownListSkin_PopUpAnchor1_r);
         states = [new State({
            "name":"normal",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"popUp",
               "name":"displayPopUp",
               "value":false
            })]
         }),new State({
            "name":"open",
            "overrides":[new AddItems().initializeFromObject({
               "destructionPolicy":"auto",
               "itemsFactory":_DefaultDropDownListSkin_PopUpAnchor1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new SetProperty().initializeFromObject({
               "target":"popUp",
               "name":"displayPopUp",
               "value":true
            })]
         }),new State({
            "name":"disabled",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"openButton",
               "name":"enabled",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"iconDisplay",
               "name":"alpha",
               "value":0.5
            }),new SetStyle().initializeFromObject({
               "target":"labelDisplay",
               "name":"color",
               "value":11184810
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
         DefaultDropDownListSkin._watcherSetupUtil = param1;
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
      
      protected function getIconFromItem(param1:Object) : Class
      {
         if(param1)
         {
            return param1.icon;
         }
         return null;
      }
      
      private function _DefaultDropDownListSkin_PopUpAnchor1_i() : PopUpAnchor
      {
         var _loc1_:PopUpAnchor = new PopUpAnchor();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.popUpPosition = "below";
         _loc1_.popUpWidthMatchesAnchorWidth = false;
         _loc1_.popUp = this._DefaultDropDownListSkin_Group1_i();
         _loc1_.id = "popUp";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.popUp = _loc1_;
         BindingManager.executeBindings(this,"popUp",this.popUp);
         return _loc1_;
      }
      
      private function _DefaultDropDownListSkin_PopUpAnchor1_r() : void
      {
      }
      
      private function _DefaultDropDownListSkin_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._DefaultDropDownListSkin_RectangularDropShadow1_i(),this._DefaultDropDownListSkin_Rect1_i(),this._DefaultDropDownListSkin_Scroller1_i()];
         _loc1_.id = "dropDown";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dropDown = _loc1_;
         BindingManager.executeBindings(this,"dropDown",this.dropDown);
         return _loc1_;
      }
      
      private function _DefaultDropDownListSkin_RectangularDropShadow1_i() : RectangularDropShadow
      {
         var _loc1_:RectangularDropShadow = new RectangularDropShadow();
         _loc1_.blurX = 20;
         _loc1_.blurY = 20;
         _loc1_.alpha = 0.45;
         _loc1_.distance = 7;
         _loc1_.blRadius = 3;
         _loc1_.brRadius = 3;
         _loc1_.tlRadius = 3;
         _loc1_.trRadius = 3;
         _loc1_.angle = 90;
         _loc1_.color = 0;
         _loc1_.left = 0;
         _loc1_.top = 0;
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.id = "dropShadow";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dropShadow = _loc1_;
         BindingManager.executeBindings(this,"dropShadow",this.dropShadow);
         return _loc1_;
      }
      
      private function _DefaultDropDownListSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.radiusX = 3;
         _loc1_.stroke = this._DefaultDropDownListSkin_SolidColorStroke1_i();
         _loc1_.fill = this._DefaultDropDownListSkin_SolidColor1_i();
         _loc1_.initialized(this,"border");
         this.border = _loc1_;
         BindingManager.executeBindings(this,"border",this.border);
         return _loc1_;
      }
      
      private function _DefaultDropDownListSkin_SolidColorStroke1_i() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.weight = 1;
         _loc1_.color = 10526623;
         this.borderStroke = _loc1_;
         BindingManager.executeBindings(this,"borderStroke",this.borderStroke);
         return _loc1_;
      }
      
      private function _DefaultDropDownListSkin_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         this.bgFill = _loc1_;
         BindingManager.executeBindings(this,"bgFill",this.bgFill);
         return _loc1_;
      }
      
      private function _DefaultDropDownListSkin_Scroller1_i() : Scroller
      {
         var _loc1_:Scroller = new Scroller();
         _loc1_.left = 0;
         _loc1_.top = 3;
         _loc1_.right = 0;
         _loc1_.bottom = 3;
         _loc1_.hasFocusableChildren = false;
         _loc1_.minViewportInset = 1;
         _loc1_.buttonMode = true;
         _loc1_.viewport = this._DefaultDropDownListSkin_DataGroup1_i();
         _loc1_.setStyle("skinClass",MinimalScrollerSkin);
         _loc1_.id = "scroller";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.scroller = _loc1_;
         BindingManager.executeBindings(this,"scroller",this.scroller);
         return _loc1_;
      }
      
      private function _DefaultDropDownListSkin_DataGroup1_i() : DataGroup
      {
         var _loc1_:DataGroup = new DataGroup();
         _loc1_.itemRenderer = this._DefaultDropDownListSkin_ClassFactory1_c();
         _loc1_.layout = this._DefaultDropDownListSkin_VerticalLayout1_c();
         _loc1_.id = "dataGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dataGroup = _loc1_;
         BindingManager.executeBindings(this,"dataGroup",this.dataGroup);
         return _loc1_;
      }
      
      private function _DefaultDropDownListSkin_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = DefaultDropDownListItemRenderer;
         return _loc1_;
      }
      
      private function _DefaultDropDownListSkin_VerticalLayout1_c() : VerticalLayout
      {
         var _loc1_:VerticalLayout = new VerticalLayout();
         _loc1_.gap = 0;
         _loc1_.horizontalAlign = "contentJustify";
         _loc1_.requestedMinRowCount = 1;
         _loc1_.requestedMaxRowCount = 6;
         return _loc1_;
      }
      
      private function _DefaultDropDownListSkin_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.buttonMode = true;
         _loc1_.focusEnabled = false;
         _loc1_.tabEnabled = false;
         _loc1_.setStyle("skinClass",DefaultDropDownListButtonSkin);
         _loc1_.id = "openButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.openButton = _loc1_;
         BindingManager.executeBindings(this,"openButton",this.openButton);
         return _loc1_;
      }
      
      private function _DefaultDropDownListSkin_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = null;
         _loc1_ = new HGroup();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.paddingLeft = 6;
         _loc1_.paddingRight = 30;
         _loc1_.minWidth = 75;
         _loc1_.verticalAlign = "middle";
         _loc1_.mouseEnabled = false;
         _loc1_.mouseChildren = false;
         _loc1_.mxmlContent = [this._DefaultDropDownListSkin_BitmapImage1_i(),this._DefaultDropDownListSkin_Label1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _DefaultDropDownListSkin_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.initialized(this,"iconDisplay");
         this.iconDisplay = _loc1_;
         BindingManager.executeBindings(this,"iconDisplay",this.iconDisplay);
         return _loc1_;
      }
      
      private function _DefaultDropDownListSkin_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.maxDisplayedLines = 1;
         _loc1_.minWidth = 75;
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.id = "labelDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.labelDisplay = _loc1_;
         BindingManager.executeBindings(this,"labelDisplay",this.labelDisplay);
         return _loc1_;
      }
      
      private function _DefaultDropDownListSkin_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Number
         {
            return popUp.width;
         },null,"dropDown.minWidth");
         result[1] = new Binding(this,function():Object
         {
            return getIconFromItem(hostComponent.selectedItem);
         },null,"iconDisplay.source");
         result[2] = new Binding(this,function():Boolean
         {
            return getIconFromItem(hostComponent.selectedItem) != null;
         },null,"iconDisplay.includeInLayout");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get bgFill() : SolidColor
      {
         return this._1391998104bgFill;
      }
      
      public function set bgFill(param1:SolidColor) : void
      {
         var _loc2_:Object = this._1391998104bgFill;
         if(_loc2_ !== param1)
         {
            this._1391998104bgFill = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bgFill",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get border() : Rect
      {
         return this._1383304148border;
      }
      
      public function set border(param1:Rect) : void
      {
         var _loc2_:Object = this._1383304148border;
         if(_loc2_ !== param1)
         {
            this._1383304148border = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"border",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get borderStroke() : SolidColorStroke
      {
         return this._1395787140borderStroke;
      }
      
      public function set borderStroke(param1:SolidColorStroke) : void
      {
         var _loc2_:Object = this._1395787140borderStroke;
         if(_loc2_ !== param1)
         {
            this._1395787140borderStroke = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"borderStroke",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dataGroup() : DataGroup
      {
         return this._385593099dataGroup;
      }
      
      public function set dataGroup(param1:DataGroup) : void
      {
         var _loc2_:Object = this._385593099dataGroup;
         if(_loc2_ !== param1)
         {
            this._385593099dataGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dataGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dropDown() : Group
      {
         return this._433014735dropDown;
      }
      
      public function set dropDown(param1:Group) : void
      {
         var _loc2_:Object = this._433014735dropDown;
         if(_loc2_ !== param1)
         {
            this._433014735dropDown = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dropDown",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get dropShadow() : RectangularDropShadow
      {
         return this._906978543dropShadow;
      }
      
      public function set dropShadow(param1:RectangularDropShadow) : void
      {
         var _loc2_:Object = this._906978543dropShadow;
         if(_loc2_ !== param1)
         {
            this._906978543dropShadow = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dropShadow",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get iconDisplay() : BitmapImage
      {
         return this._1031744009iconDisplay;
      }
      
      public function set iconDisplay(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1031744009iconDisplay;
         if(_loc2_ !== param1)
         {
            this._1031744009iconDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"iconDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get labelDisplay() : Label
      {
         return this._1184053038labelDisplay;
      }
      
      public function set labelDisplay(param1:Label) : void
      {
         var _loc2_:Object = this._1184053038labelDisplay;
         if(_loc2_ !== param1)
         {
            this._1184053038labelDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"labelDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get openButton() : Button
      {
         return this._137111012openButton;
      }
      
      public function set openButton(param1:Button) : void
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
      public function get popUp() : PopUpAnchor
      {
         return this._106851532popUp;
      }
      
      public function set popUp(param1:PopUpAnchor) : void
      {
         var _loc2_:Object = this._106851532popUp;
         if(_loc2_ !== param1)
         {
            this._106851532popUp = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"popUp",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get scroller() : Scroller
      {
         return this._402164678scroller;
      }
      
      public function set scroller(param1:Scroller) : void
      {
         var _loc2_:Object = this._402164678scroller;
         if(_loc2_ !== param1)
         {
            this._402164678scroller = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scroller",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : DropDownList
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:DropDownList) : void
      {
         var _loc2_:Object = this._213507019hostComponent;
         if(_loc2_ !== param1)
         {
            this._213507019hostComponent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hostComponent",_loc2_,param1));
            }
         }
      }
   }
}
