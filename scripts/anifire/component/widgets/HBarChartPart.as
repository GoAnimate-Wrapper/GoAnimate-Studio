package anifire.component.widgets
{
   import flash.display.Graphics;
   import flash.geom.Rectangle;
   
   public class HBarChartPart extends WidgetPart
   {
      
      public static const MIN_WIDTH:int = 1;
       
      
      protected var _barRatio:Number;
      
      protected var _currentBarWidth:Number;
      
      protected var _currentBarHeight:Number;
      
      protected var _valueAxisOffset:Number;
      
      protected var _barRect:Rectangle;
      
      protected var _counterMode:Boolean;
      
      protected var _labelRect:Vector.<Rectangle>;
      
      protected var _hasBothSign:Boolean;
      
      protected const LABEL_WIDTH_LIMIT:Number = 45;
      
      public function HBarChartPart()
      {
         super();
      }
      
      public function get counterMode() : Boolean
      {
         return this._counterMode;
      }
      
      public function set counterMode(param1:Boolean) : void
      {
         this._counterMode = true;
         _invalidateFlag = true;
      }
      
      override protected function init() : void
      {
         super.init();
         _label = new WidgetLabel();
         _label.enableAutoSize(this.LABEL_WIDTH_LIMIT);
         addChild(_label);
         _valueLabel = new WidgetLabel();
         addChild(_valueLabel);
         this._barRect = new Rectangle();
         _valueLabels = new Vector.<WidgetLabel>();
         this._labelRect = new Vector.<Rectangle>();
         this._labelRect.push(new Rectangle());
      }
      
      override public function set values(param1:Vector.<Number>) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         var _loc5_:WidgetLabel = null;
         super.values = param1;
         _numRanges = param1.length;
         this._labelRect.length = _numRanges;
         var _loc4_:int = _valueLabels.length;
         _loc3_ = 0;
         while(_loc3_ < _numRanges)
         {
            if(_loc3_ >= _loc4_)
            {
               this._labelRect[_loc3_] = new Rectangle();
               _loc5_ = new WidgetLabel();
               addChild(_loc5_);
               _valueLabels.push(_loc5_);
               _loc2_ = true;
            }
            _loc3_++;
         }
         _loc3_ = _loc4_ - 1;
         while(_loc3_ >= _numRanges)
         {
            removeChild(_valueLabels.pop());
            _loc3_--;
         }
         if(_loc2_)
         {
            updateLabelFormat();
         }
      }
      
      override public function draw() : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         var _loc11_:Number = NaN;
         var _loc12_:Boolean = false;
         var _loc13_:Boolean = false;
         var _loc14_:Boolean = false;
         var _loc15_:uint = 0;
         var _loc1_:Graphics = graphics;
         _loc1_.clear();
         var _loc4_:Number = _widgetMaker.combinedMaxValue - _widgetMaker.combinedNegativeMaxValue;
         if(!_bounds || _loc4_ <= 0)
         {
            return;
         }
         var _loc5_:Number = _style.getNumericProperty("lineWeight");
         var _loc6_:Number = _style.getNumericProperty("offset");
         var _loc7_:Number = _style.getNumericProperty("border");
         this._valueAxisOffset = _bounds.width * (-_widgetMaker.combinedNegativeMaxValue / _loc4_);
         var _loc8_:Number = bounds.x;
         var _loc9_:Number = _loc8_;
         this._currentBarHeight = _bounds.height * _widgetMaker.easeOutBack(_animationFactor,1.75);
         var _loc10_:int = 0;
         while(_loc10_ < _numRanges)
         {
            if(_values[_loc10_] > 0 && !_loc2_)
            {
               _loc2_ = true;
            }
            else if(_values[_loc10_] < 0 && !_loc3_)
            {
               _loc3_ = true;
            }
            this._barRatio = _values[_loc10_] / _loc4_;
            this._currentBarWidth = _bounds.width * this._barRatio * _widgetMaker.easeOutBack(_animationFactor,1.6);
            _loc11_ = MIN_WIDTH;
            if(_loc7_ > 0)
            {
               _loc11_ = _loc11_ + (_loc6_ + _loc7_) * 2;
            }
            this._barRect.y = _bounds.y + (_bounds.height - this._currentBarHeight) * 0.5;
            this._barRect.height = this._currentBarHeight;
            if(this._currentBarWidth >= 0)
            {
               if(this._currentBarWidth < _loc11_)
               {
                  this._currentBarWidth = _loc11_;
               }
               this._barRect.x = _loc8_ + this._valueAxisOffset;
               this._barRect.width = this._currentBarWidth;
               _loc8_ = _loc8_ + this._currentBarWidth;
            }
            else
            {
               if(this._currentBarWidth > -_loc11_)
               {
                  this._currentBarWidth = -_loc11_;
               }
               this._barRect.x = _loc9_ + this._valueAxisOffset + this._currentBarWidth;
               this._barRect.width = -this._currentBarWidth;
               _loc9_ = _loc9_ + this._currentBarWidth;
            }
            _loc12_ = this._counterMode && _itemIndex == 0;
            _loc13_ = this._counterMode && _itemIndex > 0;
            _loc14_ = drawColor != uint.MAX_VALUE && _animationFactor > 0;
            if(_loc14_ || _loc12_)
            {
               if(_loc7_ > 0)
               {
                  if(!_loc13_)
                  {
                     _loc1_.lineStyle();
                     _loc1_.beginFill(_style.lineColor);
                     _loc1_.drawRect(this._barRect.x,this._barRect.y,this._barRect.width,this._barRect.height);
                  }
                  this._barRect.inflate(-_loc7_,-_loc7_);
                  if(!_loc13_)
                  {
                     _loc1_.drawRect(this._barRect.x,this._barRect.y,this._barRect.width,this._barRect.height);
                     _loc1_.endFill();
                  }
                  this._barRect.inflate(-_loc6_,-_loc6_);
               }
               else
               {
                  this._barRect.x = this._barRect.x + (this._currentBarWidth > 0?_loc6_:-_loc6_ - _loc5_ * 0.5);
               }
               if(_loc14_)
               {
                  _loc15_ = _numRanges == 1?uint(drawColor):uint(_style.getColorByIndex(_loc10_));
                  _loc1_.beginFill(_loc15_);
                  _loc1_.drawRect(this._barRect.x,this._barRect.y,this._barRect.width,this._barRect.height);
                  if(this._currentBarWidth > 0)
                  {
                     this._labelRect[_loc10_].x = this._barRect.x + this._barRect.width;
                  }
                  else
                  {
                     this._labelRect[_loc10_].x = this._barRect.x;
                     if(_loc7_ > 0)
                     {
                        this._labelRect[_loc10_].x = this._labelRect[_loc10_].x - WidgetConstants.LABEL_PADDING * 4;
                     }
                  }
                  this._labelRect[_loc10_].y = this._barRect.y + this._barRect.height / 2;
                  this._labelRect[_loc10_].width = this._barRect.width;
                  this._labelRect[_loc10_].height = this._barRect.height;
               }
            }
            _loc10_++;
         }
         if(_loc2_ && _loc3_)
         {
            this._hasBothSign = true;
         }
         else
         {
            this._hasBothSign = false;
         }
      }
      
      override protected function updateLabelLayout() : void
      {
         var _loc2_:int = 0;
         var _loc3_:WidgetLabel = null;
         var _loc1_:Number = _bounds.x + this._valueAxisOffset;
         if(_widgetMaker.displayDataLabel && _animationFactor > 0 && !_loading && !this._hasBothSign)
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
            _label.alpha = _animationFactor;
         }
         else
         {
            _label.visible = false;
         }
         if(_widgetMaker.displayValueLabel && _animationFactor > 0 && !_loading)
         {
            _loc2_ = 0;
            while(_loc2_ < _numRanges)
            {
               _loc3_ = _valueLabels[_loc2_];
               _loc3_.visible = true;
               _loc3_.alpha = _animationFactor;
               _loc3_.text = getAnimatedLabelTextByRange(_loc2_,1);
               _loc3_.enableAutoSize(_bounds.width,_bounds.height);
               switch(_widgetMaker.getProperty("valuePosition"))
               {
                  case "left":
                     if(_values[_loc2_] >= 0)
                     {
                        _loc3_.x = this._labelRect[_loc2_].x - this._labelRect[_loc2_].width + WidgetConstants.LABEL_PADDING;
                     }
                     else
                     {
                        _loc3_.x = this._labelRect[_loc2_].x + this._labelRect[_loc2_].width - _loc3_.width - WidgetConstants.LABEL_PADDING;
                     }
                     _loc3_.y = this._labelRect[_loc2_].y - _loc3_.height / 2;
                     if(_loc3_.width + WidgetConstants.LABEL_PADDING > this._labelRect[_loc2_].width || _loc3_.height > this._labelRect[_loc2_].height)
                     {
                        _loc3_.visible = false;
                     }
                     else
                     {
                        _loc3_.visible = true;
                     }
                     break;
                  case "right":
                     if(this._currentBarWidth >= 0)
                     {
                        _loc3_.x = _loc1_ + Math.max(this._currentBarWidth - _loc3_.width - 4,4);
                     }
                     else
                     {
                        _loc3_.x = _loc1_ + Math.min(this._currentBarWidth + 4,-_loc3_.width - 4);
                     }
                     break;
                  case "outside":
                  default:
                     if(_numRanges > 1)
                     {
                        if(_values[_loc2_] >= 0)
                        {
                           _loc3_.x = this._labelRect[_loc2_].x - _loc3_.width - WidgetConstants.LABEL_PADDING;
                        }
                        else
                        {
                           _loc3_.x = this._labelRect[_loc2_].x + _loc3_.width;
                        }
                     }
                     else if(values[_loc2_] >= 0)
                     {
                        _loc3_.x = this._labelRect[_loc2_].x + WidgetConstants.LABEL_PADDING * 2;
                     }
                     else
                     {
                        _loc3_.x = this._labelRect[_loc2_].x - _loc3_.width - WidgetConstants.LABEL_PADDING;
                     }
                     _loc3_.y = this._labelRect[_loc2_].y - _loc3_.height / 2;
                     if(_numRanges > 1)
                     {
                        if(_loc3_.width > this._labelRect[_loc2_].width || _loc3_.height > this._labelRect[_loc2_].height)
                        {
                           _loc3_.visible = false;
                        }
                        else
                        {
                           _loc3_.visible = true;
                        }
                     }
               }
               _loc2_++;
            }
         }
         else
         {
            _loc2_ = 0;
            while(_loc2_ < _numRanges)
            {
               _valueLabels[_loc2_].visible = false;
               _loc2_++;
            }
         }
      }
   }
}
