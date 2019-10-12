package anifire.studio.skins
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.HGroup;
   import spark.components.RadioButton;
   import spark.primitives.BitmapImage;
   import spark.skins.SparkSkin;
   
   public class FlatRadioButtonHorizontalSkin extends SparkSkin implements IStateClient2
   {
      
      private static const focusExclusions:Array = ["labelDisplay"];
       
      
      private var _1836954358baseImage:BitmapImage;
      
      private var _1410965406iconImage:BitmapImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__styles_images_common_radio_selected_png_1500612237:Class;
      
      private var _embed_mxml__styles_images_panel_icon_horizontal_png_1588610709:Class;
      
      private var _embed_mxml__styles_images_common_radio_base_png_195960919:Class;
      
      private var _213507019hostComponent:RadioButton;
      
      public function FlatRadioButtonHorizontalSkin()
      {
         this._embed_mxml__styles_images_common_radio_selected_png_1500612237 = FlatRadioButtonHorizontalSkin__embed_mxml__styles_images_common_radio_selected_png_1500612237;
         this._embed_mxml__styles_images_panel_icon_horizontal_png_1588610709 = FlatRadioButtonHorizontalSkin__embed_mxml__styles_images_panel_icon_horizontal_png_1588610709;
         this._embed_mxml__styles_images_common_radio_base_png_195960919 = FlatRadioButtonHorizontalSkin__embed_mxml__styles_images_common_radio_base_png_195960919;
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._FlatRadioButtonHorizontalSkin_HGroup1_c()];
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
            "stateGroups":["selectedStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"baseImage",
               "name":"source",
               "value":this._embed_mxml__styles_images_common_radio_selected_png_1500612237
            })]
         }),new State({
            "name":"overAndSelected",
            "stateGroups":["selectedStates","overStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"baseImage",
               "name":"source",
               "value":this._embed_mxml__styles_images_common_radio_selected_png_1500612237
            })]
         }),new State({
            "name":"downAndSelected",
            "stateGroups":["selectedStates","downStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"baseImage",
               "name":"source",
               "value":this._embed_mxml__styles_images_common_radio_selected_png_1500612237
            })]
         }),new State({
            "name":"disabledAndSelected",
            "stateGroups":["selectedStates","disabledStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            }),new SetProperty().initializeFromObject({
               "target":"baseImage",
               "name":"source",
               "value":this._embed_mxml__styles_images_common_radio_selected_png_1500612237
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
      
      override public function get focusSkinExclusions() : Array
      {
         return focusExclusions;
      }
      
      private function _FlatRadioButtonHorizontalSkin_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.gap = 10;
         _loc1_.mxmlContent = [this._FlatRadioButtonHorizontalSkin_BitmapImage1_i(),this._FlatRadioButtonHorizontalSkin_BitmapImage2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FlatRadioButtonHorizontalSkin_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.verticalCenter = -1;
         _loc1_.smooth = true;
         _loc1_.source = this._embed_mxml__styles_images_common_radio_base_png_195960919;
         _loc1_.initialized(this,"baseImage");
         this.baseImage = _loc1_;
         BindingManager.executeBindings(this,"baseImage",this.baseImage);
         return _loc1_;
      }
      
      private function _FlatRadioButtonHorizontalSkin_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.verticalCenter = -1;
         _loc1_.smooth = true;
         _loc1_.source = this._embed_mxml__styles_images_panel_icon_horizontal_png_1588610709;
         _loc1_.initialized(this,"iconImage");
         this.iconImage = _loc1_;
         BindingManager.executeBindings(this,"iconImage",this.iconImage);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get baseImage() : BitmapImage
      {
         return this._1836954358baseImage;
      }
      
      public function set baseImage(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1836954358baseImage;
         if(_loc2_ !== param1)
         {
            this._1836954358baseImage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"baseImage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get iconImage() : BitmapImage
      {
         return this._1410965406iconImage;
      }
      
      public function set iconImage(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1410965406iconImage;
         if(_loc2_ !== param1)
         {
            this._1410965406iconImage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"iconImage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : RadioButton
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:RadioButton) : void
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
