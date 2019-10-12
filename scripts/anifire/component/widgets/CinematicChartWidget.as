package anifire.component.widgets
{
   public class CinematicChartWidget extends WidgetMaker
   {
      
      public static const MAX_ENTRANCE_RATIO:Number = 0.2;
      
      public static const ENTRANCE_PHASE:Number = 0.2;
      
      public static const DATA_PHASE:Number = 0.8;
      
      public static const DEFAULT_LEGEND_PART_HEIGHT:Number = 50;
      
      public static const DEFAULT_RANGE_ANIMATION_RATIO:Number = 0.8;
       
      
      protected var _rangeIndex:int;
      
      public function CinematicChartWidget()
      {
         super();
      }
      
      public function get rangeIndex() : int
      {
         return this._rangeIndex;
      }
      
      override protected function createBasePart() : WidgetBasePart
      {
         return new CinematicChartBasePart();
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
      
      protected function getRangeAnimationRatio() : Number
      {
         return DEFAULT_RANGE_ANIMATION_RATIO;
      }
      
      override protected function postProcessValues() : void
      {
         _entranceRatio = Math.min(MAX_ENTRANCE_RATIO,1 / (1 + _numRanges));
      }
      
      override protected function updateAnimation() : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc10_:CinematicChartPart = null;
         var _loc1_:Number = (_animationFactor - _entranceRatio) / (1 - _entranceRatio);
         if(_loc1_ <= 0)
         {
            _loc1_ = 0;
         }
         if(_numRanges > 1)
         {
            _loc2_ = _loc1_ * _numRanges;
            this._rangeIndex = Math.min(int(_numRanges * _loc1_),_numRanges - 1);
            _loc2_ = _loc2_ - this._rangeIndex;
         }
         else
         {
            this._rangeIndex = 0;
            _loc2_ = _loc1_;
         }
         var _loc4_:Number = this.getRangeAnimationRatio();
         if(_loc2_ >= _loc4_)
         {
            _loc3_ = 1;
         }
         else
         {
            _loc3_ = _loc2_ / _loc4_;
         }
         var _loc5_:Number = getProperty("overlapRatio") * (_dataPartCount - 1);
         var _loc6_:Number = 0;
         var _loc7_:Number = (1 + _loc5_) / _dataPartCount;
         var _loc8_:int = 0;
         while(_loc8_ < _dataPartCount)
         {
            _loc10_ = _dataParts[_loc8_] as CinematicChartPart;
            _loc10_.rangeIndex = this._rangeIndex;
            if(_loc3_ < _loc6_)
            {
               _loc10_.animationFactor = 0;
            }
            else if(_loc3_ >= _loc6_ + _loc7_)
            {
               _loc10_.animationFactor = 1;
            }
            else
            {
               _loc10_.animationFactor = easeOutQuad((_loc3_ - _loc6_) / _loc7_);
            }
            _loc6_ = _loc6_ + _loc7_;
            if(_dataPartCount > 1)
            {
               _loc6_ = _loc6_ - _loc5_ / (_dataPartCount - 1);
            }
            _loc8_++;
         }
         _basePart.animationFactor = Math.min(_animationFactor / _entranceRatio,1);
         var _loc9_:CinematicLegendPart = _basePart.legendPart as CinematicLegendPart;
         if(_loc9_)
         {
            _loc9_.rangeIndex = this._rangeIndex;
            _loc9_.animationFactor = _loc2_;
         }
      }
      
      override public function getLegendLayoutHeight() : Number
      {
         return !!_displayLegend?Number(DEFAULT_LEGEND_PART_HEIGHT):Number(0);
      }
   }
}
