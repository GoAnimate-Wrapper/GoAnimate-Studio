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
   import spark.components.Group;
   import spark.primitives.Line;
   import spark.primitives.Path;
   import spark.primitives.Rect;
   import spark.skins.SparkSkin;
   
   public class DefaultDropDownListButtonSkin extends SparkSkin implements IStateClient2
   {
       
      
      private var _1839077114_DefaultDropDownListButtonSkin_SolidColor1:SolidColor;
      
      private var _2079587101_DefaultDropDownListButtonSkin_SolidColorStroke2:SolidColorStroke;
      
      private var _2079587100_DefaultDropDownListButtonSkin_SolidColorStroke3:SolidColorStroke;
      
      private var _766836075frameDisplay:Rect;
      
      private var _903579360shadow:Rect;
      
      private var _1497762312triangle:Path;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _213507019hostComponent:Button;
      
      public function DefaultDropDownListButtonSkin()
      {
         super();
         mx_internal::_document = this;
         this.minWidth = 21;
         this.minHeight = 21;
         this.mxmlContent = [this._DefaultDropDownListButtonSkin_Rect1_i(),this._DefaultDropDownListButtonSkin_Rect2_i(),this._DefaultDropDownListButtonSkin_Group1_c()];
         this.currentState = "up";
         states = [new State({
            "name":"up",
            "overrides":[]
         }),new State({
            "name":"over",
            "stateGroups":["overAndDownStates"],
            "overrides":[]
         }),new State({
            "name":"down",
            "stateGroups":["overAndDownStates"],
            "overrides":[]
         }),new State({
            "name":"disabled",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_DefaultDropDownListButtonSkin_SolidColor1",
               "name":"color",
               "value":15592941
            }),new SetProperty().initializeFromObject({
               "target":"_DefaultDropDownListButtonSkin_SolidColorStroke2",
               "name":"color",
               "value":11184810
            }),new SetProperty().initializeFromObject({
               "target":"_DefaultDropDownListButtonSkin_SolidColorStroke3",
               "name":"color",
               "value":11184810
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
      
      private function _DefaultDropDownListButtonSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.radiusX = 4;
         _loc1_.radiusY = 4;
         _loc1_.stroke = this._DefaultDropDownListButtonSkin_SolidColorStroke1_c();
         _loc1_.fill = this._DefaultDropDownListButtonSkin_SolidColor1_i();
         _loc1_.initialized(this,"frameDisplay");
         this.frameDisplay = _loc1_;
         BindingManager.executeBindings(this,"frameDisplay",this.frameDisplay);
         return _loc1_;
      }
      
      private function _DefaultDropDownListButtonSkin_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 13289940;
         return _loc1_;
      }
      
      private function _DefaultDropDownListButtonSkin_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         this._DefaultDropDownListButtonSkin_SolidColor1 = _loc1_;
         BindingManager.executeBindings(this,"_DefaultDropDownListButtonSkin_SolidColor1",this._DefaultDropDownListButtonSkin_SolidColor1);
         return _loc1_;
      }
      
      private function _DefaultDropDownListButtonSkin_Rect2_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 1;
         _loc1_.top = 1;
         _loc1_.right = 1;
         _loc1_.height = 1;
         _loc1_.radiusX = 3;
         _loc1_.fill = this._DefaultDropDownListButtonSkin_SolidColor2_c();
         _loc1_.initialized(this,"shadow");
         this.shadow = _loc1_;
         BindingManager.executeBindings(this,"shadow",this.shadow);
         return _loc1_;
      }
      
      private function _DefaultDropDownListButtonSkin_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 0;
         _loc1_.alpha = 0.12;
         return _loc1_;
      }
      
      private function _DefaultDropDownListButtonSkin_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 24;
         _loc1_.right = 1;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.mxmlContent = [this._DefaultDropDownListButtonSkin_Line1_c(),this._DefaultDropDownListButtonSkin_Path1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _DefaultDropDownListButtonSkin_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.left = 0;
         _loc1_.top = 8;
         _loc1_.bottom = 8;
         _loc1_.stroke = this._DefaultDropDownListButtonSkin_SolidColorStroke2_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _DefaultDropDownListButtonSkin_SolidColorStroke2_i() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 13289940;
         this._DefaultDropDownListButtonSkin_SolidColorStroke2 = _loc1_;
         BindingManager.executeBindings(this,"_DefaultDropDownListButtonSkin_SolidColorStroke2",this._DefaultDropDownListButtonSkin_SolidColorStroke2);
         return _loc1_;
      }
      
      private function _DefaultDropDownListButtonSkin_Path1_i() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.data = "M 0 0 l 4 4 l 4 -4";
         _loc1_.stroke = this._DefaultDropDownListButtonSkin_SolidColorStroke3_i();
         _loc1_.initialized(this,"triangle");
         this.triangle = _loc1_;
         BindingManager.executeBindings(this,"triangle",this.triangle);
         return _loc1_;
      }
      
      private function _DefaultDropDownListButtonSkin_SolidColorStroke3_i() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 4439205;
         _loc1_.weight = 2;
         _loc1_.caps = "square";
         this._DefaultDropDownListButtonSkin_SolidColorStroke3 = _loc1_;
         BindingManager.executeBindings(this,"_DefaultDropDownListButtonSkin_SolidColorStroke3",this._DefaultDropDownListButtonSkin_SolidColorStroke3);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _DefaultDropDownListButtonSkin_SolidColor1() : SolidColor
      {
         return this._1839077114_DefaultDropDownListButtonSkin_SolidColor1;
      }
      
      public function set _DefaultDropDownListButtonSkin_SolidColor1(param1:SolidColor) : void
      {
         var _loc2_:Object = this._1839077114_DefaultDropDownListButtonSkin_SolidColor1;
         if(_loc2_ !== param1)
         {
            this._1839077114_DefaultDropDownListButtonSkin_SolidColor1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DefaultDropDownListButtonSkin_SolidColor1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _DefaultDropDownListButtonSkin_SolidColorStroke2() : SolidColorStroke
      {
         return this._2079587101_DefaultDropDownListButtonSkin_SolidColorStroke2;
      }
      
      public function set _DefaultDropDownListButtonSkin_SolidColorStroke2(param1:SolidColorStroke) : void
      {
         var _loc2_:Object = this._2079587101_DefaultDropDownListButtonSkin_SolidColorStroke2;
         if(_loc2_ !== param1)
         {
            this._2079587101_DefaultDropDownListButtonSkin_SolidColorStroke2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DefaultDropDownListButtonSkin_SolidColorStroke2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _DefaultDropDownListButtonSkin_SolidColorStroke3() : SolidColorStroke
      {
         return this._2079587100_DefaultDropDownListButtonSkin_SolidColorStroke3;
      }
      
      public function set _DefaultDropDownListButtonSkin_SolidColorStroke3(param1:SolidColorStroke) : void
      {
         var _loc2_:Object = this._2079587100_DefaultDropDownListButtonSkin_SolidColorStroke3;
         if(_loc2_ !== param1)
         {
            this._2079587100_DefaultDropDownListButtonSkin_SolidColorStroke3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DefaultDropDownListButtonSkin_SolidColorStroke3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get frameDisplay() : Rect
      {
         return this._766836075frameDisplay;
      }
      
      public function set frameDisplay(param1:Rect) : void
      {
         var _loc2_:Object = this._766836075frameDisplay;
         if(_loc2_ !== param1)
         {
            this._766836075frameDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"frameDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get shadow() : Rect
      {
         return this._903579360shadow;
      }
      
      public function set shadow(param1:Rect) : void
      {
         var _loc2_:Object = this._903579360shadow;
         if(_loc2_ !== param1)
         {
            this._903579360shadow = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"shadow",_loc2_,param1));
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
