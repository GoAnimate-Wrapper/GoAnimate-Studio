package anifire.component.widgets
{
   import flash.display.Graphics;
   
   public class GroupBarChartBasePart extends WidgetBasePart
   {
      
      public static const AXIS_OVERSHOOT_RATIO:Number = 1.2;
       
      
      protected var _verticalAxis:Boolean;
      
      public function GroupBarChartBasePart()
      {
         super();
      }
      
      public function get verticalAxis() : Boolean
      {
         return this._verticalAxis;
      }
      
      public function set verticalAxis(param1:Boolean) : void
      {
         this._verticalAxis = param1;
         _invalidateFlag = true;
      }
      
      override protected function init() : void
      {
         super.init();
         _legendPart = new WidgetLegendPart();
         _legendPart.basePart = this;
         addChild(_legendPart);
      }
      
      override public function draw() : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc1_:Graphics = graphics;
         _loc1_.clear();
         if(_widgetMaker.displayAxis)
         {
            _loc2_ = _style.getNumericProperty("lineWeight");
            _loc3_ = _widgetMaker.easeOutBack(_animationFactor,AXIS_OVERSHOOT_RATIO);
            _loc4_ = _widgetMaker.maxValue - _widgetMaker.negativeMaxValue;
            _loc5_ = _widgetMaker.negativeMaxValue / _loc4_;
            _loc1_.lineStyle(_loc2_,_style.lineColor,1,false,"normal","none");
            if(this._verticalAxis)
            {
               _loc6_ = _contentBounds.x - _contentBounds.width * _loc5_;
               _loc1_.moveTo(_loc6_,_contentBounds.y);
               _loc1_.lineTo(_loc6_,_contentBounds.y + _contentBounds.height * _loc3_);
            }
            else
            {
               _loc7_ = _contentBounds.y + _contentBounds.height * (1 + _loc5_);
               _loc1_.moveTo(_contentBounds.x,_loc7_);
               _loc1_.lineTo(_contentBounds.x + _contentBounds.width * _loc3_,_loc7_);
            }
         }
      }
      
      override protected function updateLabelLayout() : void
      {
         _label.enableAutoSize(_bounds.width);
         switch(_style.titlePosition)
         {
            case "left":
               _label.x = _contentBounds.x;
               break;
            default:
               _label.x = _bounds.x + (_bounds.width - _label.width) * 0.5;
         }
         _label.y = _bounds.y;
      }
   }
}
