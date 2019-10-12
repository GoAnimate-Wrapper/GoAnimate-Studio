package anifire.studio.skins
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Button;
   import spark.primitives.Rect;
   import spark.skins.SparkSkin;
   
   public class FlatVScrollBarThumbSkin extends SparkSkin implements IStateClient2
   {
       
      
      private var _1070169573_FlatVScrollBarThumbSkin_SolidColor1:SolidColor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _213507019hostComponent:Button;
      
      public function FlatVScrollBarThumbSkin()
      {
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._FlatVScrollBarThumbSkin_Rect1_c()];
         this.currentState = "up";
         states = [new State({
            "name":"up",
            "overrides":[]
         }),new State({
            "name":"over",
            "stateGroups":["overAndDownStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_FlatVScrollBarThumbSkin_SolidColor1",
               "name":"color",
               "value":4374702
            }),new SetProperty().initializeFromObject({
               "target":"_FlatVScrollBarThumbSkin_SolidColor1",
               "name":"alpha",
               "value":1
            })]
         }),new State({
            "name":"down",
            "stateGroups":["overAndDownStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_FlatVScrollBarThumbSkin_SolidColor1",
               "name":"color",
               "value":4374702
            }),new SetProperty().initializeFromObject({
               "target":"_FlatVScrollBarThumbSkin_SolidColor1",
               "name":"alpha",
               "value":1
            })]
         }),new State({
            "name":"disabled",
            "overrides":[]
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
      
      private function _FlatVScrollBarThumbSkin_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.width = 10;
         _loc1_.minHeight = 10;
         _loc1_.radiusX = 5;
         _loc1_.radiusY = 5;
         _loc1_.fill = this._FlatVScrollBarThumbSkin_SolidColor1_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FlatVScrollBarThumbSkin_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 9079434;
         _loc1_.alpha = 0.85;
         this._FlatVScrollBarThumbSkin_SolidColor1 = _loc1_;
         BindingManager.executeBindings(this,"_FlatVScrollBarThumbSkin_SolidColor1",this._FlatVScrollBarThumbSkin_SolidColor1);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _FlatVScrollBarThumbSkin_SolidColor1() : SolidColor
      {
         return this._1070169573_FlatVScrollBarThumbSkin_SolidColor1;
      }
      
      public function set _FlatVScrollBarThumbSkin_SolidColor1(param1:SolidColor) : void
      {
         var _loc2_:Object = this._1070169573_FlatVScrollBarThumbSkin_SolidColor1;
         if(_loc2_ !== param1)
         {
            this._1070169573_FlatVScrollBarThumbSkin_SolidColor1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_FlatVScrollBarThumbSkin_SolidColor1",_loc2_,param1));
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
