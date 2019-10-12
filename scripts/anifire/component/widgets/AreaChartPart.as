package anifire.component.widgets
{
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.geom.Point;
   
   public class AreaChartPart extends WidgetPart
   {
      
      public static const PI:Number = 3.14159265358979;
      
      public static const HALF_PI:Number = 1.5707963267949;
      
      public static const LABEL_POSITION_RADIUS:Number = 15;
      
      public static const LABEL_BOUNDARY_PADDING:Number = 10;
       
      
      protected var _startPt:Vector.<Point>;
      
      public var _endPt:Vector.<Point>;
      
      protected var _nextPt:Vector.<Point>;
      
      protected var _finalEndPt:Vector.<Point>;
      
      protected var _labelPt:Vector.<Point>;
      
      protected var _labelRadian:Vector.<Number>;
      
      protected var _labelRadius:Number;
      
      protected var _valueAxisOffset:Number;
      
      protected var atan:Function;
      
      protected var cos:Function;
      
      protected var sin:Function;
      
      public function AreaChartPart()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         _label = new WidgetLabel();
         _label.rotation = 45;
         _label.enableAutoSize(50);
         addChild(_label);
         _valueLabels = new Vector.<WidgetLabel>();
         this._startPt = new Vector.<Point>();
         this._endPt = new Vector.<Point>();
         this._nextPt = new Vector.<Point>();
         this._finalEndPt = new Vector.<Point>();
         this._labelPt = new Vector.<Point>();
         this._labelRadian = new Vector.<Number>();
         this.atan = Math.atan2;
         this.cos = Math.cos;
         this.sin = Math.sin;
      }
      
      override public function set values(param1:Vector.<Number>) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         var _loc5_:WidgetLabel = null;
         super.values = param1;
         _numRanges = param1.length;
         this._startPt.length = _numRanges;
         this._endPt.length = _numRanges;
         this._nextPt.length = _numRanges;
         this._finalEndPt.length = _numRanges;
         this._labelPt.length = _numRanges;
         this._labelRadian.length = _numRanges;
         var _loc4_:int = _valueLabels.length;
         _loc3_ = 0;
         while(_loc3_ < _numRanges)
         {
            if(_loc3_ >= _loc4_)
            {
               this._startPt[_loc3_] = new Point();
               this._endPt[_loc3_] = new Point();
               this._nextPt[_loc3_] = new Point();
               this._finalEndPt[_loc3_] = new Point();
               this._labelPt[_loc3_] = new Point();
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
         var _loc11_:Sprite = null;
         var _loc12_:Graphics = null;
         var _loc13_:uint = 0;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc1_:AreaChartWidget = _widgetMaker as AreaChartWidget;
         var _loc2_:Number = 0;
         var _loc3_:Number = _widgetMaker.combinedMaxValue;
         if(!_bounds || _loc3_ <= 0)
         {
            return;
         }
         this._valueAxisOffset = 0;
         var _loc4_:Number = _bounds.width * 0.5;
         var _loc5_:int = _values.length;
         var _loc6_:Number = _bounds.y + _bounds.height - this._valueAxisOffset;
         var _loc7_:Number = 0;
         var _loc8_:Number = 0;
         var _loc9_:AreaChartPart = _prevPart as AreaChartPart;
         var _loc10_:int = 0;
         while(_loc10_ < _numRanges)
         {
            _loc11_ = _loc1_.getAreaSpriteByRange(_loc10_);
            _loc12_ = _loc11_.graphics;
            if(itemIndex == 0)
            {
               _loc12_.clear();
            }
            this._startPt[_loc10_].x = _bounds.x - _loc4_;
            this._endPt[_loc10_].x = _bounds.x + _loc4_;
            this._nextPt[_loc10_].x = this._endPt[_loc10_].x + _bounds.width;
            this._finalEndPt[_loc10_].x = _bounds.x + _loc4_;
            _loc13_ = _style.getColorByIndex(_loc10_);
            _loc14_ = _values[_loc10_];
            if(_loc14_ < 0)
            {
               _loc14_ = 0;
            }
            _loc7_ = _loc7_ + _loc14_;
            _loc14_ = _loc7_;
            _loc15_ = !!_nextPart?Number(_nextPart.getValueByRange(_loc10_)):Number(_loc2_);
            if(_loc15_ < 0)
            {
               _loc15_ = 0;
            }
            _loc8_ = _loc8_ + _loc15_;
            _loc15_ = _loc8_;
            _loc16_ = _widgetMaker.easeOutQuad(_loc1_.rangeAnimationFactor[_loc10_]);
            _loc17_ = _bounds.height * (_loc14_ * _loc16_ - _loc2_) / _loc3_;
            _loc18_ = _bounds.height * (_loc14_ - _loc2_) / _loc3_;
            _loc19_ = _bounds.height * (_loc15_ * _loc16_ - _loc2_) / _loc3_;
            this._startPt[_loc10_].y = !!_loc9_?Number(_loc9_._endPt[_loc10_].y):Number(_bounds.y + _bounds.height);
            this._endPt[_loc10_].y = _bounds.y + _bounds.height - _loc17_;
            this._finalEndPt[_loc10_].y = _bounds.y + _bounds.height - _loc18_;
            this._nextPt[_loc10_].y = bounds.y + _bounds.height - _loc19_;
            _loc20_ = this.atan(this._startPt[_loc10_].y - this._endPt[_loc10_].y,this._startPt[_loc10_].x - this._endPt[_loc10_].x);
            _loc21_ = this.atan(this._nextPt[_loc10_].y - this._endPt[_loc10_].y,this._nextPt[_loc10_].x - this._endPt[_loc10_].x);
            this._labelRadian[_loc10_] = (_loc20_ + _loc21_) * 0.5;
            if(this._labelRadian[_loc10_] - _loc20_ < HALF_PI)
            {
               this._labelRadian[_loc10_] = this._labelRadian[_loc10_] + PI;
            }
            this._labelPt[_loc10_].x = this._endPt[_loc10_].x + this.cos(this._labelRadian[_loc10_]) * LABEL_POSITION_RADIUS;
            this._labelPt[_loc10_].y = this._endPt[_loc10_].y + this.sin(this._labelRadian[_loc10_]) * LABEL_POSITION_RADIUS;
            if(_loc1_.rangeAnimationFactor[_loc10_] > 0)
            {
               if(_itemIndex > 0)
               {
                  _loc12_.beginFill(_loc13_);
                  _loc12_.moveTo(this._startPt[_loc10_].x,this._startPt[_loc10_].y);
                  _loc12_.lineTo(this._endPt[_loc10_].x,this._endPt[_loc10_].y);
                  _loc12_.lineTo(this._endPt[_loc10_].x,_loc6_);
                  _loc12_.lineTo(this._startPt[_loc10_].x,_loc6_);
                  _loc12_.endFill();
               }
            }
            _loc10_++;
         }
      }
      
      override protected function updateLabelLayout() : void
      {
         var _loc2_:int = 0;
         var _loc3_:WidgetLabel = null;
         var _loc4_:Number = NaN;
         if(!_loading && _widgetMaker.displayDataLabel)
         {
            _label.visible = true;
            _label.x = _bounds.x + _bounds.width * 0.5;
            _label.y = _bounds.y + _bounds.height + 5;
            _label.alpha = _animationFactor;
         }
         else
         {
            _label.visible = false;
         }
         var _loc1_:AreaChartWidget = _widgetMaker as AreaChartWidget;
         if(!_loading && _widgetMaker.displayValueLabel)
         {
            _loc2_ = 0;
            while(_loc2_ < _numRanges)
            {
               _loc3_ = _valueLabels[_loc2_];
               _loc3_.visible = true;
               _loc3_.alpha = _loc1_.rangeAnimationFactor[_loc2_];
               _loc3_.text = getAnimatedLabelTextByRange(_loc2_,1);
               _loc4_ = this._finalEndPt[_loc2_].y + this.sin(this._labelRadian[_loc2_]) * LABEL_POSITION_RADIUS;
               if(_widgetMaker.displayDataLabel && _loc4_ > _bounds.y + _bounds.height - LABEL_BOUNDARY_PADDING)
               {
                  this._labelRadian[_loc2_] = this._labelRadian[_loc2_] + PI;
                  this._labelPt[_loc2_].x = this._endPt[_loc2_].x + this.cos(this._labelRadian[_loc2_]) * LABEL_POSITION_RADIUS;
                  this._labelPt[_loc2_].y = this._endPt[_loc2_].y + this.sin(this._labelRadian[_loc2_]) * LABEL_POSITION_RADIUS;
               }
               _loc3_.x = this._labelPt[_loc2_].x - _loc3_.width * 0.5;
               _loc3_.y = this._labelPt[_loc2_].y - _loc3_.height * 0.5;
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
