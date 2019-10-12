package anifire.component.widgets
{
   import anifire.models.widget.WidgetPartModel;
   import flash.geom.Rectangle;
   
   public class PlainCounterWidget extends CounterWidget
   {
       
      
      public function PlainCounterWidget()
      {
         super();
      }
      
      override public function set title(param1:String) : void
      {
      }
      
      override protected function createBasePart() : WidgetBasePart
      {
         return new PlainCounterBasePart();
      }
      
      override protected function init() : void
      {
         super.init();
         _counterDelay = 0.2;
         _bounds = new Rectangle(-25,-25,50,50);
         _properties["valuePosition"] = "right";
      }
      
      override protected function createCounterParts() : void
      {
         _foregroundPart = this.createPart(null);
         addPart(_foregroundPart);
      }
      
      override protected function createPart(param1:WidgetPartModel) : WidgetPart
      {
         var _loc2_:WidgetPart = new PlainCounterPart();
         _loc2_.bounds = _bounds.clone();
         return _loc2_;
      }
      
      override protected function updateCounterValue() : void
      {
         this.updateCounterText();
      }
      
      override protected function updateCounterText() : void
      {
         var _loc1_:Number = getAnimationValue();
         var _loc2_:String = formatValue(_loc1_);
         if(displayPercentageLabel)
         {
            _foregroundPart.text = _loc2_ + "%";
         }
         else
         {
            _foregroundPart.text = _loc2_;
         }
      }
      
      override protected function updateAnimation() : void
      {
         super.updateAnimation();
         _basePart.animationFactor = _animationFactor;
         _foregroundPart.animationFactor = _animationFactor;
      }
   }
}
