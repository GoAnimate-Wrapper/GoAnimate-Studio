package anifire.studio.skins
{
   import anifire.studio.components.ColorPalette;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Group;
   import spark.components.VGroup;
   import spark.primitives.Path;
   import spark.primitives.Rect;
   import spark.skins.SparkButtonSkin;
   
   public class ColorPalettePickerOpenButtonSkin extends SparkButtonSkin implements IStateClient2
   {
      
      private static const exclusions:Array = ["labelDisplay"];
       
      
      private var _117666041_ColorPalettePickerOpenButtonSkin_SolidColor2:SolidColor;
      
      private var _1153001568_ColorPalettePickerOpenButtonSkin_SolidColorStroke1:SolidColorStroke;
      
      private var _3143043fill:Rect;
      
      private var _798910853palette:ColorPalette;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var cornerRadius:Number = 2;
      
      public function ColorPalettePickerOpenButtonSkin()
      {
         super();
         mx_internal::_document = this;
         this.minWidth = 21;
         this.minHeight = 21;
         this.mxmlContent = [this._ColorPalettePickerOpenButtonSkin_VGroup1_c()];
         this.currentState = "up";
         states = [new State({
            "name":"up",
            "overrides":[]
         }),new State({
            "name":"over",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_ColorPalettePickerOpenButtonSkin_SolidColorStroke1",
               "name":"color",
               "value":5093288
            }),new SetProperty().initializeFromObject({
               "target":"_ColorPalettePickerOpenButtonSkin_SolidColor2",
               "name":"color",
               "value":5093288
            })]
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
      
      private function _ColorPalettePickerOpenButtonSkin_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.horizontalAlign = "center";
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._ColorPalettePickerOpenButtonSkin_Group1_c(),this._ColorPalettePickerOpenButtonSkin_Group2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ColorPalettePickerOpenButtonSkin_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._ColorPalettePickerOpenButtonSkin_Rect1_i(),this._ColorPalettePickerOpenButtonSkin_ColorPalette1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ColorPalettePickerOpenButtonSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.radiusX = 2;
         _loc1_.fill = this._ColorPalettePickerOpenButtonSkin_SolidColor1_c();
         _loc1_.stroke = this._ColorPalettePickerOpenButtonSkin_SolidColorStroke1_i();
         _loc1_.initialized(this,"fill");
         this.fill = _loc1_;
         BindingManager.executeBindings(this,"fill",this.fill);
         return _loc1_;
      }
      
      private function _ColorPalettePickerOpenButtonSkin_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _ColorPalettePickerOpenButtonSkin_SolidColorStroke1_i() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 13421772;
         this._ColorPalettePickerOpenButtonSkin_SolidColorStroke1 = _loc1_;
         BindingManager.executeBindings(this,"_ColorPalettePickerOpenButtonSkin_SolidColorStroke1",this._ColorPalettePickerOpenButtonSkin_SolidColorStroke1);
         return _loc1_;
      }
      
      private function _ColorPalettePickerOpenButtonSkin_ColorPalette1_i() : ColorPalette
      {
         var _loc1_:ColorPalette = new ColorPalette();
         _loc1_.maxColor = 6;
         _loc1_.top = 2;
         _loc1_.bottom = 2;
         _loc1_.left = 2;
         _loc1_.right = 2;
         _loc1_.setStyle("skinClass",ColorPaletteMiniSkin);
         _loc1_.id = "palette";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.palette = _loc1_;
         BindingManager.executeBindings(this,"palette",this.palette);
         return _loc1_;
      }
      
      private function _ColorPalettePickerOpenButtonSkin_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._ColorPalettePickerOpenButtonSkin_Path1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ColorPalettePickerOpenButtonSkin_Path1_c() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.percentHeight = 100;
         _loc1_.data = "M 0 0 l 6 6 l 6 -6 Z";
         _loc1_.fill = this._ColorPalettePickerOpenButtonSkin_SolidColor2_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ColorPalettePickerOpenButtonSkin_SolidColor2_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 13421772;
         this._ColorPalettePickerOpenButtonSkin_SolidColor2 = _loc1_;
         BindingManager.executeBindings(this,"_ColorPalettePickerOpenButtonSkin_SolidColor2",this._ColorPalettePickerOpenButtonSkin_SolidColor2);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _ColorPalettePickerOpenButtonSkin_SolidColor2() : SolidColor
      {
         return this._117666041_ColorPalettePickerOpenButtonSkin_SolidColor2;
      }
      
      public function set _ColorPalettePickerOpenButtonSkin_SolidColor2(param1:SolidColor) : void
      {
         var _loc2_:Object = this._117666041_ColorPalettePickerOpenButtonSkin_SolidColor2;
         if(_loc2_ !== param1)
         {
            this._117666041_ColorPalettePickerOpenButtonSkin_SolidColor2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ColorPalettePickerOpenButtonSkin_SolidColor2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _ColorPalettePickerOpenButtonSkin_SolidColorStroke1() : SolidColorStroke
      {
         return this._1153001568_ColorPalettePickerOpenButtonSkin_SolidColorStroke1;
      }
      
      public function set _ColorPalettePickerOpenButtonSkin_SolidColorStroke1(param1:SolidColorStroke) : void
      {
         var _loc2_:Object = this._1153001568_ColorPalettePickerOpenButtonSkin_SolidColorStroke1;
         if(_loc2_ !== param1)
         {
            this._1153001568_ColorPalettePickerOpenButtonSkin_SolidColorStroke1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ColorPalettePickerOpenButtonSkin_SolidColorStroke1",_loc2_,param1));
            }
         }
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
      
      [Bindable(event="propertyChange")]
      public function get palette() : ColorPalette
      {
         return this._798910853palette;
      }
      
      public function set palette(param1:ColorPalette) : void
      {
         var _loc2_:Object = this._798910853palette;
         if(_loc2_ !== param1)
         {
            this._798910853palette = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"palette",_loc2_,param1));
            }
         }
      }
   }
}
