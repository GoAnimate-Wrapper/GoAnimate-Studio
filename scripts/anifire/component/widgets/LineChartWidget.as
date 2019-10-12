package anifire.component.widgets
{
   import anifire.models.widget.WidgetPartModel;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.geom.Rectangle;
   
   public class LineChartWidget extends WidgetMaker
   {
      
      public static const MAX_ENTRANCE_RATIO:Number = 0.2;
      
      public static const RANGE_ANIMATION_OVERLAP:Number = 0.4;
      
      public static const MIN_BAR_WIDTH:Number = 10;
       
      
      protected var _lineLayers:Vector.<Sprite>;
      
      protected var _nodeLayers:Vector.<Sprite>;
      
      protected var _canvasLayer:Sprite;
      
      protected var _rangeAnimationFactor:Vector.<Number>;
      
      protected var _barWidth:Number;
      
      protected var _barHeight:Number;
      
      protected var _barGap:Number;
      
      public function LineChartWidget()
      {
         super();
      }
      
      public function get rangeAnimationFactor() : Vector.<Number>
      {
         return this._rangeAnimationFactor;
      }
      
      public function get barWidth() : Number
      {
         return this._barWidth;
      }
      
      public function set barWidth(param1:Number) : void
      {
         this._barWidth = param1;
         _layoutInvalidateFlag = true;
      }
      
      public function get barHeight() : Number
      {
         return this._barHeight;
      }
      
      public function set barHeight(param1:Number) : void
      {
         this._barHeight = param1;
         _layoutInvalidateFlag = true;
      }
      
      public function get barGap() : Number
      {
         return this._barGap;
      }
      
      public function set barGap(param1:Number) : void
      {
         this._barGap = param1;
         _layoutInvalidateFlag = true;
      }
      
      public function getNodeGraphics(param1:int) : Graphics
      {
         if(param1 < 0 || param1 >= this._nodeLayers.length)
         {
            return null;
         }
         return this._nodeLayers[param1].graphics;
      }
      
      public function getLineGraphics(param1:int) : Graphics
      {
         if(param1 < 0 || param1 >= this._lineLayers.length)
         {
            return null;
         }
         return this._lineLayers[param1].graphics;
      }
      
      override public function get combinedMaxValue() : Number
      {
         return _maxValue;
      }
      
      override public function get combinedNegativeMaxValue() : Number
      {
         return _negativeMaxValue;
      }
      
      override protected function init() : void
      {
         super.init();
         _bounds = new Rectangle(0,0,320,240);
         this._barWidth = 30;
         this._barGap = 0;
         _minWidth = 150;
         _minHeight = 120;
         _layoutInvalidateFlag = true;
         this._rangeAnimationFactor = new Vector.<Number>();
         this._rangeAnimationFactor.push(1);
      }
      
      override protected function resetProperties() : void
      {
         super.resetProperties();
         _properties["node"] = "none";
         _properties["lineWeight"] = 2;
         _properties["drawLineWeight"] = 3;
      }
      
      override protected function initBasePart() : void
      {
         super.initBasePart();
         this._canvasLayer = new Sprite();
         addChild(this._canvasLayer);
         this._lineLayers = new Vector.<Sprite>();
         this._nodeLayers = new Vector.<Sprite>();
      }
      
      override protected function updateBasePartLayout() : void
      {
         super.updateBasePartLayout();
         this._barHeight = _basePart.contentBounds.height;
      }
      
      override protected function createBasePart() : WidgetBasePart
      {
         return new BarChartBasePart();
      }
      
      override protected function createPart(param1:WidgetPartModel) : WidgetPart
      {
         var _loc2_:WidgetPart = new LineChartPart();
         _loc2_.text = param1.labelText;
         _loc2_.values = param1.values.concat();
         return _loc2_;
      }
      
      override public function addPart(param1:WidgetPart) : void
      {
         super.addPart(param1);
         _layoutInvalidateFlag = true;
      }
      
      override public function removePartByIndex(param1:int) : void
      {
         super.removePartByIndex(param1);
         _layoutInvalidateFlag = true;
      }
      
      override public function updateRanges(param1:Vector.<String>) : void
      {
         var _loc3_:Sprite = null;
         var _loc4_:Sprite = null;
         var _loc5_:Sprite = null;
         super.updateRanges(param1);
         _entranceRatio = Math.min(MAX_ENTRANCE_RATIO,1 / (1 + _numRanges));
         this._rangeAnimationFactor.length = _numRanges;
         var _loc2_:int = 0;
         var _loc6_:int = this._canvasLayer.numChildren;
         if(_loc6_ > 0)
         {
            _loc2_ = 0;
            while(_loc2_ < _loc6_)
            {
               this._canvasLayer.removeChildAt(0);
               _loc2_++;
            }
         }
         this._lineLayers = new Vector.<Sprite>();
         this._nodeLayers = new Vector.<Sprite>();
         _loc2_ = 0;
         while(_loc2_ < _numRanges)
         {
            this._rangeAnimationFactor[_loc2_] = 1;
            _loc3_ = new Sprite();
            this._canvasLayer.addChild(_loc3_);
            _loc4_ = new Sprite();
            _loc3_.addChild(_loc4_);
            this._lineLayers.push(_loc4_);
            _loc5_ = new Sprite();
            _loc3_.addChild(_loc5_);
            this._nodeLayers.push(_loc5_);
            _loc2_++;
         }
      }
      
      override protected function updateLayout() : void
      {
         if(!_basePart)
         {
            return;
         }
         var _loc1_:Number = 10;
         var _loc2_:Number = _basePart.contentBounds.width;
         var _loc3_:Number = _loc2_ - _loc1_ * 2;
         var _loc4_:Number = _basePart.contentBounds.x + _loc1_;
         var _loc5_:Number = _loc3_ - (_dataPartCount * (this._barWidth + this._barGap) - this._barGap);
         var _loc6_:Number = this._barWidth;
         var _loc7_:Number = this._barGap;
         var _loc8_:Number = this._barWidth / (this._barWidth + this._barGap);
         var _loc9_:Number = 1 - _loc8_;
         var _loc10_:Number = _loc5_ / _dataPartCount;
         _loc6_ = this._barWidth + _loc10_ * _loc8_;
         _loc7_ = this._barGap + _loc10_ * _loc9_;
         if(_loc6_ >= MIN_BAR_WIDTH)
         {
            _loc4_ = _loc4_ + _loc10_ * _loc9_ * 0.5;
         }
         var _loc11_:Number = _loc4_;
         var _loc12_:int = _basePart.contentBounds.y;
         var _loc13_:int = 0;
         while(_loc13_ < _dataPartCount)
         {
            _dataParts[_loc13_].bounds = new Rectangle(_loc11_,_loc12_,_loc6_,this._barHeight);
            _loc11_ = _loc11_ + (_loc6_ + _loc7_);
            _loc13_++;
         }
         _basePart.draw();
      }
      
      override protected function postProcessContentBounds() : void
      {
      }
      
      override protected function get displayLabelPadding() : Boolean
      {
         return _displayDataLabel;
      }
      
      override protected function updateAnimation() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Number = _entranceRatio;
         var _loc3_:Number = Math.min(_animationFactor / _entranceRatio,1);
         _loc1_ = 0;
         while(_loc1_ < _dataPartCount)
         {
            _dataParts[_loc1_].animationFactor = _loc3_;
            _loc1_++;
         }
         this._canvasLayer.visible = _animationFactor >= _entranceRatio;
         var _loc4_:Number = RANGE_ANIMATION_OVERLAP * (_numRanges - 1);
         _loc2_ = _entranceRatio;
         var _loc5_:Number = (1 - _entranceRatio + _loc4_) / _numRanges;
         _loc1_ = 0;
         while(_loc1_ < _numRanges)
         {
            if(_animationFactor < _loc2_)
            {
               this._rangeAnimationFactor[_loc1_] = 0;
            }
            else if(_animationFactor >= _loc2_ + _loc5_)
            {
               this._rangeAnimationFactor[_loc1_] = 1;
            }
            else
            {
               this._rangeAnimationFactor[_loc1_] = easeOutQuad((_animationFactor - _loc2_) / _loc5_);
            }
            _loc2_ = _loc2_ + _loc5_;
            if(_numRanges > 1)
            {
               _loc2_ = _loc2_ - _loc4_ / (_numRanges - 1);
            }
            _loc1_++;
         }
         _basePart.animationFactor = _loc3_;
      }
      
      override public function setProperty(param1:String, param2:*) : void
      {
         super.setProperty(param1,param2);
         switch(param1)
         {
            case "node":
            case "dataLineWeight":
               invalidateDataParts();
               break;
            case "lineWeight":
               _basePart.invalidate();
         }
      }
      
      override public function getLegendLayoutWidth() : Number
      {
         return !!_displayLegend?Number(WidgetConstants.LEGEND_LAYOUT_WIDTH):Number(0);
      }
   }
}
