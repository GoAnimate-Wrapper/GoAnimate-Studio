package anifire.studio.assets.control
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import spark.components.Group;
   import spark.components.Label;
   import spark.primitives.Rect;
   
   public class AssetMotionToolTip extends Group
   {
       
      
      private var _1184053038labelDisplay:Label;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function AssetMotionToolTip()
      {
         super();
         mx_internal::_document = this;
         this.width = 40;
         this.height = 15;
         this.mouseChildren = false;
         this.mouseEnabled = false;
         this.mxmlContent = [this._AssetMotionToolTip_Rect1_c(),this._AssetMotionToolTip_Label1_i()];
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
      
      public function setLabelText(param1:String) : void
      {
         this.labelDisplay.text = param1;
      }
      
      private function _AssetMotionToolTip_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.radiusX = 3;
         _loc1_.fill = this._AssetMotionToolTip_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _AssetMotionToolTip_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 5405190;
         _loc1_.alpha = 0.8;
         return _loc1_;
      }
      
      private function _AssetMotionToolTip_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.setStyle("color",16777215);
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
   }
}
