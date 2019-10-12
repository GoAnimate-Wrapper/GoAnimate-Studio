package anifire.component
{
   import anifire.event.ColorPaletteEvent;
   import anifire.event.EyeDropperEvent;
   import anifire.managers.ColorUtils;
   import anifire.skins.ColorInputPanelSkin;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.ui.Keyboard;
   import mx.collections.ArrayCollection;
   import mx.events.FlexEvent;
   import mx.graphics.SolidColor;
   import mx.utils.HSBColor;
   import spark.components.Button;
   import spark.components.DropDownList;
   import spark.components.Group;
   import spark.components.TextInput;
   import spark.components.VSlider;
   import spark.components.supportClasses.SkinnableComponent;
   import spark.events.IndexChangeEvent;
   import spark.events.RendererExistenceEvent;
   import spark.events.TrackBaseEvent;
   
   public class ColorInputPanel extends SkinnableComponent
   {
      
      public static const COLOR_SPACE_HEX:String = "HEX";
      
      public static const COLOR_SPACE_RGB:String = "RGB";
      
      public static const COLOR_SPACE_HSB:String = "HSB";
      
      private static const COLOR_FIELD_SIZE:int = 200;
      
      private static const HUE_MIN_VALUE:Number = 0;
      
      private static const HUE_MAX_VALUE:Number = 359;
      
      private static const SATURATION_MIN_VALUE:Number = 0;
      
      private static const SATURATION_MAX_VALUE:Number = 1;
      
      private static const BRIGHTNESS_MIN_VALUE:Number = 0;
      
      private static const BRIGHTNESS_MAX_VALUE:Number = 1;
       
      
      protected var _draggingColorField:Boolean;
      
      protected var _selectedColorSpace:String = "HEX";
      
      [SkinPart(required="true")]
      public var colorFieldGroup:Group;
      
      [SkinPart(required="true")]
      public var colorFieldCursor:Group;
      
      [SkinPart(required="true")]
      public var hueSlider:VSlider;
      
      [SkinPart(required="true")]
      public var colorSpaceTypeDropDownList:DropDownList;
      
      [SkinPart(required="true")]
      public var colorFieldBaseColor:SolidColor;
      
      [SkinPart(required="true")]
      public var hexInputArea:Group;
      
      [SkinPart(required="true")]
      public var hexInput:TextInput;
      
      [SkinPart(required="true")]
      public var rgbInputArea:Group;
      
      [SkinPart(required="true")]
      public var redInput:TextInput;
      
      [SkinPart(required="true")]
      public var greenInput:TextInput;
      
      [SkinPart(required="true")]
      public var blueInput:TextInput;
      
      [SkinPart(required="true")]
      public var hsbInputArea:Group;
      
      [SkinPart(required="true")]
      public var hueInput:TextInput;
      
      [SkinPart(required="true")]
      public var saturationInput:TextInput;
      
      [SkinPart(required="true")]
      public var brightnessInput:TextInput;
      
      [SkinPart(required="false")]
      public var eyeDropperButton:Button;
      
      protected var _currentColor:uint;
      
      protected var _hue:Number = 0;
      
      protected var _saturation:Number = 0;
      
      protected var _brightness:Number = 0;
      
      public function ColorInputPanel()
      {
         super();
         setStyle("skinClass",ColorInputPanelSkin);
      }
      
      public function get currentColor() : uint
      {
         return this._currentColor;
      }
      
      public function set currentColor(param1:uint) : void
      {
         if(this._currentColor != param1)
         {
            this._currentColor = param1;
            this.updateHsbColorSpace();
            this.updateUIComponents();
            this.notifyColorPreview();
         }
      }
      
      private function updateHexColorSpace() : void
      {
         this._currentColor = HSBColor.convertHSBtoRGB(this._hue,this._saturation,this._brightness);
         this.updateUIComponents();
         this.notifyColorPreview();
      }
      
      private function updateHsbColorSpace() : void
      {
         var _loc1_:HSBColor = HSBColor.convertRGBtoHSB(this._currentColor);
         if(!isNaN(_loc1_.hue))
         {
            this.hue = _loc1_.hue;
         }
         this.saturation = _loc1_.saturation;
         this.brightness = _loc1_.brightness;
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         switch(param2)
         {
            case this.colorSpaceTypeDropDownList:
               this.colorSpaceTypeDropDownList.dataProvider = new ArrayCollection([COLOR_SPACE_HEX,COLOR_SPACE_RGB,COLOR_SPACE_HSB]);
               this.colorSpaceTypeDropDownList.selectedItem = this._selectedColorSpace;
               this.colorSpaceTypeDropDownList.addEventListener(IndexChangeEvent.CHANGE,this.colorSpaceTypeDropDownList_changeHandler);
               this.colorSpaceTypeDropDownList.addEventListener(RendererExistenceEvent.RENDERER_ADD,this.colorSpaceTypeDropDownList_renderedAddHandler);
               this.colorSpaceTypeDropDownList.addEventListener(RendererExistenceEvent.RENDERER_REMOVE,this.colorSpaceTypeDropDownList_renderedRemoveHandler);
               break;
            case this.hueSlider:
               this.hueSlider.value = this._hue;
               this.hueSlider.addEventListener(Event.CHANGE,this.hueSlider_changeHandler);
               this.hueSlider.addEventListener(TrackBaseEvent.THUMB_RELEASE,this.hueSlider_thumbReleaseHandler);
               break;
            case this.colorFieldGroup:
               this.colorFieldGroup.addEventListener(MouseEvent.MOUSE_DOWN,this.colorFieldGroup_mouseDownHandler);
               this.colorFieldGroup.addEventListener(MouseEvent.MOUSE_MOVE,this.colorFieldGroup_mouseMoveHandler);
               this.colorFieldGroup.addEventListener(MouseEvent.MOUSE_UP,this.colorFieldGroup_mouseUpHandler);
               break;
            case this.colorFieldCursor:
               this.colorFieldCursor.mouseEnabled = false;
               this.colorFieldCursor.mouseChildren = false;
               this.colorFieldCursor.move(this._saturation * COLOR_FIELD_SIZE,(1 - this._brightness) * COLOR_FIELD_SIZE);
               break;
            case this.colorFieldBaseColor:
               this.colorFieldBaseColor.color = HSBColor.convertHSBtoRGB(this._hue,1,1);
               break;
            case this.hexInput:
               this.updateHexText();
               this.hexInput.addEventListener(FocusEvent.FOCUS_OUT,this.hexInput_focusOutHandler);
               this.hexInput.addEventListener(FlexEvent.ENTER,this.hexInput_enterHandler);
               break;
            case this.redInput:
               this.updateRgbText();
               this.redInput.addEventListener(FocusEvent.FOCUS_OUT,this.rgbInput_focusOutHandler);
               this.redInput.addEventListener(FlexEvent.ENTER,this.rgbInput_enterHandler);
               this.redInput.addEventListener(KeyboardEvent.KEY_DOWN,this.rgbInput_keyDownHandler);
               break;
            case this.greenInput:
               this.updateRgbText();
               this.greenInput.addEventListener(FocusEvent.FOCUS_OUT,this.rgbInput_focusOutHandler);
               this.greenInput.addEventListener(FlexEvent.ENTER,this.rgbInput_enterHandler);
               this.greenInput.addEventListener(KeyboardEvent.KEY_DOWN,this.rgbInput_keyDownHandler);
               break;
            case this.blueInput:
               this.updateRgbText();
               this.blueInput.addEventListener(FocusEvent.FOCUS_OUT,this.rgbInput_focusOutHandler);
               this.blueInput.addEventListener(FlexEvent.ENTER,this.rgbInput_enterHandler);
               this.blueInput.addEventListener(KeyboardEvent.KEY_DOWN,this.rgbInput_keyDownHandler);
               break;
            case this.hueInput:
               this.updateHsbText();
               this.hueInput.addEventListener(FocusEvent.FOCUS_OUT,this.hsbInput_focusOutHandler);
               this.hueInput.addEventListener(FlexEvent.ENTER,this.hsbInput_enterHandler);
               this.hueInput.addEventListener(KeyboardEvent.KEY_DOWN,this.hsbInput_keyDownHandler);
               break;
            case this.saturationInput:
               this.updateHsbText();
               this.saturationInput.addEventListener(FocusEvent.FOCUS_OUT,this.hsbInput_focusOutHandler);
               this.saturationInput.addEventListener(FlexEvent.ENTER,this.hsbInput_enterHandler);
               this.saturationInput.addEventListener(KeyboardEvent.KEY_DOWN,this.hsbInput_keyDownHandler);
               break;
            case this.brightnessInput:
               this.updateHsbText();
               this.brightnessInput.addEventListener(FocusEvent.FOCUS_OUT,this.hsbInput_focusOutHandler);
               this.brightnessInput.addEventListener(FlexEvent.ENTER,this.hsbInput_enterHandler);
               this.brightnessInput.addEventListener(KeyboardEvent.KEY_DOWN,this.hsbInput_keyDownHandler);
               break;
            case this.eyeDropperButton:
               this.eyeDropperButton.addEventListener(MouseEvent.CLICK,this.eyeDropperButton_clickHandler);
         }
      }
      
      override protected function partRemoved(param1:String, param2:Object) : void
      {
         super.partRemoved(param1,param2);
         switch(param2)
         {
            case this.colorSpaceTypeDropDownList:
               this.colorSpaceTypeDropDownList.dataProvider = null;
               this.colorSpaceTypeDropDownList.removeEventListener(IndexChangeEvent.CHANGE,this.colorSpaceTypeDropDownList_changeHandler);
               this.colorSpaceTypeDropDownList.removeEventListener(RendererExistenceEvent.RENDERER_ADD,this.colorSpaceTypeDropDownList_renderedAddHandler);
               this.colorSpaceTypeDropDownList.removeEventListener(RendererExistenceEvent.RENDERER_REMOVE,this.colorSpaceTypeDropDownList_renderedRemoveHandler);
               break;
            case this.hueSlider:
               this.hueSlider.removeEventListener(Event.CHANGE,this.hueSlider_changeHandler);
               this.hueSlider.removeEventListener(TrackBaseEvent.THUMB_RELEASE,this.hueSlider_thumbReleaseHandler);
               break;
            case this.colorFieldGroup:
               this.colorFieldGroup.removeEventListener(MouseEvent.MOUSE_DOWN,this.colorFieldGroup_mouseDownHandler);
               this.colorFieldGroup.removeEventListener(MouseEvent.MOUSE_MOVE,this.colorFieldGroup_mouseMoveHandler);
               this.colorFieldGroup.removeEventListener(MouseEvent.MOUSE_UP,this.colorFieldGroup_mouseUpHandler);
               break;
            case this.hexInput:
               this.hexInput.removeEventListener(FocusEvent.FOCUS_OUT,this.hexInput_focusOutHandler);
               this.hexInput.removeEventListener(FlexEvent.ENTER,this.hexInput_enterHandler);
               break;
            case this.redInput:
               this.redInput.removeEventListener(FocusEvent.FOCUS_OUT,this.rgbInput_focusOutHandler);
               this.redInput.removeEventListener(FlexEvent.ENTER,this.rgbInput_enterHandler);
               this.redInput.removeEventListener(KeyboardEvent.KEY_DOWN,this.rgbInput_keyDownHandler);
               break;
            case this.greenInput:
               this.greenInput.removeEventListener(FocusEvent.FOCUS_OUT,this.rgbInput_focusOutHandler);
               this.greenInput.removeEventListener(FlexEvent.ENTER,this.rgbInput_enterHandler);
               this.greenInput.removeEventListener(KeyboardEvent.KEY_DOWN,this.rgbInput_keyDownHandler);
               break;
            case this.blueInput:
               this.blueInput.removeEventListener(FocusEvent.FOCUS_OUT,this.rgbInput_focusOutHandler);
               this.blueInput.removeEventListener(FlexEvent.ENTER,this.rgbInput_enterHandler);
               this.blueInput.removeEventListener(KeyboardEvent.KEY_DOWN,this.rgbInput_keyDownHandler);
               break;
            case this.hueInput:
               this.hueInput.removeEventListener(FocusEvent.FOCUS_OUT,this.hsbInput_focusOutHandler);
               this.hueInput.removeEventListener(FlexEvent.ENTER,this.hsbInput_enterHandler);
               this.hueInput.removeEventListener(KeyboardEvent.KEY_DOWN,this.hsbInput_keyDownHandler);
               break;
            case this.saturationInput:
               this.saturationInput.removeEventListener(FocusEvent.FOCUS_OUT,this.hsbInput_focusOutHandler);
               this.saturationInput.removeEventListener(FlexEvent.ENTER,this.hsbInput_enterHandler);
               this.saturationInput.removeEventListener(KeyboardEvent.KEY_DOWN,this.hsbInput_keyDownHandler);
               break;
            case this.brightnessInput:
               this.brightnessInput.removeEventListener(FocusEvent.FOCUS_OUT,this.hsbInput_focusOutHandler);
               this.brightnessInput.removeEventListener(FlexEvent.ENTER,this.hsbInput_enterHandler);
               this.brightnessInput.removeEventListener(KeyboardEvent.KEY_DOWN,this.hsbInput_keyDownHandler);
               break;
            case this.eyeDropperButton:
               this.eyeDropperButton.removeEventListener(MouseEvent.CLICK,this.eyeDropperButton_clickHandler);
         }
      }
      
      protected function updateHexText() : void
      {
         if(this.hexInput)
         {
            this.hexInput.text = ColorUtils.colorToHex(this.currentColor);
         }
      }
      
      protected function updateRgbText() : void
      {
         var _loc1_:Array = ColorUtils.colorToRgb(this.currentColor);
         if(this.redInput)
         {
            this.redInput.text = _loc1_[0].toString();
         }
         if(this.greenInput)
         {
            this.greenInput.text = _loc1_[1].toString();
         }
         if(this.blueInput)
         {
            this.blueInput.text = _loc1_[2].toString();
         }
      }
      
      protected function updateHsbText() : void
      {
         if(this.hueInput)
         {
            this.hueInput.text = Math.round(this._hue).toString();
         }
         if(this.saturationInput)
         {
            this.saturationInput.text = Math.round(this._saturation * 100).toString();
         }
         if(this.brightnessInput)
         {
            this.brightnessInput.text = Math.round(this._brightness * 100).toString();
         }
      }
      
      protected function updateSlider() : void
      {
         if(this.hueSlider)
         {
            this.hueSlider.value = this._hue;
         }
      }
      
      protected function updateColorField() : void
      {
         if(this.colorFieldBaseColor)
         {
            this.colorFieldBaseColor.color = HSBColor.convertHSBtoRGB(this._hue,1,1);
         }
         if(this.colorFieldCursor)
         {
            this.colorFieldCursor.move(this._saturation * COLOR_FIELD_SIZE,(1 - this._brightness) * COLOR_FIELD_SIZE);
         }
      }
      
      protected function updateUIComponents() : void
      {
         switch(this._selectedColorSpace)
         {
            case COLOR_SPACE_HEX:
               this.updateHexText();
               this.updateSlider();
               this.updateColorField();
               break;
            case COLOR_SPACE_RGB:
               this.updateRgbText();
               this.updateSlider();
               this.updateColorField();
               break;
            case COLOR_SPACE_HSB:
               this.updateHsbText();
               this.updateSlider();
               this.updateColorField();
         }
      }
      
      protected function hueSlider_changeHandler(param1:Event) : void
      {
         this.hue = this.hueSlider.value;
         this.updateHexColorSpace();
      }
      
      protected function hueSlider_thumbReleaseHandler(param1:TrackBaseEvent) : void
      {
         this.notifyColorChange();
      }
      
      protected function set selectedColorSpace(param1:String) : void
      {
         if(this._selectedColorSpace != param1)
         {
            this._selectedColorSpace = param1;
            this.hexInputArea.visible = this._selectedColorSpace == COLOR_SPACE_HEX;
            this.hexInputArea.includeInLayout = this._selectedColorSpace == COLOR_SPACE_HEX;
            this.rgbInputArea.visible = this._selectedColorSpace == COLOR_SPACE_RGB;
            this.rgbInputArea.includeInLayout = this._selectedColorSpace == COLOR_SPACE_RGB;
            this.hsbInputArea.visible = this._selectedColorSpace == COLOR_SPACE_HSB;
            this.hsbInputArea.includeInLayout = this._selectedColorSpace == COLOR_SPACE_HSB;
            this.updateUIComponents();
         }
      }
      
      protected function colorSpaceTypeDropDownList_changeHandler(param1:IndexChangeEvent) : void
      {
         this.selectedColorSpace = this.colorSpaceTypeDropDownList.selectedItem;
      }
      
      protected function colorSpaceTypeDropDownList_renderedAddHandler(param1:RendererExistenceEvent) : void
      {
         param1.renderer.addEventListener(MouseEvent.MOUSE_DOWN,this.colorSpaceTypeDropDownListRenderer_mouseDownHandler);
         param1.renderer.addEventListener(MouseEvent.MOUSE_UP,this.colorSpaceTypeDropDownListRenderer_mouseUpHandler);
      }
      
      protected function colorSpaceTypeDropDownList_renderedRemoveHandler(param1:RendererExistenceEvent) : void
      {
         param1.renderer.removeEventListener(MouseEvent.MOUSE_DOWN,this.colorSpaceTypeDropDownListRenderer_mouseDownHandler);
         param1.renderer.removeEventListener(MouseEvent.MOUSE_UP,this.colorSpaceTypeDropDownListRenderer_mouseUpHandler);
      }
      
      protected function colorSpaceTypeDropDownListRenderer_mouseDownHandler(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
      }
      
      protected function colorSpaceTypeDropDownListRenderer_mouseUpHandler(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
         this.colorSpaceTypeDropDownList.selectedItem = param1.currentTarget.data;
         this.colorSpaceTypeDropDownList.dispatchEvent(new IndexChangeEvent(IndexChangeEvent.CHANGE));
         this.colorSpaceTypeDropDownList.closeDropDown(true);
      }
      
      protected function colorFieldGroup_mouseDownHandler(param1:MouseEvent) : void
      {
         this._draggingColorField = true;
         this.handleMousePosition(this.colorFieldGroup.mouseX,this.colorFieldGroup.mouseY);
      }
      
      protected function colorFieldGroup_mouseMoveHandler(param1:MouseEvent) : void
      {
         if(this._draggingColorField)
         {
            this.handleMousePosition(this.colorFieldGroup.mouseX,this.colorFieldGroup.mouseY);
         }
      }
      
      protected function colorFieldGroup_mouseUpHandler(param1:MouseEvent) : void
      {
         if(this._draggingColorField)
         {
            this.notifyColorChange();
            this._draggingColorField = false;
         }
      }
      
      protected function handleMousePosition(param1:int, param2:int) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         else if(param1 > COLOR_FIELD_SIZE)
         {
            param1 = COLOR_FIELD_SIZE;
         }
         if(param2 < 0)
         {
            param2 = 0;
         }
         else if(param2 > COLOR_FIELD_SIZE)
         {
            param2 = COLOR_FIELD_SIZE;
         }
         this.saturation = param1 / COLOR_FIELD_SIZE;
         this.brightness = 1 - param2 / COLOR_FIELD_SIZE;
         this.updateHexColorSpace();
      }
      
      protected function hexInput_focusOutHandler(param1:FocusEvent) : void
      {
         this.updateColorByHexInput();
      }
      
      protected function hexInput_enterHandler(param1:FlexEvent) : void
      {
         this.updateColorByHexInput();
      }
      
      protected function updateColorByHexInput() : void
      {
         this.currentColor = uint("0x" + this.hexInput.text);
         this.notifyColorChange();
      }
      
      protected function rgbInput_enterHandler(param1:FlexEvent) : void
      {
         this.updateColorByRgbInput();
      }
      
      protected function rgbInput_focusOutHandler(param1:FocusEvent) : void
      {
         this.updateColorByRgbInput();
      }
      
      protected function rgbInput_keyDownHandler(param1:KeyboardEvent) : void
      {
         if(param1.charCode == Keyboard.TAB)
         {
            callLater(this.tabToNextRgbInput,[param1.currentTarget]);
         }
      }
      
      protected function hsbInput_keyDownHandler(param1:KeyboardEvent) : void
      {
         if(param1.charCode == Keyboard.TAB)
         {
            callLater(this.tabToNextHsbInput,[param1.currentTarget]);
         }
      }
      
      private function tabToNextRgbInput(param1:Object) : void
      {
         switch(param1)
         {
            case this.redInput:
               this.greenInput.setFocus();
               break;
            case this.greenInput:
               this.blueInput.setFocus();
               break;
            case this.blueInput:
               this.redInput.setFocus();
         }
      }
      
      private function tabToNextHsbInput(param1:Object) : void
      {
         switch(param1)
         {
            case this.hueInput:
               this.saturationInput.setFocus();
               break;
            case this.saturationInput:
               this.brightnessInput.setFocus();
               break;
            case this.brightnessInput:
               this.hueInput.setFocus();
         }
      }
      
      protected function updateColorByRgbInput() : void
      {
         this.currentColor = ColorUtils.rgbToColor(this.getRgbInputValue(this.redInput.text),this.getRgbInputValue(this.greenInput.text),this.getRgbInputValue(this.blueInput.text));
         this.notifyColorChange();
      }
      
      private function getRgbInputValue(param1:String) : int
      {
         var _loc2_:Number = parseInt(param1);
         if(isNaN(_loc2_) || _loc2_ < 0)
         {
            _loc2_ = 0;
         }
         else if(_loc2_ > 255)
         {
            _loc2_ = 255;
         }
         return int(_loc2_);
      }
      
      protected function hsbInput_focusOutHandler(param1:FocusEvent) : void
      {
         this.updateColorByHsbInput();
      }
      
      protected function hsbInput_enterHandler(param1:FlexEvent) : void
      {
         this.updateColorByHsbInput();
      }
      
      private function get hue() : Number
      {
         return this._hue;
      }
      
      private function set hue(param1:Number) : void
      {
         if(this._hue == param1 || isNaN(param1))
         {
            return;
         }
         if(param1 < HUE_MIN_VALUE)
         {
            param1 = HUE_MIN_VALUE;
         }
         else if(param1 > HUE_MAX_VALUE)
         {
            param1 = HUE_MAX_VALUE;
         }
         this._hue = param1;
      }
      
      private function get saturation() : Number
      {
         return this._saturation;
      }
      
      private function set saturation(param1:Number) : void
      {
         if(this._saturation == param1 || isNaN(param1))
         {
            return;
         }
         if(param1 < SATURATION_MIN_VALUE)
         {
            param1 = SATURATION_MIN_VALUE;
         }
         else if(param1 > SATURATION_MAX_VALUE)
         {
            param1 = SATURATION_MAX_VALUE;
         }
         this._saturation = param1;
      }
      
      private function get brightness() : Number
      {
         return this._brightness;
      }
      
      private function set brightness(param1:Number) : void
      {
         if(this._brightness == param1 || isNaN(param1))
         {
            return;
         }
         if(param1 < BRIGHTNESS_MIN_VALUE)
         {
            param1 = BRIGHTNESS_MIN_VALUE;
         }
         else if(param1 > BRIGHTNESS_MAX_VALUE)
         {
            param1 = BRIGHTNESS_MAX_VALUE;
         }
         this._brightness = param1;
      }
      
      protected function updateColorByHsbInput() : void
      {
         this.hue = parseInt(this.hueInput.text);
         this.saturation = parseInt(this.saturationInput.text) / 100;
         this.brightness = parseInt(this.brightnessInput.text) / 100;
         this.updateHexColorSpace();
         this.notifyColorChange();
      }
      
      protected function eyeDropperButton_clickHandler(param1:MouseEvent) : void
      {
         var _loc2_:EyeDropperScreenOverlay = EyeDropperScreenOverlay.instance;
         if(!_loc2_)
         {
            return;
         }
         _loc2_.addEventListener(EyeDropperEvent.EYE_DROPPER_COMPLETE,this.eyeDropperScreenCap_eyeDropperCompletedHandler);
         _loc2_.addEventListener(EyeDropperEvent.EYE_DROPPER_CANCEL,this.eyeDropperScreenCap_eyeDropperCancelHandler);
         _loc2_.createScreenshotOverlay();
         dispatchEvent(new EyeDropperEvent(EyeDropperEvent.EYE_DROPPER_ACTIVATE));
         this.visible = false;
      }
      
      protected function eyeDropperScreenCap_eyeDropperCompletedHandler(param1:EyeDropperEvent) : void
      {
         var _loc2_:EyeDropperScreenOverlay = EyeDropperScreenOverlay.instance;
         if(!_loc2_)
         {
            return;
         }
         _loc2_.removeEventListener(EyeDropperEvent.EYE_DROPPER_COMPLETE,this.eyeDropperScreenCap_eyeDropperCompletedHandler);
         _loc2_.removeEventListener(EyeDropperEvent.EYE_DROPPER_CANCEL,this.eyeDropperScreenCap_eyeDropperCancelHandler);
         this.currentColor = param1.color;
         this.notifyColorChange();
         dispatchEvent(param1.clone());
      }
      
      protected function eyeDropperScreenCap_eyeDropperCancelHandler(param1:EyeDropperEvent) : void
      {
         var _loc2_:EyeDropperScreenOverlay = EyeDropperScreenOverlay.instance;
         if(!_loc2_)
         {
            return;
         }
         _loc2_.removeEventListener(EyeDropperEvent.EYE_DROPPER_COMPLETE,this.eyeDropperScreenCap_eyeDropperCompletedHandler);
         _loc2_.removeEventListener(EyeDropperEvent.EYE_DROPPER_CANCEL,this.eyeDropperScreenCap_eyeDropperCancelHandler);
      }
      
      protected function notifyColorChange() : void
      {
         var _loc1_:ColorPaletteEvent = new ColorPaletteEvent(ColorPaletteEvent.COLOR_CHANGE);
         _loc1_.colorCode = this.currentColor;
         dispatchEvent(_loc1_);
      }
      
      protected function notifyColorPreview() : void
      {
         var _loc1_:ColorPaletteEvent = new ColorPaletteEvent(ColorPaletteEvent.COLOR_PREVIEW);
         _loc1_.colorCode = this.currentColor;
         dispatchEvent(_loc1_);
      }
   }
}
