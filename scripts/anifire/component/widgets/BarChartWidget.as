package anifire.component.widgets
{
   import anifire.models.widget.WidgetPartModel;
   import flash.geom.Rectangle;
   
   public class BarChartWidget extends WidgetMaker
   {
       
      
      protected var _minBarWidth:Number;
      
      protected var _barWidth:Number;
      
      protected var _barHeight:Number;
      
      protected var _barGap:Number;
      
      public function BarChartWidget()
      {
         super();
      }
      
      public function get minBarWidth() : Number
      {
         return this._minBarWidth;
      }
      
      public function set minBarWidth(param1:Number) : void
      {
         this._minBarWidth = param1;
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
         _bounds = new Rectangle(0,0,320,240);
         _minWidth = 150;
         _minHeight = 120;
         _layoutInvalidateFlag = true;
      }
      
      override protected function resetProperties() : void
      {
         super.resetProperties();
         _properties["overlapRatio"] = 0.5;
         _properties["valuePosition"] = "default";
         this._barWidth = 30;
         this._minBarWidth = 5;
         this._barGap = 10;
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
         var _loc2_:WidgetPart = new BarChartPart();
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
         if(_loc6_ < this._minBarWidth)
         {
            _loc6_ = this._minBarWidth;
            _loc5_ = _loc3_ - _loc6_ * _dataPartCount;
            _loc7_ = _loc5_ / (_dataPartCount - 1);
         }
         else
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
            case "minBarWidth":
               this.minBarWidth = param2;
               break;
            case "barWidth":
               this.barWidth = param2;
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
               break;
            case "border":
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
