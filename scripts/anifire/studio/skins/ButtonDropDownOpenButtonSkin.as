package anifire.studio.skins
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Button;
   import spark.components.HGroup;
   import spark.primitives.Path;
   import spark.primitives.Rect;
   import spark.skins.SparkSkin;
   
   public class ButtonDropDownOpenButtonSkin extends SparkSkin implements IStateClient2
   {
       
      
      private var _1733551243_ButtonDropDownOpenButtonSkin_SolidColor1:SolidColor;
      
      private var _3143043fill:Rect;
      
      private var _1497762312triangle:Path;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _213507019hostComponent:Button;
      
      public function ButtonDropDownOpenButtonSkin()
      {
         super();
         mx_internal::_document = this;
         this.minWidth = 32;
         this.minHeight = 32;
         this.mxmlContent = [this._ButtonDropDownOpenButtonSkin_Rect1_i(),this._ButtonDropDownOpenButtonSkin_HGroup1_c()];
         this.currentState = "up";
         states = [new State({
            "name":"up",
            "overrides":[]
         }),new State({
            "name":"over",
            "stateGroups":["overAndDownStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_ButtonDropDownOpenButtonSkin_SolidColor1",
               "name":"color",
               "value":170629
            })]
         }),new State({
            "name":"down",
            "stateGroups":["overAndDownStates"],
            "overrides":[]
         }),new State({
            "name":"disabled",
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            }),new SetProperty().initializeFromObject({
               "target":"_ButtonDropDownOpenButtonSkin_SolidColor1",
               "name":"color",
               "value":13290444
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
      
      private function _ButtonDropDownOpenButtonSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.topRightRadiusX = 3;
         _loc1_.bottomRightRadiusX = 3;
         _loc1_.fill = this._ButtonDropDownOpenButtonSkin_SolidColor1_i();
         _loc1_.initialized(this,"fill");
         this.fill = _loc1_;
         BindingManager.executeBindings(this,"fill",this.fill);
         return _loc1_;
      }
      
      private function _ButtonDropDownOpenButtonSkin_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 4439205;
         this._ButtonDropDownOpenButtonSkin_SolidColor1 = _loc1_;
         BindingManager.executeBindings(this,"_ButtonDropDownOpenButtonSkin_SolidColor1",this._ButtonDropDownOpenButtonSkin_SolidColor1);
         return _loc1_;
      }
      
      private function _ButtonDropDownOpenButtonSkin_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.horizontalAlign = "center";
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._ButtonDropDownOpenButtonSkin_Path1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ButtonDropDownOpenButtonSkin_Path1_i() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.data = "M 0 0 l 5 5 l 5 -5";
         _loc1_.stroke = this._ButtonDropDownOpenButtonSkin_SolidColorStroke1_c();
         _loc1_.initialized(this,"triangle");
         this.triangle = _loc1_;
         BindingManager.executeBindings(this,"triangle",this.triangle);
         return _loc1_;
      }
      
      private function _ButtonDropDownOpenButtonSkin_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 16777215;
         _loc1_.weight = 3;
         _loc1_.caps = "round";
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _ButtonDropDownOpenButtonSkin_SolidColor1() : SolidColor
      {
         return this._1733551243_ButtonDropDownOpenButtonSkin_SolidColor1;
      }
      
      public function set _ButtonDropDownOpenButtonSkin_SolidColor1(param1:SolidColor) : void
      {
         var _loc2_:Object = this._1733551243_ButtonDropDownOpenButtonSkin_SolidColor1;
         if(_loc2_ !== param1)
         {
            this._1733551243_ButtonDropDownOpenButtonSkin_SolidColor1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ButtonDropDownOpenButtonSkin_SolidColor1",_loc2_,param1));
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
      public function get triangle() : Path
      {
         return this._1497762312triangle;
      }
      
      public function set triangle(param1:Path) : void
      {
         var _loc2_:Object = this._1497762312triangle;
         if(_loc2_ !== param1)
         {
            this._1497762312triangle = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"triangle",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : Button
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:Button) : void
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
