package anifire.studio.components
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IToolTip;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import spark.components.Group;
   import spark.components.RichEditableText;
   import spark.primitives.Path;
   import spark.primitives.Rect;
   
   public class SceneToolTip extends Group implements IToolTip
   {
       
      
      private var _93090825arrow:Path;
      
      private var _299873228infoDisplay:RichEditableText;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function SceneToolTip()
      {
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._SceneToolTip_Rect1_c(),this._SceneToolTip_Path1_i(),this._SceneToolTip_RichEditableText1_i()];
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
      
      public function get text() : String
      {
         return this.infoDisplay.text;
      }
      
      public function set text(param1:String) : void
      {
         this.infoDisplay.text = param1;
      }
      
      private function _SceneToolTip_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 13;
         _loc1_.fill = this._SceneToolTip_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SceneToolTip_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 4028582;
         return _loc1_;
      }
      
      private function _SceneToolTip_Path1_i() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.bottom = 8;
         _loc1_.horizontalCenter = 0;
         _loc1_.data = "M 0 0 l 4.5 5 l 4.5 -5 z";
         _loc1_.fill = this._SceneToolTip_SolidColor2_c();
         _loc1_.initialized(this,"arrow");
         this.arrow = _loc1_;
         BindingManager.executeBindings(this,"arrow",this.arrow);
         return _loc1_;
      }
      
      private function _SceneToolTip_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 4028582;
         return _loc1_;
      }
      
      private function _SceneToolTip_RichEditableText1_i() : RichEditableText
      {
         var _loc1_:RichEditableText = new RichEditableText();
         _loc1_.left = 5;
         _loc1_.right = 5;
         _loc1_.top = 5;
         _loc1_.bottom = 18;
         _loc1_.setStyle("fontSize",12);
         _loc1_.setStyle("color",16777215);
         _loc1_.setStyle("verticalAlign","middle");
         _loc1_.id = "infoDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.infoDisplay = _loc1_;
         BindingManager.executeBindings(this,"infoDisplay",this.infoDisplay);
         return _loc1_;
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
      public function get infoDisplay() : RichEditableText
      {
         return this._299873228infoDisplay;
      }
      
      public function set infoDisplay(param1:RichEditableText) : void
      {
         var _loc2_:Object = this._299873228infoDisplay;
         if(_loc2_ !== param1)
         {
            this._299873228infoDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"infoDisplay",_loc2_,param1));
            }
         }
      }
   }
}
