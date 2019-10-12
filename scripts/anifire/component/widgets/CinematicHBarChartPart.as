package anifire.component.widgets
{
   import flash.display.Graphics;
   import flash.geom.Rectangle;
   
   public class CinematicHBarChartPart extends CinematicChartPart
   {
      
      public static const MIN_WIDTH:int = 1;
      
      public static const PART_OVERSHOOT_RATIO:Number = 1.5;
      
      public static const PART_OVERSHOOT_THRESHOLD:Number = 0.1;
       
      
      protected var _barRatio:Number;
      
      protected var _currentBarWidth:Number;
      
      protected var _currentBarHeight:Number;
      
      protected var _valueAxisOffset:Number;
      
      protected var _barRect:Rectangle;
      
      public function CinematicHBarChartPart()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         _label = new WidgetLabel();
         _label.enableAutoSize(45);
         addChild(_label);
         _valueLabel = new WidgetLabel();
         addChild(_valueLabel);
         this._barRect = new Rectangle();
      }
      
      override public function draw() : void
      {
         var _loc11_:uint = 0;
         var _loc1_:Graphics = graphics;
         _loc1_.clear();
         var _loc2_:Number = _widgetMaker.maxValue - _widgetMaker.negativeMaxValue;
         if(!_bounds || _loc2_ <= 0 || !(_rangeIndex > 0 || _animationFactor > 0))
         {
            return;
         }
         var _loc3_:Number = _style.getNumericProperty("lineWeight");
         var _loc4_:Number = _style.getNumericProperty("offset");
         var _loc5_:Number = _style.getNumericProperty("border");
         this._valueAxisOffset = _bounds.width * (-_widgetMaker.negativeMaxValue / _loc2_);
         this._currentBarHeight = _bounds.height;
         var _loc6_:Number = _rangeIndex > 0?Number(_values[_rangeIndex - 1]):Number(0);
         var _loc7_:Number = _values[_rangeIndex];
         var _loc8_:Number = _loc6_ + (_loc7_ - _loc6_) * _widgetMaker.easeOutBack(_animationFactor,PART_OVERSHOOT_RATIO);
         if(_loc6_ * _loc8_ < 0)
         {
            _loc8_ = _loc7_ >= 0?Number(PART_OVERSHOOT_THRESHOLD):Number(-PART_OVERSHOOT_THRESHOLD);
         }
         this._barRatio = _loc8_ / _loc2_;
         this._currentBarWidth = _bounds.width * this._barRatio;
         var _loc9_:Number = MIN_WIDTH;
         if(_loc5_ > 0)
         {
            _loc9_ = _loc9_ + (_loc4_ + _loc5_) * 2;
         }
         this._barRect.y = _bounds.y + (_bounds.height - this._currentBarHeight) * 0.5;
         this._barRect.height = this._currentBarHeight;
         if(this._currentBarWidth >= 0)
         {
            if(this._currentBarWidth < _loc9_)
            {
               this._currentBarWidth = _loc9_;
            }
            this._barRect.x = _bounds.x + this._valueAxisOffset;
            this._barRect.width = this._currentBarWidth;
         }
         else
         {
            if(this._currentBarWidth > -_loc9_)
            {
               this._currentBarWidth = -_loc9_;
            }
            this._barRect.x = _bounds.x + this._valueAxisOffset + this._currentBarWidth;
            this._barRect.width = -this._currentBarWidth;
         }
         var _loc10_:* = drawColor != uint.MAX_VALUE;
         if(_loc10_)
         {
            if(_loc5_ > 0)
            {
               _loc1_.lineStyle();
               _loc1_.beginFill(_style.lineColor);
               _loc1_.drawRect(this._barRect.x,this._barRect.y,this._barRect.width,this._barRect.height);
               this._barRect.inflate(-_loc5_,-_loc5_);
               _loc1_.drawRect(this._barRect.x,this._barRect.y,this._barRect.width,this._barRect.height);
               _loc1_.endFill();
               this._barRect.inflate(-_loc4_,-_loc4_);
            }
            else
            {
               this._barRect.x = this._barRect.x + (this._currentBarWidth > 0?_loc4_:-_loc4_ - _loc3_ * 0.5);
            }
            if(_loc10_)
            {
               _loc11_ = _style.getColorByIndex(_rangeIndex);
               _loc1_.beginFill(_loc11_);
               _loc1_.drawRect(this._barRect.x,this._barRect.y,this._barRect.width,this._barRect.height);
            }
         }
      }
      
      override protected function updateLabelLayout() : void
      {
         var _loc1_:Number = _bounds.x + this._valueAxisOffset;
         if(_widgetMaker.displayDataLabel && (_animationFactor > 0 || _rangeIndex > 0) && !_loading)
         {
            _label.visible = true;
            if(this._currentBarWidth > 0)
            {
               _label.x = _loc1_ - _label.width - 5;
            }
            else
            {
               _label.x = _loc1_ + 5;
            }
            _label.y = _bounds.y + (_bounds.height - _label.height) * 0.5;
            _label.alpha = _rangeIndex > 0?Number(1):Number(_animationFactor);
         }
         else
         {
            _label.visible = false;
         }
         if(_widgetMaker.displayValueLabel && _animationFactor > 0 && !_loading)
         {
            _valueLabel.visible = true;
            _valueLabel.text = getAnimatedLabelTextByRange(_rangeIndex,1);
            _valueLabel.enableAutoSize(_bounds.width,_bounds.height);
            switch(_widgetMaker.getProperty("valuePosition"))
            {
               case "left":
                  if(this._currentBarWidth >= 0)
                  {
                     _valueLabel.x = _loc1_ + 4;
                  }
                  else
                  {
                     _valueLabel.x = _loc1_ - _valueLabel.width - 4;
                  }
                  break;
               case "right":
                  if(this._currentBarWidth >= 0)
                  {
                     _valueLabel.x = _loc1_ + Math.max(this._currentBarWidth - _valueLabel.width - 4,4);
                  }
                  else
                  {
                     _valueLabel.x = _loc1_ + Math.min(this._currentBarWidth + 4,-_valueLabel.width - 4);
                  }
                  break;
               case "outside":
               default:
                  if(this._currentBarWidth >= 0)
                  {
                     _valueLabel.x = _loc1_ + this._currentBarWidth + 4;
                  }
                  else
                  {
                     _valueLabel.x = _loc1_ + this._currentBarWidth - _valueLabel.width - 4;
                  }
            }
            _valueLabel.y = _bounds.y + (_bounds.height - _valueLabel.height) * 0.5;
         }
         else
         {
            _valueLabel.visible = false;
         }
      }
   }
}
