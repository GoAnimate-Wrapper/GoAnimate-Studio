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
   import spark.primitives.Path;
   import spark.primitives.Rect;
   import spark.skins.SparkSkin;
   
   public class ClearCharacterActionButtonSkin extends SparkSkin implements IStateClient2
   {
       
      
      private var _94935104cross:Path;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _213507019hostComponent:Button;
      
      public function ClearCharacterActionButtonSkin()
      {
         super();
         mx_internal::_document = this;
         this.width = 15;
         this.height = 15;
         this.mxmlContent = [this._ClearCharacterActionButtonSkin_Rect1_c(),this._ClearCharacterActionButtonSkin_Path1_i()];
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
      
      private function _ClearCharacterActionButtonSkin_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._ClearCharacterActionButtonSkin_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ClearCharacterActionButtonSkin_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      private function _ClearCharacterActionButtonSkin_Path1_i() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.data = "l 6 6 m -6 0 l 6 -6";
         _loc1_.stroke = this._ClearCharacterActionButtonSkin_SolidColorStroke1_c();
         _loc1_.initialized(this,"cross");
         this.cross = _loc1_;
         BindingManager.executeBindings(this,"cross",this.cross);
         return _loc1_;
      }
      
      private function _ClearCharacterActionButtonSkin_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 12898279;
         _loc1_.weight = 2;
         _loc1_.caps = "square";
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get cross() : Path
      {
         return this._94935104cross;
      }
      
      public function set cross(param1:Path) : void
      {
         var _loc2_:Object = this._94935104cross;
         if(_loc2_ !== param1)
         {
            this._94935104cross = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cross",_loc2_,param1));
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
