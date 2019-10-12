package anifire.studio.skins
{
   import anifire.studio.components.IconButton;
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
   import spark.components.supportClasses.Skin;
   import spark.primitives.BitmapImage;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   
   public class VoiceTabButtonSkin extends Skin implements IStateClient2
   {
       
      
      private var _1782408620_VoiceTabButtonSkin_HGroup1:HGroup;
      
      private var _2020530251_VoiceTabButtonSkin_SolidColor1:SolidColor;
      
      private var _1031744009iconDisplay:BitmapImage;
      
      private var _1184053038labelDisplay:Label;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _213507019hostComponent:IconButton;
      
      public function VoiceTabButtonSkin()
      {
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._VoiceTabButtonSkin_Rect1_c(),this._VoiceTabButtonSkin_Line1_c(),this._VoiceTabButtonSkin_Line2_c(),this._VoiceTabButtonSkin_Line3_c(),this._VoiceTabButtonSkin_Line4_c(),this._VoiceTabButtonSkin_HGroup1_i()];
         this.currentState = "disabled";
         states = [new State({
            "name":"disabled",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_VoiceTabButtonSkin_HGroup1",
               "name":"alpha",
               "value":0.2
            })]
         }),new State({
            "name":"down",
            "overrides":[]
         }),new State({
            "name":"over",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_VoiceTabButtonSkin_SolidColor1",
               "name":"color",
               "value":2907782
            })]
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
      
      private function _VoiceTabButtonSkin_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._VoiceTabButtonSkin_SolidColor1_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _VoiceTabButtonSkin_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 3569063;
         this._VoiceTabButtonSkin_SolidColor1 = _loc1_;
         BindingManager.executeBindings(this,"_VoiceTabButtonSkin_SolidColor1",this._VoiceTabButtonSkin_SolidColor1);
         return _loc1_;
      }
      
      private function _VoiceTabButtonSkin_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.bottom = 0;
         _loc1_.percentWidth = 100;
         _loc1_.stroke = this._VoiceTabButtonSkin_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _VoiceTabButtonSkin_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 2382211;
         return _loc1_;
      }
      
      private function _VoiceTabButtonSkin_Line2_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.left = 0;
         _loc1_.percentHeight = 100;
         _loc1_.stroke = this._VoiceTabButtonSkin_SolidColorStroke2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _VoiceTabButtonSkin_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 4295364;
         return _loc1_;
      }
      
      private function _VoiceTabButtonSkin_Line3_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.top = 0;
         _loc1_.percentWidth = 100;
         _loc1_.stroke = this._VoiceTabButtonSkin_SolidColorStroke3_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _VoiceTabButtonSkin_SolidColorStroke3_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 4295364;
         return _loc1_;
      }
      
      private function _VoiceTabButtonSkin_Line4_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.right = 0;
         _loc1_.percentHeight = 100;
         _loc1_.stroke = this._VoiceTabButtonSkin_SolidColorStroke4_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _VoiceTabButtonSkin_SolidColorStroke4_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 2382211;
         return _loc1_;
      }
      
      private function _VoiceTabButtonSkin_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.left = 5;
         _loc1_.verticalCenter = 0;
         _loc1_.verticalAlign = "middle";
         _loc1_.horizontalAlign = "left";
         _loc1_.alpha = 1;
         _loc1_.mxmlContent = [this._VoiceTabButtonSkin_BitmapImage1_i(),this._VoiceTabButtonSkin_Label1_i()];
         _loc1_.id = "_VoiceTabButtonSkin_HGroup1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._VoiceTabButtonSkin_HGroup1 = _loc1_;
         BindingManager.executeBindings(this,"_VoiceTabButtonSkin_HGroup1",this._VoiceTabButtonSkin_HGroup1);
         return _loc1_;
      }
      
      private function _VoiceTabButtonSkin_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.smooth = true;
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.initialized(this,"iconDisplay");
         this.iconDisplay = _loc1_;
         BindingManager.executeBindings(this,"iconDisplay",this.iconDisplay);
         return _loc1_;
      }
      
      private function _VoiceTabButtonSkin_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.setStyle("color",16777215);
         _loc1_.setStyle("fontStyle","italic");
         _loc1_.setStyle("typographicCase","uppercase");
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
      public function get _VoiceTabButtonSkin_HGroup1() : HGroup
      {
         return this._1782408620_VoiceTabButtonSkin_HGroup1;
      }
      
      public function set _VoiceTabButtonSkin_HGroup1(param1:HGroup) : void
      {
         var _loc2_:Object = this._1782408620_VoiceTabButtonSkin_HGroup1;
         if(_loc2_ !== param1)
         {
            this._1782408620_VoiceTabButtonSkin_HGroup1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_VoiceTabButtonSkin_HGroup1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _VoiceTabButtonSkin_SolidColor1() : SolidColor
      {
         return this._2020530251_VoiceTabButtonSkin_SolidColor1;
      }
      
      public function set _VoiceTabButtonSkin_SolidColor1(param1:SolidColor) : void
      {
         var _loc2_:Object = this._2020530251_VoiceTabButtonSkin_SolidColor1;
         if(_loc2_ !== param1)
         {
            this._2020530251_VoiceTabButtonSkin_SolidColor1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_VoiceTabButtonSkin_SolidColor1",_loc2_,param1));
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
      public function get hostComponent() : IconButton
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:IconButton) : void
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
