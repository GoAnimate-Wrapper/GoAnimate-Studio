package anifire.component.widgets
{
   import anifire.models.widget.WidgetPartModel;
   
   public class PieCounterWidget extends CounterWidget
   {
       
      
      public function PieCounterWidget()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         _innerPaddingLeft = 40;
         _innerPaddingRight = 40;
         _innerPaddingTop = 30;
         _innerPaddingBottom = 30;
         _labelPaddingBottom = 0;
         _minWidth = 130;
         _minHeight = 110;
         _basePartOnTop = true;
      }
      
      override protected function resetProperties() : void
      {
         super.resetProperties();
         _properties["startRatio"] = 0;
         _properties["innerRatio"] = 0;
         _properties["backgroundInner"] = 0;
         _properties["backgroundOuter"] = 0;
         _properties["foregroundInner"] = 0;
         _properties["foregroundOuter"] = 0;
         _properties["valueLabelRatio"] = 1.2;
         _properties["valuePosition"] = "outside";
      }
      
      override protected function createPart(param1:WidgetPartModel) : WidgetPart
      {
         var _loc2_:WidgetPart = new PieCounterPart();
         _loc2_.bounds = _basePart.contentBounds;
         return _loc2_;
      }
      
      override protected function updateCounterValue() : void
      {
         var _loc1_:Number = getAnimationValue();
         _foregroundPart.value = _loc1_;
         _backgroundPart.cumulatedValue = _loc1_;
         _backgroundPart.value = _counterMaxValue - _loc1_;
         _totalValue = _counterMaxValue;
         updateCounterText();
      }
      
      override public function setProperty(param1:String, param2:*) : void
      {
         super.setProperty(param1,param2);
         switch(param1)
         {
            case "valuePosition":
               _foregroundPart.invalidate();
               break;
            case "backgroundOuter":
            case "foregroundOuter":
               _layoutInvalidateFlag = true;
         }
      }
      
      override protected function updateLayout() : void
      {
         var _loc1_:PieCounterPart = PieCounterPart(_backgroundPart);
         _loc1_.innerRatio = Math.max(_properties["backgroundInner"],_properties["innerRatio"]);
         _loc1_.outerRatio = _properties["backgroundOuter"];
         var _loc2_:PieCounterPart = PieCounterPart(_foregroundPart);
         _loc2_.innerRatio = Math.max(_properties["foregroundInner"],_properties["innerRatio"]);
         _loc2_.outerRatio = _properties["foregroundOuter"];
         _backgroundPart.bounds = _basePart.contentBounds;
         _foregroundPart.bounds = _basePart.contentBounds;
      }
      
      override protected function updateStyle() : void
      {
         _layoutInvalidateFlag = true;
         super.updateStyle();
      }
   }
}
