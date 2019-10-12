package anifire.studio.components
{
   import anifire.studio.skins.CloseButtonSkin;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.IToolTip;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.states.State;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.Label;
   import spark.primitives.Path;
   import spark.primitives.Rect;
   
   public class SoundWarning extends Group implements IStateClient2, IToolTip
   {
       
      
      private var _93090825arrow:Path;
      
      private var _1184053038labelDisplay:Label;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _warning:Boolean;
      
      public function SoundWarning()
      {
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._SoundWarning_Group2_c()];
         this.currentState = "normal";
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"warning",
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
      
      public function get warning() : Boolean
      {
         return this._warning;
      }
      
      public function set warning(param1:Boolean) : void
      {
         this._warning = param1;
         currentState = !!this._warning?"warning":"normal";
      }
      
      public function get text() : String
      {
         return this.labelDisplay.text;
      }
      
      public function set text(param1:String) : void
      {
         this.labelDisplay.text = param1;
      }
      
      public function hideArrow() : void
      {
         this.arrow.visible = false;
      }
      
      protected function closeButton_clickHandler(param1:MouseEvent) : void
      {
         this.dispatchEvent(new Event("closeButtonClick"));
      }
      
      private function _SoundWarning_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._SoundWarning_Path1_i(),this._SoundWarning_Group3_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SoundWarning_Path1_i() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.left = 8;
         _loc1_.bottom = -8;
         _loc1_.data = "M 0 0 l 8 8 l 8 -8 Z";
         _loc1_.fill = this._SoundWarning_SolidColor1_c();
         _loc1_.initialized(this,"arrow");
         this.arrow = _loc1_;
         BindingManager.executeBindings(this,"arrow",this.arrow);
         return _loc1_;
      }
      
      private function _SoundWarning_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16372857;
         return _loc1_;
      }
      
      private function _SoundWarning_Group3_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.verticalCenter = 0;
         _loc1_.mxmlContent = [this._SoundWarning_Rect1_c(),this._SoundWarning_Label1_i(),this._SoundWarning_Button1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SoundWarning_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._SoundWarning_SolidColor2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SoundWarning_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16372857;
         return _loc1_;
      }
      
      private function _SoundWarning_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.maxWidth = 300;
         _loc1_.left = 5;
         _loc1_.right = 25;
         _loc1_.top = 5;
         _loc1_.bottom = 5;
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
      
      private function _SoundWarning_Button1_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.top = 5;
         _loc1_.right = 5;
         _loc1_.setStyle("skinClass",CloseButtonSkin);
         _loc1_.addEventListener("click",this.___SoundWarning_Button1_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___SoundWarning_Button1_click(param1:MouseEvent) : void
      {
         this.closeButton_clickHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get arrow() : Path
      {
         return this._93090825arrow;
      }
      
      public function set arrow(param1:Path) : void
      {
         var _loc2_:Object = this._93090825arrow;
         if(_loc2_ !== param1)
         {
            this._93090825arrow = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"arrow",_loc2_,param1));
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
   }
}
