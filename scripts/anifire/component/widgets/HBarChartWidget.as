package anifire.component.widgets
{
   import anifire.models.widget.WidgetPartModel;
   import flash.geom.Rectangle;
   
   public class HBarChartWidget extends WidgetMaker
   {
      
      public static const DEFAULT_TITLE_HEIGHT:Number = 40;
       
      
      protected var _minBarHeight:Number;
      
      protected var _barWidth:Number;
      
      protected var _barHeight:Number;
      
      protected var _barGap:Number;
      
      public function HBarChartWidget()
      {
         super();
      }
      
      public function get minBarHeight() : Number
      {
         return this._minBarHeight;
      }
      
      public function set minBarHeight(param1:Number) : void
      {
         this._minBarHeight = param1;
         _layoutInvalidateFlag = true;
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
      
      override protected function init() : void
      {
         super.init();
         _basePartOnTop = true;
         _bounds = new Rectangle(-160,-120,320,240);
         _innerPaddingLeft = 20;
         _innerPaddingRight = 20;
         _innerPaddingTop = 5;
         _innerPaddingBottom = 5;
         _labelPaddingLeft = 30;
         _labelPaddingRight = 0;
         _labelPaddingTop = 0;
         _labelPaddingBottom = 0;
         _minWidth = 150;
         _minHeight = 120;
         _layoutInvalidateFlag = true;
      }
      
      override protected function resetProperties() : void
      {
         super.resetProperties();
         _properties["overlapRatio"] = 0.5;
         _properties["valuePosition"] = "outside";
         this._barHeight = 30;
         this._barGap = 10;
         this._minBarHeight = 5;
      }
      
      override protected function updateBasePartLayout() : void
      {
         super.updateBasePartLayout();
         this._barWidth = _basePart.contentBounds.width;
      }
      
      override protected function createBasePart() : WidgetBasePart
      {
         var _loc1_:BarChartBasePart = new BarChartBasePart();
         _loc1_.verticalAxis = true;
         return _loc1_;
      }
      
      override protected function createPart(param1:WidgetPartModel) : WidgetPart
      {
         var _loc2_:WidgetPart = new HBarChartPart();
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
      
      override protected function updateLayout() : void
      {
         if(!_basePart)
         {
            return;
         }
         var _loc1_:Number = 10;
         var _loc2_:Number = _basePart.contentBounds.height - _loc1_ * 2;
         var _loc3_:Number = _basePart.contentBounds.y + _loc1_;
         var _loc4_:Number = _loc2_ - (_dataPartCount * (this._barHeight + this._barGap) - this._barGap);
         var _loc5_:Number = this._barHeight;
         var _loc6_:Number = this._barGap;
         var _loc7_:Number = this._barHeight / (this._barHeight + this._barGap);
         var _loc8_:Number = 1 - _loc7_;
         var _loc9_:Number = _loc4_ / _dataPartCount;
         _loc5_ = this._barHeight + _loc9_ * _loc7_;
         _loc6_ = this._barGap + _loc9_ * _loc8_;
         if(_loc5_ < this._minBarHeight)
         {
            _loc5_ = this._minBarHeight;
            _loc4_ = _loc2_ - _loc5_ * _dataPartCount;
            _loc6_ = _loc4_ / (_dataPartCount - 1);
         }
         else
         {
            _loc3_ = _loc3_ + _loc9_ * _loc8_ * 0.5;
         }
         var _loc10_:int = _basePart.contentBounds.x;
         var _loc11_:Number = _loc3_;
         var _loc12_:int = 0;
         while(_loc12_ < _dataPartCount)
         {
            _dataParts[_loc12_].bounds = new Rectangle(_loc10_,_loc11_,this._barWidth,_loc5_);
            _loc11_ = _loc11_ + (_loc5_ + _loc6_);
            _loc12_++;
         }
         _basePart.draw();
      }
      
      override protected function postProcessContentBounds() : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         if(!_displayDataLabel)
         {
            return;
         }
         var _loc1_:Number = combinedMaxValue - combinedNegativeMaxValue;
         var _loc2_:Number = _basePart.contentBounds.width;
         var _loc3_:Number = -combinedNegativeMaxValue / _loc1_;
         if(_loc3_ > 0)
         {
            _loc4_ = _loc2_ + _labelPaddingLeft;
            _loc5_ = _loc4_ * _loc3_;
            if(_loc5_ < _labelPaddingLeft)
            {
               _basePart.contentBounds.left = _basePart.contentBounds.left + (_labelPaddingLeft - _loc5_);
            }
         }
      }
      
      override protected function updateAnimation() : void
      {
         var _loc1_:Number = getProperty("overlapRatio") * (_dataPartCount - 1);
         var _loc2_:Number = 0;
         var _loc3_:Number = (1 + _loc1_) / _dataPartCount;
         var _loc4_:int = 0;
         while(_loc4_ < _dataPartCount)
         {
            if(_animationFactor < _loc2_)
            {
               _dataParts[_loc4_].animationFactor = 0;
            }
            else if(_animationFactor >= _loc2_ + _loc3_)
            {
               _dataParts[_loc4_].animationFactor = 1;
            }
            else
            {
               _dataParts[_loc4_].animationFactor = easeOutQuad((_animationFactor - _loc2_) / _loc3_);
            }
            _loc2_ = _loc2_ + _loc3_;
            if(_dataPartCount > 1)
            {
               _loc2_ = _loc2_ - _loc1_ / (_dataPartCount - 1);
            }
            _loc4_++;
         }
         _basePart.animationFactor = Math.min(_animationFactor / _entranceRatio,1);
      }
      
      override public function setProperty(param1:String, param2:*) : void
      {
         super.setProperty(param1,param2);
         switch(param1)
         {
            case "minBarHeight":
               this.minBarHeight = param2;
               break;
            case "barHeight":
               this.barHeight = param2;
               break;
            case "gap":
               this.barGap = param2;
               break;
            case "valuePosition":
               updateStyle();
               _layoutInvalidateFlag = true;
               break;
            case "offset":
               _basePart.invalidate();
               invalidateDataParts();
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
