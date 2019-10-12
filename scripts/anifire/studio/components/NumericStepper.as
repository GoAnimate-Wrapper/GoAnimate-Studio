package anifire.studio.components
{
   import anifire.studio.skins.FlatNumericStepperSkin;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import flash.globalization.NumberFormatter;
   import mx.events.FlexEvent;
   
   public class NumericStepper extends spark.components.NumericStepper
   {
      
      public static const INCREMENT_BUTTON_PRESS:String = "incrementButtonPress";
      
      public static const INCREMENT_BUTTON_RELEASE:String = "incrementButtonRelease";
      
      public static const DECREMENT_BUTTON_PRESS:String = "decrementButtonPress";
      
      public static const DECREMENT_BUTTON_RELEASE:String = "decrementButtonRelease";
       
      
      protected var _useTimeFormat:Boolean;
      
      protected var _usePercentageFormat:Boolean;
      
      protected var _usePixelFormat:Boolean;
      
      protected var valueFormatter:NumberFormatter;
      
      protected var _precision:uint = 2;
      
      private var _useUndefinedFormat:Boolean;
      
      public function NumericStepper()
      {
         super();
         valueParseFunction = this.defaultValueParseFunction;
         this.useTimeFormat = true;
         setStyle("skinClass",FlatNumericStepperSkin);
      }
      
      public function get usePixelFormat() : Boolean
      {
         return this._usePixelFormat;
      }
      
      public function set usePixelFormat(param1:Boolean) : void
      {
         if(this._usePixelFormat != param1)
         {
            this._usePixelFormat = param1;
            if(param1)
            {
               this._precision = 0;
               this._useTimeFormat = false;
               this._useUndefinedFormat = false;
               this._usePercentageFormat = false;
            }
            valueFormatFunction = this.pixelValueFormatFunction;
         }
      }
      
      public function get usePercentageFormat() : Boolean
      {
         return this._usePercentageFormat;
      }
      
      public function set usePercentageFormat(param1:Boolean) : void
      {
         if(this._usePercentageFormat != param1)
         {
            this._usePercentageFormat = param1;
            if(param1)
            {
               this._useTimeFormat = false;
               this._useUndefinedFormat = false;
               this._usePixelFormat = false;
            }
            valueFormatFunction = this.percentageValueFormatFunction;
         }
      }
      
      protected function defaultValueParseFunction(param1:String) : Number
      {
         if(!this.valueFormatter)
         {
            this.valueFormatter = new NumberFormatter("en-US");
         }
         if(this._useTimeFormat && param1 && param1.charAt(param1.length - 1) == "s")
         {
            param1 = param1.substr(0,param1.length - 1);
         }
         if(this._usePercentageFormat && param1 && param1.charAt(param1.length - 1) == "%")
         {
            param1 = param1.substr(0,param1.length - 1);
         }
         if(this._usePixelFormat && param1 && param1.substring(param1.length - 2) == "px")
         {
            param1 = param1.substr(0,param1.length - 2);
         }
         param1 = param1.replace(",",".");
         var _loc2_:Number = Number(param1);
         if(isNaN(_loc2_))
         {
            _loc2_ = 0;
         }
         return _loc2_;
      }
      
      protected function pixelValueFormatFunction(param1:Number) : String
      {
         return param1 + "px";
      }
      
      protected function percentageValueFormatFunction(param1:Number) : String
      {
         if(this._precision == 0)
         {
            return param1 + "%";
         }
         return param1.toFixed(this._precision) + "%";
      }
      
      protected function timeValueFormatFunction(param1:Number) : String
      {
         return param1.toFixed(this._precision) + "s";
      }
      
      protected function undefineValueFormatFunction(param1:Number) : String
      {
         return "----";
      }
      
      public function get useTimeFormat() : Boolean
      {
         return this._useTimeFormat;
      }
      
      public function set useTimeFormat(param1:Boolean) : void
      {
         if(this._useTimeFormat != param1)
         {
            this._useTimeFormat = param1;
            if(this._useUndefinedFormat)
            {
               valueFormatFunction = this.undefineValueFormatFunction;
            }
            else
            {
               valueFormatFunction = !!this._useTimeFormat?this.timeValueFormatFunction:null;
            }
         }
      }
      
      public function get precision() : uint
      {
         return this._precision;
      }
      
      public function set precision(param1:uint) : void
      {
         if(this._precision != param1)
         {
            this._precision = param1;
         }
      }
      
      public function set useUndefinedFormat(param1:Boolean) : void
      {
         if(this._useUndefinedFormat != param1)
         {
            this._useUndefinedFormat = param1;
            if(this._useUndefinedFormat)
            {
               valueFormatFunction = this.undefineValueFormatFunction;
            }
            else
            {
               valueFormatFunction = !!this._useTimeFormat?this.timeValueFormatFunction:null;
            }
         }
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == textDisplay)
         {
            textDisplay.restrict = "0-9\\-\\.";
            textDisplay.addEventListener(FlexEvent.ENTER,this.textDisplay_enterHandler);
            textDisplay.addEventListener(FocusEvent.FOCUS_IN,this.textDisplay_focusInHandler);
            textDisplay.addEventListener(FocusEvent.FOCUS_OUT,this.textDisplay_focusOutHandler);
         }
         else if(param2 == incrementButton)
         {
            incrementButton.addEventListener(MouseEvent.MOUSE_DOWN,this.incrementButton_mouseDownHandler);
            incrementButton.addEventListener(MouseEvent.MOUSE_UP,this.incrementButton_mouseUpHandler);
         }
         else if(param2 == decrementButton)
         {
            decrementButton.addEventListener(MouseEvent.MOUSE_DOWN,this.decrementButton_mouseDownHandler);
            decrementButton.addEventListener(MouseEvent.MOUSE_UP,this.decrementButton_mouseUpHandler);
         }
      }
      
      override protected function partRemoved(param1:String, param2:Object) : void
      {
         super.partRemoved(param1,param2);
         if(param2 == textDisplay)
         {
            textDisplay.removeEventListener(FlexEvent.ENTER,this.textDisplay_enterHandler);
            textDisplay.removeEventListener(FocusEvent.FOCUS_IN,this.textDisplay_focusInHandler);
            textDisplay.removeEventListener(FocusEvent.FOCUS_OUT,this.textDisplay_focusOutHandler);
         }
         else if(param2 == incrementButton)
         {
            incrementButton.removeEventListener(MouseEvent.MOUSE_DOWN,this.incrementButton_mouseDownHandler);
            incrementButton.removeEventListener(MouseEvent.MOUSE_UP,this.incrementButton_mouseUpHandler);
         }
         else if(param2 == decrementButton)
         {
            decrementButton.removeEventListener(MouseEvent.MOUSE_DOWN,this.decrementButton_mouseDownHandler);
            decrementButton.removeEventListener(MouseEvent.MOUSE_UP,this.decrementButton_mouseUpHandler);
         }
      }
      
      private function incrementButton_mouseDownHandler(param1:MouseEvent) : void
      {
         this.useUndefinedFormat = false;
         this.dispatchEvent(new Event(INCREMENT_BUTTON_PRESS));
      }
      
      private function decrementButton_mouseDownHandler(param1:MouseEvent) : void
      {
         this.useUndefinedFormat = false;
         this.dispatchEvent(new Event(DECREMENT_BUTTON_PRESS));
      }
      
      private function incrementButton_mouseUpHandler(param1:MouseEvent) : void
      {
         this.dispatchEvent(new Event(INCREMENT_BUTTON_RELEASE));
      }
      
      private function decrementButton_mouseUpHandler(param1:MouseEvent) : void
      {
         this.dispatchEvent(new Event(DECREMENT_BUTTON_RELEASE));
      }
      
      private function textDisplay_enterHandler(param1:FlexEvent) : void
      {
         this.dispatchEvent(new FlexEvent(FlexEvent.ENTER));
      }
      
      private function textDisplay_focusInHandler(param1:FocusEvent) : void
      {
         this.dispatchEvent(new FocusEvent(FocusEvent.FOCUS_IN));
      }
      
      private function textDisplay_focusOutHandler(param1:FocusEvent) : void
      {
         this.dispatchEvent(new FocusEvent(FocusEvent.FOCUS_OUT));
      }
   }
}
