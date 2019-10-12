package anifire.studio.skins
{
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.State;
   import spark.components.Button;
   import spark.filters.DropShadowFilter;
   import spark.primitives.Ellipse;
   import spark.skins.SparkSkin;
   
   public class FlatHSliderThumbSkin extends SparkSkin implements IStateClient2
   {
       
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _213507019hostComponent:Button;
      
      public function FlatHSliderThumbSkin()
      {
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._FlatHSliderThumbSkin_Ellipse1_c()];
         this.currentState = "up";
         states = [new State({
            "name":"up",
            "overrides":[]
         }),new State({
            "name":"over",
            "overrides":[]
         }),new State({
            "name":"down",
            "overrides":[]
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
      
      override protected function initializationComplete() : void
      {
         useChromeColor = true;
         super.initializationComplete();
      }
      
      private function _FlatHSliderThumbSkin_Ellipse1_c() : Ellipse
      {
         var _loc1_:Ellipse = new Ellipse();
         _loc1_.width = 14;
         _loc1_.height = 14;
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.stroke = this._FlatHSliderThumbSkin_SolidColorStroke1_c();
         _loc1_.fill = this._FlatHSliderThumbSkin_SolidColor1_c();
         _loc1_.filters = [this._FlatHSliderThumbSkin_DropShadowFilter1_c()];
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FlatHSliderThumbSkin_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 16777215;
         _loc1_.weight = 3;
         return _loc1_;
      }
      
      private function _FlatHSliderThumbSkin_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 6142119;
         return _loc1_;
      }
      
      private function _FlatHSliderThumbSkin_DropShadowFilter1_c() : DropShadowFilter
      {
         var _loc1_:DropShadowFilter = new DropShadowFilter();
         _loc1_.alpha = 0.12;
         _loc1_.blurY = 2;
         _loc1_.distance = 2;
         _loc1_.angle = 90;
         return _loc1_;
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
