package anifire.studio.skins
{
   import anifire.studio.components.IconButtonBarButton;
   import mx.binding.BindingManager;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.SetStyle;
   import mx.states.State;
   import spark.components.Label;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   import spark.primitives.RectangularDropShadow;
   import spark.skins.SparkSkin;
   
   public class FlatButtonBarButtonSkin extends SparkSkin implements IStateClient2
   {
       
      
      public var _FlatButtonBarButtonSkin_Line1:Line;
      
      public var _FlatButtonBarButtonSkin_Line2:Line;
      
      public var _FlatButtonBarButtonSkin_Rect1:Rect;
      
      public var _FlatButtonBarButtonSkin_Rect2:Rect;
      
      public var _FlatButtonBarButtonSkin_RectangularDropShadow1:RectangularDropShadow;
      
      private var _1391998104bgFill:SolidColor;
      
      private var _1184053038labelDisplay:Label;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _213507019hostComponent:IconButtonBarButton;
      
      public function FlatButtonBarButtonSkin()
      {
         super();
         mx_internal::_document = this;
         this.minWidth = 50;
         this.minHeight = 30;
         this.mxmlContent = [this._FlatButtonBarButtonSkin_Rect1_i(),this._FlatButtonBarButtonSkin_Line2_i(),this._FlatButtonBarButtonSkin_Label1_i()];
         this.currentState = "up";
         var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._FlatButtonBarButtonSkin_Line1_i);
         var _loc2_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._FlatButtonBarButtonSkin_Rect2_i);
         var _loc3_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._FlatButtonBarButtonSkin_RectangularDropShadow1_i);
         states = [new State({
            "name":"up",
            "stateGroups":["normalStates"],
            "overrides":[]
         }),new State({
            "name":"over",
            "stateGroups":["normalStates","overStates"],
            "overrides":[new SetStyle().initializeFromObject({
               "target":"labelDisplay",
               "name":"color",
               "value":14840854
            })]
         }),new State({
            "name":"down",
            "stateGroups":["normalStates","downStates"],
            "overrides":[]
         }),new State({
            "name":"disabled",
            "stateGroups":["normalStates","disabledStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            })]
         }),new State({
            "name":"upAndSelected",
            "stateGroups":["selectedStates","selectedUpStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc3_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_FlatButtonBarButtonSkin_Line2"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_FlatButtonBarButtonSkin_Rect1"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_FlatButtonBarButtonSkin_Rect1"]
            }),new SetProperty().initializeFromObject({
               "target":"bgFill",
               "name":"alpha",
               "value":1
            }),new SetStyle().initializeFromObject({
               "target":"labelDisplay",
               "name":"color",
               "value":14840854
            })]
         }),new State({
            "name":"overAndSelected",
            "stateGroups":["selectedStates","overStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc3_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_FlatButtonBarButtonSkin_Line2"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_FlatButtonBarButtonSkin_Rect1"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_FlatButtonBarButtonSkin_Rect1"]
            }),new SetProperty().initializeFromObject({
               "target":"bgFill",
               "name":"alpha",
               "value":1
            }),new SetStyle().initializeFromObject({
               "target":"labelDisplay",
               "name":"color",
               "value":14840854
            })]
         }),new State({
            "name":"downAndSelected",
            "stateGroups":["selectedStates","downStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc3_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_FlatButtonBarButtonSkin_Line2"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_FlatButtonBarButtonSkin_Rect1"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_FlatButtonBarButtonSkin_Rect1"]
            }),new SetProperty().initializeFromObject({
               "target":"bgFill",
               "name":"alpha",
               "value":1
            }),new SetStyle().initializeFromObject({
               "target":"labelDisplay",
               "name":"color",
               "value":14840854
            })]
         }),new State({
            "name":"disabledAndSelected",
            "stateGroups":["selectedStates","selectedUpStates","disabledStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc3_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_FlatButtonBarButtonSkin_Line2"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_FlatButtonBarButtonSkin_Rect1"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_FlatButtonBarButtonSkin_Rect1"]
            }),new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            }),new SetProperty().initializeFromObject({
               "target":"bgFill",
               "name":"alpha",
               "value":1
            }),new SetStyle().initializeFromObject({
               "target":"labelDisplay",
               "name":"color",
               "value":14840854
            })]
         })];
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
      
      private function _FlatButtonBarButtonSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 5;
         _loc1_.bottom = 0;
         _loc1_.fill = this._FlatButtonBarButtonSkin_SolidColor1_i();
         _loc1_.initialized(this,"_FlatButtonBarButtonSkin_Rect1");
         this._FlatButtonBarButtonSkin_Rect1 = _loc1_;
         BindingManager.executeBindings(this,"_FlatButtonBarButtonSkin_Rect1",this._FlatButtonBarButtonSkin_Rect1);
         return _loc1_;
      }
      
      private function _FlatButtonBarButtonSkin_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         _loc1_.alpha = 0;
         this.bgFill = _loc1_;
         BindingManager.executeBindings(this,"bgFill",this.bgFill);
         return _loc1_;
      }
      
      private function _FlatButtonBarButtonSkin_Rect2_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 1;
         _loc1_.top = 0;
         _loc1_.height = 5;
         _loc1_.fill = this._FlatButtonBarButtonSkin_SolidColor2_c();
         _loc1_.initialized(this,"_FlatButtonBarButtonSkin_Rect2");
         this._FlatButtonBarButtonSkin_Rect2 = _loc1_;
         BindingManager.executeBindings(this,"_FlatButtonBarButtonSkin_Rect2",this._FlatButtonBarButtonSkin_Rect2);
         return _loc1_;
      }
      
      private function _FlatButtonBarButtonSkin_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 15301947;
         return _loc1_;
      }
      
      private function _FlatButtonBarButtonSkin_Line1_i() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.bottom = 0;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.stroke = this._FlatButtonBarButtonSkin_SolidColorStroke1_c();
         _loc1_.initialized(this,"_FlatButtonBarButtonSkin_Line1");
         this._FlatButtonBarButtonSkin_Line1 = _loc1_;
         BindingManager.executeBindings(this,"_FlatButtonBarButtonSkin_Line1",this._FlatButtonBarButtonSkin_Line1);
         return _loc1_;
      }
      
      private function _FlatButtonBarButtonSkin_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _FlatButtonBarButtonSkin_Line2_i() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.right = 0;
         _loc1_.top = 5;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._FlatButtonBarButtonSkin_SolidColorStroke2_c();
         _loc1_.initialized(this,"_FlatButtonBarButtonSkin_Line2");
         this._FlatButtonBarButtonSkin_Line2 = _loc1_;
         BindingManager.executeBindings(this,"_FlatButtonBarButtonSkin_Line2",this._FlatButtonBarButtonSkin_Line2);
         return _loc1_;
      }
      
      private function _FlatButtonBarButtonSkin_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 13619151;
         return _loc1_;
      }
      
      private function _FlatButtonBarButtonSkin_RectangularDropShadow1_i() : RectangularDropShadow
      {
         var _loc1_:RectangularDropShadow = new RectangularDropShadow();
         _loc1_.left = 0;
         _loc1_.right = 1;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.angle = 270;
         _loc1_.blurX = 8;
         _loc1_.blurY = 8;
         _loc1_.distance = 4;
         _loc1_.alpha = 0.3;
         _loc1_.id = "_FlatButtonBarButtonSkin_RectangularDropShadow1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._FlatButtonBarButtonSkin_RectangularDropShadow1 = _loc1_;
         BindingManager.executeBindings(this,"_FlatButtonBarButtonSkin_RectangularDropShadow1",this._FlatButtonBarButtonSkin_RectangularDropShadow1);
         return _loc1_;
      }
      
      private function _FlatButtonBarButtonSkin_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.maxDisplayedLines = 1;
         _loc1_.setStyle("textAlign","center");
         _loc1_.setStyle("verticalAlign","middle");
         _loc1_.setStyle("fontSize",12);
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("typographicCase","lowercaseToSmallCaps");
         _loc1_.setStyle("color",5331305);
         _loc1_.setStyle("paddingTop",14);
         _loc1_.setStyle("paddingBottom",10);
         _loc1_.id = "labelDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.labelDisplay = _loc1_;
         BindingManager.executeBindings(this,"labelDisplay",this.labelDisplay);
         return _loc1_;
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
      public function get hostComponent() : IconButtonBarButton
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:IconButtonBarButton) : void
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
