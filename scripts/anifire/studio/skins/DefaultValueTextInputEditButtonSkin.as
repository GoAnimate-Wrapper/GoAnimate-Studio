package anifire.studio.skins
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.primitives.BitmapImage;
   import spark.primitives.Rect;
   import spark.skins.SparkButtonSkin;
   
   public class DefaultValueTextInputEditButtonSkin extends SparkButtonSkin implements IStateClient2
   {
      
      private static const exclusions:Array = ["labelDisplay"];
       
      
      private var _3143043fill:Rect;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var cornerRadius:Number = 2;
      
      private var _embed_mxml__styles_images_icons_icon_edit_png_1136996627:Class;
      
      public function DefaultValueTextInputEditButtonSkin()
      {
         this._embed_mxml__styles_images_icons_icon_edit_png_1136996627 = DefaultValueTextInputEditButtonSkin__embed_mxml__styles_images_icons_icon_edit_png_1136996627;
         super();
         mx_internal::_document = this;
         this.minWidth = 21;
         this.minHeight = 21;
         this.mxmlContent = [this._DefaultValueTextInputEditButtonSkin_Rect1_i(),this._DefaultValueTextInputEditButtonSkin_HGroup1_c()];
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
      
      override public function get colorizeExclusions() : Array
      {
         return exclusions;
      }
      
      override protected function initializationComplete() : void
      {
         useChromeColor = true;
         super.initializationComplete();
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc3_:Number = getStyle("cornerRadius");
         if(this.cornerRadius != _loc3_)
         {
            this.cornerRadius = _loc3_;
            this.fill.radiusX = this.cornerRadius;
         }
         super.updateDisplayList(param1,param2);
      }
      
      private function _DefaultValueTextInputEditButtonSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._DefaultValueTextInputEditButtonSkin_SolidColor1_c();
         _loc1_.initialized(this,"fill");
         this.fill = _loc1_;
         BindingManager.executeBindings(this,"fill",this.fill);
         return _loc1_;
      }
      
      private function _DefaultValueTextInputEditButtonSkin_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _DefaultValueTextInputEditButtonSkin_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.mxmlContent = [this._DefaultValueTextInputEditButtonSkin_Label1_i(),this._DefaultValueTextInputEditButtonSkin_BitmapImage1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _DefaultValueTextInputEditButtonSkin_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.maxDisplayedLines = 1;
         _loc1_.setStyle("verticalAlign","middle");
         _loc1_.setStyle("color",11184810);
         _loc1_.id = "labelDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         labelDisplay = _loc1_;
         BindingManager.executeBindings(this,"labelDisplay",labelDisplay);
         return _loc1_;
      }
      
      private function _DefaultValueTextInputEditButtonSkin_BitmapImage1_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__styles_images_icons_icon_edit_png_1136996627;
         _loc1_.initialized(this,null);
         return _loc1_;
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
   }
}
