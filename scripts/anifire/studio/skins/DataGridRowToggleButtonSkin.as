package anifire.studio.skins
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.primitives.BitmapImage;
   import spark.primitives.Rect;
   import spark.skins.SparkButtonSkin;
   
   public class DataGridRowToggleButtonSkin extends SparkButtonSkin implements IStateClient2
   {
      
      private static const exclusions:Array = ["labelDisplay"];
       
      
      private var _309341994_DataGridRowToggleButtonSkin_BitmapImage1:BitmapImage;
      
      private var _309341993_DataGridRowToggleButtonSkin_BitmapImage2:BitmapImage;
      
      private var _1406221576_DataGridRowToggleButtonSkin_SolidColor1:SolidColor;
      
      private var _916330384_DataGridRowToggleButtonSkin_SolidColorStroke1:SolidColorStroke;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var cornerRadius:Number = 2;
      
      private var _embed_mxml__styles_images_widget_img_dragging_v_png_1450199689:Class;
      
      private var _embed_mxml__styles_images_widget_img_drag_v_png_1008812563:Class;
      
      public function DataGridRowToggleButtonSkin()
      {
         this._embed_mxml__styles_images_widget_img_dragging_v_png_1450199689 = DataGridRowToggleButtonSkin__embed_mxml__styles_images_widget_img_dragging_v_png_1450199689;
         this._embed_mxml__styles_images_widget_img_drag_v_png_1008812563 = DataGridRowToggleButtonSkin__embed_mxml__styles_images_widget_img_drag_v_png_1008812563;
         super();
         mx_internal::_document = this;
         this.minWidth = 10;
         this.minHeight = 10;
         this.mxmlContent = [this._DataGridRowToggleButtonSkin_Rect1_c(),this._DataGridRowToggleButtonSkin_BitmapImage1_i(),this._DataGridRowToggleButtonSkin_BitmapImage2_i()];
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
               "target":"_DataGridRowToggleButtonSkin_SolidColor1",
               "name":"color",
               "value":16768172
            }),new SetProperty().initializeFromObject({
               "target":"_DataGridRowToggleButtonSkin_SolidColorStroke1",
               "name":"color",
               "value":16762237
            }),new SetProperty().initializeFromObject({
               "target":"_DataGridRowToggleButtonSkin_BitmapImage1",
               "name":"visible",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"_DataGridRowToggleButtonSkin_BitmapImage2",
               "name":"visible",
               "value":true
            })]
         }),new State({
            "name":"overAndSelected",
            "stateGroups":["selectedStates","overStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_DataGridRowToggleButtonSkin_SolidColor1",
               "name":"color",
               "value":16768172
            }),new SetProperty().initializeFromObject({
               "target":"_DataGridRowToggleButtonSkin_SolidColorStroke1",
               "name":"color",
               "value":16762237
            }),new SetProperty().initializeFromObject({
               "target":"_DataGridRowToggleButtonSkin_BitmapImage1",
               "name":"visible",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"_DataGridRowToggleButtonSkin_BitmapImage2",
               "name":"visible",
               "value":true
            })]
         }),new State({
            "name":"downAndSelected",
            "stateGroups":["selectedStates","downStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_DataGridRowToggleButtonSkin_SolidColor1",
               "name":"color",
               "value":16768172
            }),new SetProperty().initializeFromObject({
               "target":"_DataGridRowToggleButtonSkin_SolidColorStroke1",
               "name":"color",
               "value":16762237
            }),new SetProperty().initializeFromObject({
               "target":"_DataGridRowToggleButtonSkin_BitmapImage1",
               "name":"visible",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"_DataGridRowToggleButtonSkin_BitmapImage2",
               "name":"visible",
               "value":true
            })]
         }),new State({
            "name":"disabledAndSelected",
            "stateGroups":["selectedStates","selectedUpStates","disabledStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            }),new SetProperty().initializeFromObject({
               "target":"_DataGridRowToggleButtonSkin_SolidColor1",
               "name":"color",
               "value":16768172
            }),new SetProperty().initializeFromObject({
               "target":"_DataGridRowToggleButtonSkin_SolidColorStroke1",
               "name":"color",
               "value":16762237
            }),new SetProperty().initializeFromObject({
               "target":"_DataGridRowToggleButtonSkin_BitmapImage1",
               "name":"visible",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"_DataGridRowToggleButtonSkin_BitmapImage2",
               "name":"visible",
               "value":true
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
         }
         super.updateDisplayList(param1,param2);
      }
      
      private function _DataGridRowToggleButtonSkin_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.fill = this._DataGridRowToggleButtonSkin_SolidColor1_i();
         _loc1_.stroke = this._DataGridRowToggleButtonSkin_SolidColorStroke1_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _DataGridRowToggleButtonSkin_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 11715288;
         this._DataGridRowToggleButtonSkin_SolidColor1 = _loc1_;
         BindingManager.executeBindings(this,"_DataGridRowToggleButtonSkin_SolidColor1",this._DataGridRowToggleButtonSkin_SolidColor1);
         return _loc1_;
      }
      
      private function _DataGridRowToggleButtonSkin_SolidColorStroke1_i() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 13092807;
         this._DataGridRowToggleButtonSkin_SolidColorStroke1 = _loc1_;
         BindingManager.executeBindings(this,"_DataGridRowToggleButtonSkin_SolidColorStroke1",this._DataGridRowToggleButtonSkin_SolidColorStroke1);
         return _loc1_;
      }
      
      private function _DataGridRowToggleButtonSkin_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__styles_images_widget_img_drag_v_png_1008812563;
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.initialized(this,"_DataGridRowToggleButtonSkin_BitmapImage1");
         this._DataGridRowToggleButtonSkin_BitmapImage1 = _loc1_;
         BindingManager.executeBindings(this,"_DataGridRowToggleButtonSkin_BitmapImage1",this._DataGridRowToggleButtonSkin_BitmapImage1);
         return _loc1_;
      }
      
      private function _DataGridRowToggleButtonSkin_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__styles_images_widget_img_dragging_v_png_1450199689;
         _loc1_.visible = false;
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.initialized(this,"_DataGridRowToggleButtonSkin_BitmapImage2");
         this._DataGridRowToggleButtonSkin_BitmapImage2 = _loc1_;
         BindingManager.executeBindings(this,"_DataGridRowToggleButtonSkin_BitmapImage2",this._DataGridRowToggleButtonSkin_BitmapImage2);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _DataGridRowToggleButtonSkin_BitmapImage1() : BitmapImage
      {
         return this._309341994_DataGridRowToggleButtonSkin_BitmapImage1;
      }
      
      public function set _DataGridRowToggleButtonSkin_BitmapImage1(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._309341994_DataGridRowToggleButtonSkin_BitmapImage1;
         if(_loc2_ !== param1)
         {
            this._309341994_DataGridRowToggleButtonSkin_BitmapImage1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DataGridRowToggleButtonSkin_BitmapImage1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _DataGridRowToggleButtonSkin_BitmapImage2() : BitmapImage
      {
         return this._309341993_DataGridRowToggleButtonSkin_BitmapImage2;
      }
      
      public function set _DataGridRowToggleButtonSkin_BitmapImage2(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._309341993_DataGridRowToggleButtonSkin_BitmapImage2;
         if(_loc2_ !== param1)
         {
            this._309341993_DataGridRowToggleButtonSkin_BitmapImage2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DataGridRowToggleButtonSkin_BitmapImage2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _DataGridRowToggleButtonSkin_SolidColor1() : SolidColor
      {
         return this._1406221576_DataGridRowToggleButtonSkin_SolidColor1;
      }
      
      public function set _DataGridRowToggleButtonSkin_SolidColor1(param1:SolidColor) : void
      {
         var _loc2_:Object = this._1406221576_DataGridRowToggleButtonSkin_SolidColor1;
         if(_loc2_ !== param1)
         {
            this._1406221576_DataGridRowToggleButtonSkin_SolidColor1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DataGridRowToggleButtonSkin_SolidColor1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _DataGridRowToggleButtonSkin_SolidColorStroke1() : SolidColorStroke
      {
         return this._916330384_DataGridRowToggleButtonSkin_SolidColorStroke1;
      }
      
      public function set _DataGridRowToggleButtonSkin_SolidColorStroke1(param1:SolidColorStroke) : void
      {
         var _loc2_:Object = this._916330384_DataGridRowToggleButtonSkin_SolidColorStroke1;
         if(_loc2_ !== param1)
         {
            this._916330384_DataGridRowToggleButtonSkin_SolidColorStroke1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DataGridRowToggleButtonSkin_SolidColorStroke1",_loc2_,param1));
            }
         }
      }
   }
}
