package anifire.component.widgets
{
   import flash.display.Graphics;
   import flash.geom.Point;
   
   public class CinematicAreaChartPart extends CinematicChartPart
   {
      
      public static const ANIMATION_DELAY_RATIO:Number = 0.2;
      
      public static const LABEL_DISPLAY_PHASE:Number = 0.6;
      
      public static const PI:Number = 3.14159265358979;
      
      public static const HALF_PI:Number = 1.5707963267949;
      
      public static const LABEL_POSITION_RADIUS:Number = 15;
      
      public static const LABEL_BOUNDARY_PADDING:Number = 10;
       
      
      protected var _startPt:Point;
      
      protected var _endPt:Point;
      
      protected var _nextPt:Point;
      
      protected var _finalEndPt:Point;
      
      protected var _labelPt:Point;
      
      protected var _labelRadian:Number;
      
      protected var _labelRadius:Number;
      
      protected var _valueAxisOffset:Number;
      
      protected var atan:Function;
      
      protected var cos:Function;
      
      protected var sin:Function;
      
      public function CinematicAreaChartPart()
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
         _valueLabel = new WidgetLabel();
         addChild(_valueLabel);
         this._startPt = new Point();
         this._endPt = new Point();
         this._nextPt = new Point();
         this._finalEndPt = new Point();
         this._labelPt = new Point();
         this.atan = Math.atan2;
         this.cos = Math.cos;
         this.sin = Math.sin;
      }
      
      public function get endPoint() : Point
      {
         return this._endPt;
      }
      
      override public function draw() : void
      {
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc1_:CinematicAreaChartWidget = _widgetMaker as CinematicAreaChartWidget;
         var _loc2_:Graphics = _loc1_.lineLayer.graphics;
         if(itemIndex == 0)
         {
            _loc2_.clear();
         }
         var _loc3_:Number = _widgetMaker.maxValue - _widgetMaker.negativeMaxValue;
         if(!_bounds || _loc3_ <= 0 || !(_rangeIndex > 0 || _animationFactor > 0))
         {
            return;
         }
         var _loc4_:Number = _style.getNumericProperty("dataLineWeight");
         var _loc5_:uint = 16777215;
         var _loc6_:uint = _style.getColorByIndex(_rangeIndex);
         this._valueAxisOffset = _bounds.height * (-_widgetMaker.negativeMaxValue / _loc3_);
         var _loc7_:Number = _bounds.y + _bounds.height - this._valueAxisOffset;
         var _loc8_:Number = _bounds.width * 0.5;
         this._startPt.x = _bounds.x - _loc8_;
         this._endPt.x = _bounds.x + _loc8_;
         this._nextPt.x = this._endPt.x + _bounds.width;
         this._finalEndPt.x = _bounds.x + _loc8_;
         var _loc9_:Number = _widgetMaker.easeOutQuad(Math.max((_animationFactor - ANIMATION_DELAY_RATIO) / (1 - ANIMATION_DELAY_RATIO),0));
         var _loc10_:Number = _rangeIndex > 0?Number(_values[_rangeIndex - 1]):Number(0);
         var _loc11_:Number = _values[_rangeIndex];
         var _loc12_:Number = _loc10_ + (_loc11_ - _loc10_) * _loc9_;
         if(_prevPart)
         {
            _loc14_ = _rangeIndex > 0?Number(_prevPart.getValueByRange(_rangeIndex - 1)):Number(0);
            _loc15_ = _prevPart.getValueByRange(_rangeIndex);
            _loc13_ = _loc14_ + (_loc15_ - _loc14_) * _loc9_;
            this._startPt = (_prevPart as CinematicAreaChartPart).endPoint;
         }
         else
         {
            this._startPt = new Point();
            this._startPt.x = _bounds.x - _loc8_;
            _loc15_ = _widgetMaker.negativeMaxValue;
            _loc13_ = _widgetMaker.negativeMaxValue;
         }
         if(_nextPart)
         {
            _loc17_ = _rangeIndex > 0?Number(_nextPart.getValueByRange(_rangeIndex - 1)):Number(0);
            _loc18_ = _nextPart.getValueByRange(_rangeIndex);
            _loc16_ = _loc17_ + (_loc18_ - _loc17_) * _loc9_;
         }
         else
         {
            _loc16_ = _widgetMaker.negativeMaxValue;
            _loc18_ = _widgetMaker.negativeMaxValue;
         }
         var _loc19_:Number = _bounds.height * (_loc12_ - _widgetMaker.negativeMaxValue) / _loc3_;
         var _loc20_:Number = _bounds.height * (_loc11_ - _widgetMaker.negativeMaxValue) / _loc3_;
         var _loc21_:Number = _bounds.height * (_loc13_ - _widgetMaker.negativeMaxValue) / _loc3_;
         var _loc22_:Number = _bounds.height * (_loc15_ - _widgetMaker.negativeMaxValue) / _loc3_;
         var _loc23_:Number = _bounds.height * (_loc16_ - _widgetMaker.negativeMaxValue) / _loc3_;
         var _loc24_:Number = _bounds.height * (_loc18_ - _widgetMaker.negativeMaxValue) / _loc3_;
         if(!_prevPart)
         {
            this._startPt.y = _bounds.y + _bounds.height - _loc21_;
         }
         this._endPt.y = _bounds.y + _bounds.height - _loc19_;
         this._finalEndPt.y = _bounds.y + _bounds.height - _loc20_;
         this._nextPt.y = bounds.y + _bounds.height - _loc23_;
         var _loc25_:Number = this.atan(_bounds.y + _bounds.height - _loc22_ - this._finalEndPt.y,this._startPt.x - this._endPt.x);
         var _loc26_:Number = this.atan(_bounds.y + _bounds.height - _loc24_ - this._finalEndPt.y,this._nextPt.x - this._endPt.x);
         this._labelRadian = (_loc25_ + _loc26_) * 0.5;
         if(this._labelRadian - _loc25_ < HALF_PI)
         {
            this._labelRadian = this._labelRadian + PI;
         }
         this._labelPt.x = this._finalEndPt.x + this.cos(this._labelRadian) * LABEL_POSITION_RADIUS;
         this._labelPt.y = this._finalEndPt.y + this.sin(this._labelRadian) * LABEL_POSITION_RADIUS;
         if(_itemIndex > 0)
         {
            _loc2_.beginFill(_loc6_);
            _loc2_.moveTo(this._startPt.x,this._startPt.y);
            _loc2_.lineTo(this._endPt.x,this._endPt.y);
            _loc2_.lineTo(this._endPt.x,_loc7_);
            _loc2_.lineTo(this._startPt.x,_loc7_);
            _loc2_.endFill();
         }
      }
      
      override protected function updateLabelLayout() : void
      {
         var _loc1_:Number = NaN;
         if(!_loading && _widgetMaker.displayDataLabel)
         {
            _label.visible = true;
            _label.x = _bounds.x + _bounds.width * 0.5;
            _label.y = _bounds.y + _bounds.height + 5;
            _label.alpha = _rangeIndex > 0?Number(1):Number(_animationFactor);
         }
         else
         {
            _label.visible = false;
         }
         if(!_loading && _widgetMaker.displayValueLabel)
         {
            _valueLabel.visible = true;
            _valueLabel.alpha = Math.min(_animationFactor / LABEL_DISPLAY_PHASE,1);
            _valueLabel.text = getAnimatedLabelTextByRange(_rangeIndex,1);
            _loc1_ = this._finalEndPt.y + this.sin(this._labelRadian) * LABEL_POSITION_RADIUS;
            if(_widgetMaker.displayDataLabel && _loc1_ > _bounds.y + _bounds.height - LABEL_BOUNDARY_PADDING)
            {
               this._labelRadian = this._labelRadian + PI;
               this._labelPt.x = this._finalEndPt.x + this.cos(this._labelRadian) * LABEL_POSITION_RADIUS;
               this._labelPt.y = this._finalEndPt.y + this.sin(this._labelRadian) * LABEL_POSITION_RADIUS;
            }
            _valueLabel.x = this._labelPt.x - _valueLabel.width * 0.5;
            _valueLabel.y = this._labelPt.y - _valueLabel.height * 0.5;
         }
         else
         {
            _valueLabel.visible = false;
         }
      }
   }
}
