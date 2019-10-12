package anifire.component.widgets
{
   import flash.display.BlendMode;
   import flash.display.Sprite;
   
   public class PieChartPart extends WidgetPart
   {
      
      public static const DOUBLE_PI:Number = 6.28318530717959;
      
      public static const PI:Number = 3.14159265358979;
      
      public static const HALF_PI:Number = 1.5707963267949;
      
      public static const SQRT_2:Number = 1.4142135623731;
      
      public static const MASK_SEGMENT_RADIAN:Number = 0.392699081698724;
       
      
      protected var cos:Function;
      
      protected var sin:Function;
      
      protected var drawLayer:Sprite;
      
      protected var pieLayer:Sprite;
      
      protected var eraseLayer:Sprite;
      
      protected var maskLayer:Sprite;
      
      protected var _midRadian:Number;
      
      protected var _endRadian:Number;
      
      protected var _radius:Number;
      
      protected var _centerX:Number;
      
      protected var _centerY:Number;
      
      protected var _innerRatio:Number;
      
      protected var _outerRatio:Number;
      
      public function PieChartPart()
      {
         super();
      }
      
      public function get innerRatio() : Number
      {
         return this._innerRatio;
      }
      
      public function set innerRatio(param1:Number) : void
      {
         if(this._innerRatio != param1)
         {
            this._innerRatio = param1;
            _invalidateFlag = true;
         }
      }
      
      public function get outerRatio() : Number
      {
         return this._outerRatio;
      }
      
      public function set outerRatio(param1:Number) : void
      {
         if(this._outerRatio != param1)
         {
            this._outerRatio = param1;
            _invalidateFlag = true;
         }
      }
      
      override protected function init() : void
      {
         super.init();
         blendMode = BlendMode.LAYER;
         this._outerRatio = 0;
         _cumulatedValue = 0;
         this.drawLayer = new Sprite();
         addChild(this.drawLayer);
         this.maskLayer = new Sprite();
         addChild(this.maskLayer);
         this.drawLayer.blendMode = BlendMode.LAYER;
         this.drawLayer.mask = this.maskLayer;
         this.pieLayer = new Sprite();
         this.drawLayer.addChild(this.pieLayer);
         this.eraseLayer = new Sprite();
         this.eraseLayer.blendMode = BlendMode.ERASE;
         this.drawLayer.addChild(this.eraseLayer);
         _label = new WidgetLabel();
         addChild(_label);
         _valueLabel = new WidgetLabel();
         addChild(_valueLabel);
         this.cos = Math.cos;
         this.sin = Math.sin;
      }
      
      override public function draw() : void
      {
         var _loc4_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Boolean = false;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         graphics.clear();
         this.pieLayer.graphics.clear();
         this.maskLayer.graphics.clear();
         this.eraseLayer.graphics.clear();
         var _loc1_:Number = _widgetMaker.totalValue;
         var _loc2_:Number = _style.getNumericProperty("startRatio");
         var _loc3_:Number = 0;
         if(_loc1_ <= 0)
         {
            _loc3_ = _itemIndex == 0?Number(1):Number(0);
         }
         else if(value > 0)
         {
            _loc3_ = value / _loc1_;
         }
         _loc4_ = _loc3_ * _animationFactor;
         this._radius = Math.min(_bounds.width,_bounds.height) * 0.5;
         var _loc5_:Number = this._radius * this._innerRatio;
         this._centerX = _bounds.x + _bounds.width * 0.5;
         this._centerY = _bounds.y + _bounds.height * 0.5;
         if(drawColor != uint.MAX_VALUE)
         {
            this.pieLayer.graphics.beginFill(drawColor);
            this.pieLayer.graphics.drawCircle(this._centerX,this._centerY,this._radius * (1 - this.outerRatio));
            if(this._innerRatio > 0 && this._innerRatio < 1)
            {
               this.pieLayer.graphics.drawCircle(this._centerX,this._centerY,_loc5_);
            }
            this.pieLayer.graphics.endFill();
         }
         if(_loc4_ <= 0 || _loc3_ < 0)
         {
            this.drawLayer.visible = false;
         }
         else
         {
            this.drawLayer.visible = true;
            if(_loc4_ < DOUBLE_PI)
            {
               _loc8_ = _loc1_ > 0?Number((_loc2_ + _cumulatedValue / _loc1_) * DOUBLE_PI - HALF_PI):Number(0);
               this._endRadian = _loc8_ + _loc4_ * DOUBLE_PI;
               this.maskLayer.graphics.moveTo(this._centerX,this._centerY);
               this.maskLayer.graphics.beginFill(0);
               _loc9_ = this._radius * SQRT_2;
               _loc10_ = _loc8_;
               do
               {
                  _loc6_ = this._centerX + this.cos(_loc10_) * _loc9_;
                  _loc7_ = this._centerY + this.sin(_loc10_) * _loc9_;
                  this.maskLayer.graphics.lineTo(_loc6_,_loc7_);
                  _loc10_ = _loc10_ + MASK_SEGMENT_RADIAN;
               }
               while(_loc10_ <= this._endRadian);
               
               _loc6_ = this._centerX + this.cos(this._endRadian) * _loc9_;
               _loc7_ = this._centerY + this.sin(this._endRadian) * _loc9_;
               this.maskLayer.graphics.lineTo(_loc6_,_loc7_);
               this.maskLayer.graphics.lineTo(this._centerX,this._centerY);
               this.maskLayer.graphics.endFill();
               _loc12_ = _style.getNumericProperty("gap");
               if(_loc12_ > 0)
               {
                  this.eraseLayer.graphics.lineStyle(_loc12_,0);
                  this.eraseLayer.graphics.moveTo(this._centerX + this.cos(_loc8_) * _loc5_,this._centerY + this.sin(_loc8_) * _loc5_);
                  this.eraseLayer.graphics.lineTo(this._centerX + this.cos(_loc8_) * this._radius,this._centerY + this.sin(_loc8_) * this._radius);
                  this.eraseLayer.graphics.moveTo(this._centerX + this.cos(this._endRadian) * _loc5_,this._centerY + this.sin(this._endRadian) * _loc5_);
                  this.eraseLayer.graphics.lineTo(this._centerX + this.cos(this._endRadian) * this._radius,this._centerY + this.sin(this._endRadian) * this._radius);
               }
            }
            else
            {
               this._endRadian = _loc2_ * DOUBLE_PI - HALF_PI;
            }
         }
         if(_itemIndex == 0)
         {
            _loc13_ = _style.getNumericProperty("lineWeight");
            if(_loc13_ > 0)
            {
               graphics.lineStyle(_loc13_,_style.lineColor);
               _loc14_ = _loc13_ * 0.5 + _style.getNumericProperty("offset");
               graphics.drawCircle(this._centerX,this._centerY,this._radius + _loc14_);
               if(this._innerRatio > 0)
               {
                  graphics.drawCircle(this._centerX,this._centerY,_loc5_ - _loc14_);
               }
            }
         }
         this._midRadian = _loc8_ + _loc3_ * PI;
      }
      
      override protected function updateLabelLayout() : void
      {
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc1_:Number = 60;
         var _loc2_:Number = 30;
         var _loc3_:Number = this.cos(this._midRadian);
         var _loc4_:Number = this.sin(this._midRadian);
         var _loc5_:Number = this._centerX + _loc3_ * (this._radius + 5);
         var _loc6_:Number = this._centerY + _loc4_ * (this._radius + 5);
         if(!_loading && _widgetMaker.displayDataLabel && _animationFactor > 0 && value > 0)
         {
            _label.visible = true;
            _label.alpha = _animationFactor;
         }
         else
         {
            _label.visible = false;
         }
         if(!_loading && (_widgetMaker.displayValueLabel || _widgetMaker.displayPercentageLabel) && animationFactor > 0 && value > 0)
         {
            _valueLabel.visible = true;
            _valueLabel.text = getLabelText();
         }
         else
         {
            _valueLabel.visible = false;
         }
         if(_label.visible && _valueLabel.visible)
         {
            _label.enableAutoSize(_loc1_,_loc2_ * 0.5);
            _valueLabel.enableAutoSize(_loc1_,_loc2_ * 0.5);
            _loc7_ = Math.max(_label.width,_valueLabel.width);
            _loc8_ = _label.height + _valueLabel.height;
         }
         else if(_label.visible)
         {
            _label.enableAutoSize(_loc1_,_loc8_);
            _loc7_ = _label.width;
            _loc8_ = _label.height;
         }
         else
         {
            _valueLabel.enableAutoSize(_loc1_,_loc2_);
            _loc7_ = _valueLabel.width;
            _loc8_ = _valueLabel.height;
         }
         _loc5_ = _loc5_ + _loc3_ * _loc1_ * 0.5;
         _loc6_ = _loc6_ + _loc4_ * _loc2_ * 0.5;
         _label.x = _loc5_ - _label.width * 0.5;
         _label.y = _loc6_ - _loc8_ * 0.5;
         _valueLabel.x = _loc5_ - _valueLabel.width * 0.5;
         _valueLabel.y = _loc6_ + _loc8_ * 0.5 - _valueLabel.height;
      }
   }
}
