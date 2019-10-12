package anifire.component.widgets
{
   import anifire.models.widget.WidgetPartModel;
   import flash.geom.Rectangle;
   
   public class CounterWidget extends WidgetMaker
   {
       
      
      protected var _backgroundPart:WidgetPart;
      
      protected var _foregroundPart:WidgetPart;
      
      protected var _counterDelay:Number;
      
      protected var _counterStartValue:Number;
      
      protected var _counterMaxValue:Number;
      
      protected var _counterValue:Number;
      
      public function CounterWidget()
      {
         super();
         this.createCounterParts();
      }
      
      override protected function init() : void
      {
         super.init();
         _innerPaddingLeft = 0;
         _innerPaddingRight = 0;
         _innerPaddingTop = 0;
         _innerPaddingBottom = 0;
         _labelPaddingBottom = 0;
         this._counterDelay = 0;
         this._counterValue = 0;
         this._counterMaxValue = 100;
         _bounds = new Rectangle(0,0,200,200);
      }
      
      override public function set numberFormatType(param1:int) : void
      {
         super.numberFormatType = param1;
         this.updateCounterText();
      }
      
      override public function set displayValueLabel(param1:Boolean) : void
      {
         if(_displayValueLabel != param1)
         {
            _displayValueLabel = param1;
            this.updateCounterText();
         }
      }
      
      override public function set displayPercentageLabel(param1:Boolean) : void
      {
         if(_displayPercentageLabel != param1)
         {
            _displayPercentageLabel = param1;
            this.updateCounterText();
         }
      }
      
      override public function set title(param1:String) : void
      {
      }
      
      override protected function createBasePart() : WidgetBasePart
      {
         return new CounterBasePart();
      }
      
      protected function createCounterParts() : void
      {
         this._backgroundPart = createPart(null);
         addPart(this._backgroundPart);
         this._foregroundPart = createPart(null);
         addPart(this._foregroundPart);
      }
      
      public function get counterStartValue() : Number
      {
         return this._counterStartValue;
      }
      
      public function set counterStartValue(param1:Number) : void
      {
         if(this._counterStartValue != param1)
         {
            this._counterStartValue = param1;
            if(this._counterStartValue < this._counterValue)
            {
               this._counterValue = param1;
            }
         }
      }
      
      public function get counterMaxValue() : Number
      {
         return this._counterMaxValue;
      }
      
      public function set counterMaxValue(param1:Number) : void
      {
         if(this._counterMaxValue != param1)
         {
            this._counterMaxValue = param1;
            if(this._counterMaxValue < this._counterValue)
            {
               this._counterValue = param1;
            }
         }
      }
      
      public function get counterValue() : Number
      {
         return this._counterValue;
      }
      
      public function set counterValue(param1:Number) : void
      {
         if(this._counterValue != param1)
         {
            this._counterValue = param1;
            if(this._counterValue > this._counterMaxValue)
            {
               this._counterMaxValue = param1;
            }
         }
      }
      
      protected function getAnimationValue() : Number
      {
         if(_animationFactor < this._counterDelay)
         {
            return 0;
         }
         return this._counterStartValue + (this._counterValue - this._counterStartValue) * (_animationFactor - this._counterDelay) / (1 - this._counterDelay);
      }
      
      protected function updateCounterValue() : void
      {
      }
      
      override public function updateModel(param1:Vector.<WidgetPartModel>) : void
      {
         if(param1.length >= 3)
         {
            this.counterStartValue = param1[0].value;
            this.counterValue = param1[1].value;
            this.counterMaxValue = param1[2].value;
            _precision = Math.max(calculatePrecision(param1[0].rawValue),calculatePrecision(param1[1].rawValue),calculatePrecision(param1[2].rawValue));
         }
         updateFormatter();
         this.updateCounterValue();
      }
      
      override protected function validateDataParts() : void
      {
         if(this._backgroundPart)
         {
            this._backgroundPart.validate();
         }
         if(this._foregroundPart)
         {
            this._foregroundPart.validate();
         }
      }
      
      override protected function updateAnimation() : void
      {
         this.updateCounterValue();
      }
      
      protected function updateCounterText() : void
      {
         var _loc1_:Number = this.getAnimationValue();
         var _loc2_:String = formatValue(_loc1_);
         var _loc3_:* = formatValue(_loc1_ / this._counterMaxValue * 100) + "%";
         if(displayPercentageLabel && displayValueLabel)
         {
            this._foregroundPart.text = _loc2_ + " (" + _loc3_ + ")";
         }
         else if(displayPercentageLabel)
         {
            this._foregroundPart.text = _loc3_;
         }
         else
         {
            this._foregroundPart.text = _loc2_;
         }
      }
      
      override public function get combinedMaxValue() : Number
      {
         return this._counterMaxValue;
      }
      
      override public function get combinedNegativeMaxValue() : Number
      {
         return 0;
      }
   }
}
