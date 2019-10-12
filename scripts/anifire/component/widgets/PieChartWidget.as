package anifire.component.widgets
{
   import anifire.models.widget.WidgetPartModel;
   import flash.geom.Rectangle;
   
   public class PieChartWidget extends WidgetMaker
   {
      
      public static const PIE_PADDING_TOP:Number = 10;
       
      
      public function PieChartWidget()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         _basePartOnTop = true;
         _bounds = new Rectangle(-100,-130,200,260);
         _innerPaddingLeft = 40;
         _innerPaddingRight = 40;
         _innerPaddingTop = 30;
         _innerPaddingBottom = 30;
         _labelPaddingBottom = 0;
         _minWidth = 200;
         _minHeight = 200;
      }
      
      override protected function resetProperties() : void
      {
         super.resetProperties();
         _properties["innerRatio"] = 0;
         _properties["startRatio"] = 0;
         _properties["labelRatio"] = 1.4;
      }
      
      override protected function createBasePart() : WidgetBasePart
      {
         return new PieChartBasePart();
      }
      
      override protected function createPart(param1:WidgetPartModel) : WidgetPart
      {
         var _loc2_:WidgetPart = new PieChartPart();
         _loc2_.bounds = _basePart.contentBounds.clone();
         _loc2_.text = param1.labelText;
         _loc2_.value = param1.value;
         return _loc2_;
      }
      
      override protected function updateLayout() : void
      {
         var _loc2_:PieChartPart = null;
         var _loc1_:int = 0;
         while(_loc1_ < _dataPartCount)
         {
            _loc2_ = PieChartPart(_dataParts[_loc1_]);
            _loc2_.bounds = _basePart.contentBounds;
            _loc2_.innerRatio = _properties["innerRatio"];
            _loc1_++;
         }
      }
      
      override protected function updateAnimation() : void
      {
         var _loc4_:Number = NaN;
         var _loc1_:Number = easeOutQuad(_animationFactor);
         var _loc2_:Number = 0;
         var _loc3_:int = 0;
         while(_loc3_ < _dataPartCount)
         {
            _loc4_ = 0;
            if(_totalValue > 0 && _dataParts[_loc3_].value >= 0)
            {
               _loc4_ = _dataParts[_loc3_].value / _totalValue;
            }
            if(_loc1_ < _loc2_)
            {
               _dataParts[_loc3_].animationFactor = 0;
            }
            else if(_loc1_ >= _loc2_ + _loc4_)
            {
               _dataParts[_loc3_].animationFactor = 1;
            }
            else
            {
               _dataParts[_loc3_].animationFactor = (_loc1_ - _loc2_) / _loc4_;
            }
            _loc2_ = _loc2_ + _loc4_;
            _loc3_++;
         }
      }
      
      override public function setProperty(param1:String, param2:*) : void
      {
         super.setProperty(param1,param2);
         switch(param1)
         {
            case "innerRatio":
               _layoutInvalidateFlag = true;
               break;
            case "gap":
            case "labelRatio":
            case "lineWeigth":
            case "offset":
               invalidateDataParts();
         }
      }
      
      override public function get contentPaddingTop() : Number
      {
         return super.contentPaddingTop + PIE_PADDING_TOP;
      }
   }
}
