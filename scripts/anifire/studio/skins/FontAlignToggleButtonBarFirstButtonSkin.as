package anifire.studio.skins
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.primitives.BitmapImage;
   import spark.primitives.Rect;
   import spark.skins.SparkButtonSkin;
   
   public class FontAlignToggleButtonBarFirstButtonSkin extends SparkButtonSkin implements IStateClient2
   {
       
      
      private var _1815691355_FontAlignToggleButtonBarFirstButtonSkin_BitmapImage1:BitmapImage;
      
      private var _1613318371_FontAlignToggleButtonBarFirstButtonSkin_SolidColor1:SolidColor;
      
      private var _1383304148border:Rect;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__styles_images_panel_text_alignleft_png_689242313:Class;
      
      private var _embed_mxml__styles_images_panel_text_alignleft_on_png_818768599:Class;
      
      public function FontAlignToggleButtonBarFirstButtonSkin()
      {
         this._embed_mxml__styles_images_panel_text_alignleft_png_689242313 = FontAlignToggleButtonBarFirstButtonSkin__embed_mxml__styles_images_panel_text_alignleft_png_689242313;
         this._embed_mxml__styles_images_panel_text_alignleft_on_png_818768599 = FontAlignToggleButtonBarFirstButtonSkin__embed_mxml__styles_images_panel_text_alignleft_on_png_818768599;
         super();
         mx_internal::_document = this;
         this.width = 38;
         this.height = 34;
         this.mxmlContent = [this._FontAlignToggleButtonBarFirstButtonSkin_Rect1_i(),this._FontAlignToggleButtonBarFirstButtonSkin_BitmapImage1_i()];
         this.currentState = "up";
         states = [new State({
            "name":"up",
            "overrides":[]
         }),new State({
            "name":"over",
            "stateGroups":["overStates"],
            "overrides":[]
         }),new State({
            "name":"down",
            "stateGroups":["downStates"],
            "overrides":[]
         }),new State({
            "name":"disabled",
            "stateGroups":["disabledStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            })]
         }),new State({
            "name":"upAndSelected",
            "stateGroups":["selectedStates","selectedUpStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_FontAlignToggleButtonBarFirstButtonSkin_SolidColor1",
               "name":"color",
               "value":4439206
            }),new SetProperty().initializeFromObject({
               "target":"_FontAlignToggleButtonBarFirstButtonSkin_BitmapImage1",
               "name":"source",
               "value":this._embed_mxml__styles_images_panel_text_alignleft_on_png_818768599
            })]
         }),new State({
            "name":"overAndSelected",
            "stateGroups":["selectedStates","overStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_FontAlignToggleButtonBarFirstButtonSkin_SolidColor1",
               "name":"color",
               "value":4439206
            }),new SetProperty().initializeFromObject({
               "target":"_FontAlignToggleButtonBarFirstButtonSkin_BitmapImage1",
               "name":"source",
               "value":this._embed_mxml__styles_images_panel_text_alignleft_on_png_818768599
            })]
         }),new State({
            "name":"downAndSelected",
            "stateGroups":["selectedStates","downStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_FontAlignToggleButtonBarFirstButtonSkin_SolidColor1",
               "name":"color",
               "value":4439206
            }),new SetProperty().initializeFromObject({
               "target":"_FontAlignToggleButtonBarFirstButtonSkin_BitmapImage1",
               "name":"source",
               "value":this._embed_mxml__styles_images_panel_text_alignleft_on_png_818768599
            })]
         }),new State({
            "name":"disabledAndSelected",
            "stateGroups":["selectedStates","selectedUpStates","disabledStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_FontAlignToggleButtonBarFirstButtonSkin_SolidColor1",
               "name":"color",
               "value":4439206
            }),new SetProperty().initializeFromObject({
               "target":"_FontAlignToggleButtonBarFirstButtonSkin_BitmapImage1",
               "name":"source",
               "value":this._embed_mxml__styles_images_panel_text_alignleft_on_png_818768599
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
      
      private function _FontAlignToggleButtonBarFirstButtonSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.topLeftRadiusX = 2;
         _loc1_.bottomLeftRadiusX = 2;
         _loc1_.fill = this._FontAlignToggleButtonBarFirstButtonSkin_SolidColor1_i();
         _loc1_.initialized(this,"border");
         this.border = _loc1_;
         BindingManager.executeBindings(this,"border",this.border);
         return _loc1_;
      }
      
      private function _FontAlignToggleButtonBarFirstButtonSkin_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 15066597;
         this._FontAlignToggleButtonBarFirstButtonSkin_SolidColor1 = _loc1_;
         BindingManager.executeBindings(this,"_FontAlignToggleButtonBarFirstButtonSkin_SolidColor1",this._FontAlignToggleButtonBarFirstButtonSkin_SolidColor1);
         return _loc1_;
      }
      
      private function _FontAlignToggleButtonBarFirstButtonSkin_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.source = this._embed_mxml__styles_images_panel_text_alignleft_png_689242313;
         _loc1_.initialized(this,"_FontAlignToggleButtonBarFirstButtonSkin_BitmapImage1");
         this._FontAlignToggleButtonBarFirstButtonSkin_BitmapImage1 = _loc1_;
         BindingManager.executeBindings(this,"_FontAlignToggleButtonBarFirstButtonSkin_BitmapImage1",this._FontAlignToggleButtonBarFirstButtonSkin_BitmapImage1);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _FontAlignToggleButtonBarFirstButtonSkin_BitmapImage1() : BitmapImage
      {
         return this._1815691355_FontAlignToggleButtonBarFirstButtonSkin_BitmapImage1;
      }
      
      public function set _FontAlignToggleButtonBarFirstButtonSkin_BitmapImage1(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1815691355_FontAlignToggleButtonBarFirstButtonSkin_BitmapImage1;
         if(_loc2_ !== param1)
         {
            this._1815691355_FontAlignToggleButtonBarFirstButtonSkin_BitmapImage1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_FontAlignToggleButtonBarFirstButtonSkin_BitmapImage1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _FontAlignToggleButtonBarFirstButtonSkin_SolidColor1() : SolidColor
      {
         return this._1613318371_FontAlignToggleButtonBarFirstButtonSkin_SolidColor1;
      }
      
      public function set _FontAlignToggleButtonBarFirstButtonSkin_SolidColor1(param1:SolidColor) : void
      {
         var _loc2_:Object = this._1613318371_FontAlignToggleButtonBarFirstButtonSkin_SolidColor1;
         if(_loc2_ !== param1)
         {
            this._1613318371_FontAlignToggleButtonBarFirstButtonSkin_SolidColor1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_FontAlignToggleButtonBarFirstButtonSkin_SolidColor1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get border() : Rect
      {
         return this._1383304148border;
      }
      
      public function set border(param1:Rect) : void
      {
         var _loc2_:Object = this._1383304148border;
         if(_loc2_ !== param1)
         {
            this._1383304148border = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"border",_loc2_,param1));
            }
         }
      }
   }
}
