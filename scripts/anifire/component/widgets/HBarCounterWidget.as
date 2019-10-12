package anifire.component.widgets
{
   import anifire.models.widget.WidgetPartModel;
   import flash.geom.Rectangle;
   
   public class HBarCounterWidget extends CounterWidget
   {
       
      
      public function HBarCounterWidget()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         _bounds = new Rectangle(0,0,450,60);
         _minHeight = 10;
      }
      
      override protected function createPart(param1:WidgetPartModel) : WidgetPart
      {
         var _loc2_:HBarCounterPart = new HBarCounterPart();
         _loc2_.bounds = _basePart.contentBounds;
         _loc2_.counterMode = true;
         return _loc2_;
      }
      
      override protected function updateCounterValue() : void
      {
         _maxValue = _counterMaxValue;
         _backgroundPart.value = _counterMaxValue;
         var _loc1_:Number = getAnimationValue();
         _foregroundPart.value = _loc1_;
         updateCounterText();
      }
      
      override public function setProperty(param1:String, param2:*) : void
      {
         super.setProperty(param1,param2);
         switch(param1)
         {
            case "offset":
            case "border":
               invalidateDataParts();
               break;
            case "valuePosition":
               _foregroundPart.invalidate();
         }
      }
   }
}
