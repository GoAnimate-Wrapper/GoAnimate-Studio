package anifire.studio.components
{
   import anifire.studio.models.ColorPaletteModel;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.supportClasses.ItemRenderer;
   import spark.primitives.Rect;
   
   public class ColorPalettePickerSingleColorItemRenderer extends ItemRenderer implements IStateClient2
   {
       
      
      private var _2136008826_ColorPalettePickerSingleColorItemRenderer_Rect1:Rect;
      
      private var _358089761colorDisplay:ColorDisplayGroup;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function ColorPalettePickerSingleColorItemRenderer()
      {
         super();
         mx_internal::_document = this;
         this.width = 28;
         this.height = 28;
         this.buttonMode = true;
         this.mxmlContent = [this._ColorPalettePickerSingleColorItemRenderer_Rect1_i(),this._ColorPalettePickerSingleColorItemRenderer_ColorDisplayGroup1_i()];
         this.currentState = "normal";
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"hovered",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_ColorPalettePickerSingleColorItemRenderer_Rect1",
               "name":"stroke",
               "value":this._ColorPalettePickerSingleColorItemRenderer_SolidColorStroke1_c()
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
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         var _loc2_:ColorPaletteModel = param1 as ColorPaletteModel;
         if(_loc2_)
         {
            this.colorDisplay.color = _loc2_.getColorAt(0);
         }
      }
      
      private function _ColorPalettePickerSingleColorItemRenderer_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._ColorPalettePickerSingleColorItemRenderer_SolidColor1_c();
         _loc1_.initialized(this,"_ColorPalettePickerSingleColorItemRenderer_Rect1");
         this._ColorPalettePickerSingleColorItemRenderer_Rect1 = _loc1_;
         BindingManager.executeBindings(this,"_ColorPalettePickerSingleColorItemRenderer_Rect1",this._ColorPalettePickerSingleColorItemRenderer_Rect1);
         return _loc1_;
      }
      
      private function _ColorPalettePickerSingleColorItemRenderer_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _ColorPalettePickerSingleColorItemRenderer_ColorDisplayGroup1_i() : ColorDisplayGroup
      {
         var _loc1_:ColorDisplayGroup = new ColorDisplayGroup();
         _loc1_.width = 18;
         _loc1_.height = 18;
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.id = "colorDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.colorDisplay = _loc1_;
         BindingManager.executeBindings(this,"colorDisplay",this.colorDisplay);
         return _loc1_;
      }
      
      private function _ColorPalettePickerSingleColorItemRenderer_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 5093288;
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _ColorPalettePickerSingleColorItemRenderer_Rect1() : Rect
      {
         return this._2136008826_ColorPalettePickerSingleColorItemRenderer_Rect1;
      }
      
      public function set _ColorPalettePickerSingleColorItemRenderer_Rect1(param1:Rect) : void
      {
         var _loc2_:Object = this._2136008826_ColorPalettePickerSingleColorItemRenderer_Rect1;
         if(_loc2_ !== param1)
         {
            this._2136008826_ColorPalettePickerSingleColorItemRenderer_Rect1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ColorPalettePickerSingleColorItemRenderer_Rect1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get colorDisplay() : ColorDisplayGroup
      {
         return this._358089761colorDisplay;
      }
      
      public function set colorDisplay(param1:ColorDisplayGroup) : void
      {
         var _loc2_:Object = this._358089761colorDisplay;
         if(_loc2_ !== param1)
         {
            this._358089761colorDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"colorDisplay",_loc2_,param1));
            }
         }
      }
   }
}
