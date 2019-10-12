package anifire.component.widgets
{
   public class PlainCounterBasePart extends WidgetBasePart
   {
      
      public static const ANIMATION_PHASE:Number = 0.4;
       
      
      public function PlainCounterBasePart()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
      }
      
      override public function draw() : void
      {
         graphics.clear();
         var _loc1_:Number = Math.min(_bounds.width,_bounds.height);
         switch(_widgetMaker.getProperty("border"))
         {
            case "circle":
               graphics.lineStyle(3,_style.lineColor);
               graphics.drawCircle(_bounds.x + _bounds.width * 0.5,_bounds.y + _bounds.height * 0.5,_loc1_ * 0.5);
               graphics.endFill();
               break;
            case "square":
               graphics.lineStyle(3,_style.lineColor);
               graphics.drawRect(_bounds.x + (_bounds.width - _loc1_) * 0.5,_bounds.y + (_bounds.height - _loc1_) * 0.5,_loc1_,_loc1_);
               graphics.endFill();
               break;
            case "none":
            case "default":
         }
         var _loc2_:Number = _animationFactor / ANIMATION_PHASE;
         if(_loc2_ < 1)
         {
            scaleX = scaleY = _widgetMaker.easeOutBack(_loc2_,1.2);
         }
         else
         {
            scaleX = 1;
            scaleY = 1;
         }
         _label.alpha = _widgetMaker.easeOutQuad(_animationFactor);
      }
      
      override protected function updateLabelLayout() : void
      {
      }
   }
}
