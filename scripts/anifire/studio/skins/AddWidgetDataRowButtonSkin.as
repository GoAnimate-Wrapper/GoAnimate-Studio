package anifire.studio.skins
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.State;
   import spark.components.Button;
   import spark.components.Label;
   import spark.components.supportClasses.Skin;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   
   public class AddWidgetDataRowButtonSkin extends Skin implements IStateClient2
   {
       
      
      private var _1184053038labelDisplay:Label;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _213507019hostComponent:Button;
      
      public function AddWidgetDataRowButtonSkin()
      {
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._AddWidgetDataRowButtonSkin_Rect1_c(),this._AddWidgetDataRowButtonSkin_Line1_c(),this._AddWidgetDataRowButtonSkin_Line2_c(),this._AddWidgetDataRowButtonSkin_Line3_c(),this._AddWidgetDataRowButtonSkin_Label1_i()];
         this.currentState = "disabled";
         states = [new State({
            "name":"disabled",
            "overrides":[]
         }),new State({
            "name":"down",
            "overrides":[]
         }),new State({
            "name":"over",
            "overrides":[]
         }),new State({
            "name":"up",
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
      
      private function _AddWidgetDataRowButtonSkin_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.height = 20;
         _loc1_.fill = this._AddWidgetDataRowButtonSkin_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _AddWidgetDataRowButtonSkin_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _AddWidgetDataRowButtonSkin_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.stroke = this._AddWidgetDataRowButtonSkin_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _AddWidgetDataRowButtonSkin_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 15132390;
         return _loc1_;
      }
      
      private function _AddWidgetDataRowButtonSkin_Line2_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.x = 80;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._AddWidgetDataRowButtonSkin_SolidColorStroke2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _AddWidgetDataRowButtonSkin_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 15132390;
         return _loc1_;
      }
      
      private function _AddWidgetDataRowButtonSkin_Line3_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._AddWidgetDataRowButtonSkin_SolidColorStroke3_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _AddWidgetDataRowButtonSkin_SolidColorStroke3_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 15132390;
         return _loc1_;
      }
      
      private function _AddWidgetDataRowButtonSkin_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.verticalCenter = 0;
         _loc1_.left = 15;
         _loc1_.setStyle("color",13092807);
         _loc1_.setStyle("fontSize",10);
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
