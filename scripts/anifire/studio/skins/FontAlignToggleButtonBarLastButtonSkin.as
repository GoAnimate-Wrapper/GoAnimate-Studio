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
   
   public class FontAlignToggleButtonBarLastButtonSkin extends SparkButtonSkin implements IStateClient2
   {
       
      
      private var _1900546487_FontAlignToggleButtonBarLastButtonSkin_BitmapImage1:BitmapImage;
      
      private var _584770251_FontAlignToggleButtonBarLastButtonSkin_SolidColor1:SolidColor;
      
      private var _1383304148border:Rect;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__styles_images_panel_text_alignright_png_1500547733:Class;
      
      private var _embed_mxml__styles_images_panel_text_alignright_on_png_1148946103:Class;
      
      public function FontAlignToggleButtonBarLastButtonSkin()
      {
         this._embed_mxml__styles_images_panel_text_alignright_png_1500547733 = FontAlignToggleButtonBarLastButtonSkin__embed_mxml__styles_images_panel_text_alignright_png_1500547733;
         this._embed_mxml__styles_images_panel_text_alignright_on_png_1148946103 = FontAlignToggleButtonBarLastButtonSkin__embed_mxml__styles_images_panel_text_alignright_on_png_1148946103;
         super();
         mx_internal::_document = this;
         this.width = 38;
         this.height = 34;
         this.mxmlContent = [this._FontAlignToggleButtonBarLastButtonSkin_Rect1_i(),this._FontAlignToggleButtonBarLastButtonSkin_BitmapImage1_i()];
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
               "target":"_FontAlignToggleButtonBarLastButtonSkin_SolidColor1",
               "name":"color",
               "value":4439206
            }),new SetProperty().initializeFromObject({
               "target":"_FontAlignToggleButtonBarLastButtonSkin_BitmapImage1",
               "name":"source",
               "value":this._embed_mxml__styles_images_panel_text_alignright_on_png_1148946103
            })]
         }),new State({
            "name":"overAndSelected",
            "stateGroups":["selectedStates","overStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_FontAlignToggleButtonBarLastButtonSkin_SolidColor1",
               "name":"color",
               "value":4439206
            }),new SetProperty().initializeFromObject({
               "target":"_FontAlignToggleButtonBarLastButtonSkin_BitmapImage1",
               "name":"source",
               "value":this._embed_mxml__styles_images_panel_text_alignright_on_png_1148946103
            })]
         }),new State({
            "name":"downAndSelected",
            "stateGroups":["selectedStates","downStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_FontAlignToggleButtonBarLastButtonSkin_SolidColor1",
               "name":"color",
               "value":4439206
            }),new SetProperty().initializeFromObject({
               "target":"_FontAlignToggleButtonBarLastButtonSkin_BitmapImage1",
               "name":"source",
               "value":this._embed_mxml__styles_images_panel_text_alignright_on_png_1148946103
            })]
         }),new State({
            "name":"disabledAndSelected",
            "stateGroups":["selectedStates","selectedUpStates","disabledStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_FontAlignToggleButtonBarLastButtonSkin_SolidColor1",
               "name":"color",
               "value":4439206
            }),new SetProperty().initializeFromObject({
               "target":"_FontAlignToggleButtonBarLastButtonSkin_BitmapImage1",
               "name":"source",
               "value":this._embed_mxml__styles_images_panel_text_alignright_on_png_1148946103
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
      
      private function _FontAlignToggleButtonBarLastButtonSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.topRightRadiusX = 2;
         _loc1_.bottomRightRadiusX = 2;
         _loc1_.fill = this._FontAlignToggleButtonBarLastButtonSkin_SolidColor1_i();
         _loc1_.initialized(this,"border");
         this.border = _loc1_;
         BindingManager.executeBindings(this,"border",this.border);
         return _loc1_;
      }
      
      private function _FontAlignToggleButtonBarLastButtonSkin_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 15066597;
         this._FontAlignToggleButtonBarLastButtonSkin_SolidColor1 = _loc1_;
         BindingManager.executeBindings(this,"_FontAlignToggleButtonBarLastButtonSkin_SolidColor1",this._FontAlignToggleButtonBarLastButtonSkin_SolidColor1);
         return _loc1_;
      }
      
      private function _FontAlignToggleButtonBarLastButtonSkin_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.source = this._embed_mxml__styles_images_panel_text_alignright_png_1500547733;
         _loc1_.initialized(this,"_FontAlignToggleButtonBarLastButtonSkin_BitmapImage1");
         this._FontAlignToggleButtonBarLastButtonSkin_BitmapImage1 = _loc1_;
         BindingManager.executeBindings(this,"_FontAlignToggleButtonBarLastButtonSkin_BitmapImage1",this._FontAlignToggleButtonBarLastButtonSkin_BitmapImage1);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _FontAlignToggleButtonBarLastButtonSkin_BitmapImage1() : BitmapImage
      {
         return this._1900546487_FontAlignToggleButtonBarLastButtonSkin_BitmapImage1;
      }
      
      public function set _FontAlignToggleButtonBarLastButtonSkin_BitmapImage1(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1900546487_FontAlignToggleButtonBarLastButtonSkin_BitmapImage1;
         if(_loc2_ !== param1)
         {
            this._1900546487_FontAlignToggleButtonBarLastButtonSkin_BitmapImage1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_FontAlignToggleButtonBarLastButtonSkin_BitmapImage1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _FontAlignToggleButtonBarLastButtonSkin_SolidColor1() : SolidColor
      {
         return this._584770251_FontAlignToggleButtonBarLastButtonSkin_SolidColor1;
      }
      
      public function set _FontAlignToggleButtonBarLastButtonSkin_SolidColor1(param1:SolidColor) : void
      {
         var _loc2_:Object = this._584770251_FontAlignToggleButtonBarLastButtonSkin_SolidColor1;
         if(_loc2_ !== param1)
         {
            this._584770251_FontAlignToggleButtonBarLastButtonSkin_SolidColor1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_FontAlignToggleButtonBarLastButtonSkin_SolidColor1",_loc2_,param1));
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
