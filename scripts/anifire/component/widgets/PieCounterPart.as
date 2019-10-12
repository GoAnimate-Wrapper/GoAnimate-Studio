package anifire.component.widgets
{
   public class PieCounterPart extends PieChartPart
   {
      
      public static const SQRT_2:Number = 1.4142135623731;
      
      public static const LABEL_WIDTH_LIMIT:Number = 60;
      
      public static const LABEL_HEIGHT_LIMIT:Number = 30;
       
      
      public function PieCounterPart()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         _valueLabel.visible = false;
      }
      
      override protected function updateLabelLayout() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         if(!_loading && (_widgetMaker.displayValueLabel || _widgetMaker.displayPercentageLabel))
         {
            _label.visible = true;
            switch(_widgetMaker.getProperty("valuePosition"))
            {
               case "inside":
                  if(_innerRatio > 0)
                  {
                     _loc1_ = _radius * _innerRatio * SQRT_2;
                  }
                  else
                  {
                     _loc1_ = _radius * SQRT_2;
                  }
                  _label.enableAutoSize(_loc1_,_loc1_);
                  _label.x = _centerX - _label.width * 0.5;
                  _label.y = _centerY - _label.height * 0.5;
                  break;
               case "outside":
               default:
                  _loc2_ = cos(_midRadian);
                  _loc3_ = sin(_midRadian);
                  _loc4_ = _centerX + _loc2_ * (_radius + 5);
                  _loc5_ = _centerY + _loc3_ * (_radius + 5);
                  _loc4_ = _loc4_ + _loc2_ * LABEL_WIDTH_LIMIT * 0.5;
                  _loc5_ = _loc5_ + _loc3_ * LABEL_HEIGHT_LIMIT * 0.5;
                  _label.enableAutoSize(LABEL_WIDTH_LIMIT,LABEL_HEIGHT_LIMIT);
                  _label.x = _loc4_ - _label.width * 0.5;
                  _label.y = _loc5_ - _label.height * 0.5;
            }
         }
         else
         {
            _label.visible = false;
         }
      }
   }
}
