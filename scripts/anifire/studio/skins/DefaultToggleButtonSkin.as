package anifire.studio.skins
{
   import mx.binding.BindingManager;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Label;
   import spark.primitives.Rect;
   import spark.skins.SparkButtonSkin;
   
   public class DefaultToggleButtonSkin extends SparkButtonSkin implements IStateClient2
   {
      
      private static const exclusions:Array = ["labelDisplay"];
       
      
      private var _415623777_DefaultToggleButtonSkin_SolidColor1:SolidColor;
      
      private var _3143043fill:Rect;
      
      private var _1507289076highlightStroke:Rect;
      
      private var _1472494227hldownstroke1:Rect;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var cornerRadius:Number = 2;
      
      public function DefaultToggleButtonSkin()
      {
         super();
         mx_internal::_document = this;
         this.minWidth = 21;
         this.minHeight = 20;
         this.mxmlContent = [this._DefaultToggleButtonSkin_Rect1_i(),this._DefaultToggleButtonSkin_Label1_i()];
         this.currentState = "up";
         var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._DefaultToggleButtonSkin_Rect2_i);
         var _loc2_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._DefaultToggleButtonSkin_Rect3_i);
         states = [new State({
            "name":"up",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["fill"]
            })]
         }),new State({
            "name":"over",
            "stateGroups":["overStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["fill"]
            })]
         }),new State({
            "name":"down",
            "stateGroups":["downStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["fill"]
            })]
         }),new State({
            "name":"disabled",
            "stateGroups":["disabledStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["fill"]
            }),new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            })]
         }),new State({
            "name":"upAndSelected",
            "stateGroups":["selectedStates","selectedUpStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["fill"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["fill"]
            }),new SetProperty().initializeFromObject({
               "target":"_DefaultToggleButtonSkin_SolidColor1",
               "name":"color",
               "value":2075799
            })]
         }),new State({
            "name":"overAndSelected",
            "stateGroups":["selectedStates","overStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["fill"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["fill"]
            }),new SetProperty().initializeFromObject({
               "target":"_DefaultToggleButtonSkin_SolidColor1",
               "name":"color",
               "value":2075799
            })]
         }),new State({
            "name":"downAndSelected",
            "stateGroups":["selectedStates","downStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["fill"]
            }),new SetProperty().initializeFromObject({
               "target":"_DefaultToggleButtonSkin_SolidColor1",
               "name":"color",
               "value":2075799
            })]
         }),new State({
            "name":"disabledAndSelected",
            "stateGroups":["selectedStates","selectedUpStates","disabledStates"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["fill"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["fill"]
            }),new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            }),new SetProperty().initializeFromObject({
               "target":"_DefaultToggleButtonSkin_SolidColor1",
               "name":"color",
               "value":2075799
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
      
      override public function get colorizeExclusions() : Array
      {
         return exclusions;
      }
      
      override protected function initializationComplete() : void
      {
         useChromeColor = true;
         super.initializationComplete();
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc3_:Number = getStyle("cornerRadius");
         if(this.cornerRadius != _loc3_)
         {
            this.cornerRadius = _loc3_;
            this.fill.radiusX = this.cornerRadius;
         }
         if(this.highlightStroke)
         {
            this.highlightStroke.radiusX = this.cornerRadius;
         }
         if(this.hldownstroke1)
         {
            this.hldownstroke1.radiusX = this.cornerRadius;
         }
         super.updateDisplayList(param1,param2);
      }
      
      private function _DefaultToggleButtonSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 1;
         _loc1_.right = 1;
         _loc1_.top = 1;
         _loc1_.bottom = 1;
         _loc1_.radiusX = 3;
         _loc1_.radiusY = 3;
         _loc1_.fill = this._DefaultToggleButtonSkin_SolidColor1_i();
         _loc1_.initialized(this,"fill");
         this.fill = _loc1_;
         BindingManager.executeBindings(this,"fill",this.fill);
         return _loc1_;
      }
      
      private function _DefaultToggleButtonSkin_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 12504547;
         this._DefaultToggleButtonSkin_SolidColor1 = _loc1_;
         BindingManager.executeBindings(this,"_DefaultToggleButtonSkin_SolidColor1",this._DefaultToggleButtonSkin_SolidColor1);
         return _loc1_;
      }
      
      private function _DefaultToggleButtonSkin_Rect2_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 3;
         _loc1_.right = 3;
         _loc1_.bottom = 1;
         _loc1_.radiusX = 3;
         _loc1_.radiusY = 3;
         _loc1_.stroke = this._DefaultToggleButtonSkin_SolidColorStroke1_c();
         _loc1_.initialized(this,"highlightStroke");
         this.highlightStroke = _loc1_;
         BindingManager.executeBindings(this,"highlightStroke",this.highlightStroke);
         return _loc1_;
      }
      
      private function _DefaultToggleButtonSkin_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.weight = 1;
         _loc1_.color = 9676477;
         return _loc1_;
      }
      
      private function _DefaultToggleButtonSkin_Rect3_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 3;
         _loc1_.right = 3;
         _loc1_.top = 1;
         _loc1_.radiusX = 3;
         _loc1_.radiusY = 3;
         _loc1_.stroke = this._DefaultToggleButtonSkin_SolidColorStroke2_c();
         _loc1_.initialized(this,"hldownstroke1");
         this.hldownstroke1 = _loc1_;
         BindingManager.executeBindings(this,"hldownstroke1",this.hldownstroke1);
         return _loc1_;
      }
      
      private function _DefaultToggleButtonSkin_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.weight = 1;
         _loc1_.color = 1412990;
         return _loc1_;
      }
      
      private function _DefaultToggleButtonSkin_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.maxDisplayedLines = 1;
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 1;
         _loc1_.left = 8;
         _loc1_.right = 8;
         _loc1_.top = 3;
         _loc1_.bottom = 3;
         _loc1_.setStyle("fontSize",12);
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("color",16777215);
         _loc1_.setStyle("textAlign","center");
         _loc1_.setStyle("verticalAlign","middle");
         _loc1_.id = "labelDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         labelDisplay = _loc1_;
         BindingManager.executeBindings(this,"labelDisplay",labelDisplay);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _DefaultToggleButtonSkin_SolidColor1() : SolidColor
      {
         return this._415623777_DefaultToggleButtonSkin_SolidColor1;
      }
      
      public function set _DefaultToggleButtonSkin_SolidColor1(param1:SolidColor) : void
      {
         var _loc2_:Object = this._415623777_DefaultToggleButtonSkin_SolidColor1;
         if(_loc2_ !== param1)
         {
            this._415623777_DefaultToggleButtonSkin_SolidColor1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DefaultToggleButtonSkin_SolidColor1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fill() : Rect
      {
         return this._3143043fill;
      }
      
      public function set fill(param1:Rect) : void
      {
         var _loc2_:Object = this._3143043fill;
         if(_loc2_ !== param1)
         {
            this._3143043fill = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fill",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get highlightStroke() : Rect
      {
         return this._1507289076highlightStroke;
      }
      
      public function set highlightStroke(param1:Rect) : void
      {
         var _loc2_:Object = this._1507289076highlightStroke;
         if(_loc2_ !== param1)
         {
            this._1507289076highlightStroke = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"highlightStroke",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hldownstroke1() : Rect
      {
         return this._1472494227hldownstroke1;
      }
      
      public function set hldownstroke1(param1:Rect) : void
      {
         var _loc2_:Object = this._1472494227hldownstroke1;
         if(_loc2_ !== param1)
         {
            this._1472494227hldownstroke1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hldownstroke1",_loc2_,param1));
            }
         }
      }
   }
}
