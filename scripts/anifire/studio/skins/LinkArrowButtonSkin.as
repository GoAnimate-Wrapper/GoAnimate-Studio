package anifire.studio.skins
{
   import anifire.studio.components.LinkArrowButton;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.primitives.Path;
   import spark.primitives.Rect;
   import spark.skins.SparkSkin;
   
   public class LinkArrowButtonSkin extends SparkSkin implements IStateClient2
   {
       
      
      private var _3143043fill:Rect;
      
      private var _1184053038labelDisplay:Label;
      
      private var _1714212930leftArrow:Path;
      
      private var _1415400627rightArrow:Path;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _213507019hostComponent:LinkArrowButton;
      
      public function LinkArrowButtonSkin()
      {
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._LinkArrowButtonSkin_Rect1_i(),this._LinkArrowButtonSkin_HGroup1_c()];
         this.currentState = "up";
         states = [new State({
            "name":"up",
            "overrides":[]
         }),new State({
            "name":"over",
            "stateGroups":["overAndDown"],
            "overrides":[]
         }),new State({
            "name":"down",
            "stateGroups":["overAndDown"],
            "overrides":[]
         }),new State({
            "name":"disabled",
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
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
      
      private function _LinkArrowButtonSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 1;
         _loc1_.right = 1;
         _loc1_.top = 1;
         _loc1_.bottom = 1;
         _loc1_.fill = this._LinkArrowButtonSkin_SolidColor1_c();
         _loc1_.initialized(this,"fill");
         this.fill = _loc1_;
         BindingManager.executeBindings(this,"fill",this.fill);
         return _loc1_;
      }
      
      private function _LinkArrowButtonSkin_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      private function _LinkArrowButtonSkin_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.mxmlContent = [this._LinkArrowButtonSkin_Path1_i(),this._LinkArrowButtonSkin_Label1_i(),this._LinkArrowButtonSkin_Path2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _LinkArrowButtonSkin_Path1_i() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.stroke = this._LinkArrowButtonSkin_SolidColorStroke1_c();
         _loc1_.initialized(this,"leftArrow");
         this.leftArrow = _loc1_;
         BindingManager.executeBindings(this,"leftArrow",this.leftArrow);
         return _loc1_;
      }
      
      private function _LinkArrowButtonSkin_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.weight = 2;
         _loc1_.caps = "square";
         _loc1_.color = 4439205;
         return _loc1_;
      }
      
      private function _LinkArrowButtonSkin_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("color",4439205);
         _loc1_.setStyle("typographicCase","lowercaseToSmallCaps");
         _loc1_.setStyle("fontSize",12);
         _loc1_.id = "labelDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.labelDisplay = _loc1_;
         BindingManager.executeBindings(this,"labelDisplay",this.labelDisplay);
         return _loc1_;
      }
      
      private function _LinkArrowButtonSkin_Path2_i() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.stroke = this._LinkArrowButtonSkin_SolidColorStroke2_c();
         _loc1_.initialized(this,"rightArrow");
         this.rightArrow = _loc1_;
         BindingManager.executeBindings(this,"rightArrow",this.rightArrow);
         return _loc1_;
      }
      
      private function _LinkArrowButtonSkin_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.weight = 2;
         _loc1_.caps = "square";
         _loc1_.color = 4439205;
         return _loc1_;
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
      public function get leftArrow() : Path
      {
         return this._1714212930leftArrow;
      }
      
      public function set leftArrow(param1:Path) : void
      {
         var _loc2_:Object = this._1714212930leftArrow;
         if(_loc2_ !== param1)
         {
            this._1714212930leftArrow = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"leftArrow",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get rightArrow() : Path
      {
         return this._1415400627rightArrow;
      }
      
      public function set rightArrow(param1:Path) : void
      {
         var _loc2_:Object = this._1415400627rightArrow;
         if(_loc2_ !== param1)
         {
            this._1415400627rightArrow = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rightArrow",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : LinkArrowButton
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:LinkArrowButton) : void
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
