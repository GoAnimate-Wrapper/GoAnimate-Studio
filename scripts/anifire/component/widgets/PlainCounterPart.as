package anifire.component.widgets
{
   public class PlainCounterPart extends WidgetPart
   {
      
      public static const ANIMATION_PHASE_1:Number = 0.2;
      
      public static const ANIMATION_PHASE_2:Number = 0.4;
       
      
      public function PlainCounterPart()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         _label = new WidgetLabel();
         addChild(_label);
      }
      
      override public function draw() : void
      {
         var _loc1_:Number = NaN;
         if(_animationFactor < ANIMATION_PHASE_1)
         {
            _loc1_ = _animationFactor / ANIMATION_PHASE_1;
            _label.alpha = 0;
         }
         else if(_animationFactor < ANIMATION_PHASE_2)
         {
            _loc1_ = (_animationFactor - ANIMATION_PHASE_1) / (ANIMATION_PHASE_2 - ANIMATION_PHASE_1);
            _label.alpha = _loc1_;
         }
         else
         {
            _label.alpha = 1;
         }
      }
      
      override protected function updateLabelLayout() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         _loc1_ = _bounds.width;
         _loc2_ = _bounds.height;
         switch(_widgetMaker.getProperty("border"))
         {
            case "square":
            case "circle":
               _loc3_ = Math.min(_loc1_,_loc2_) * 0.707106781186548;
               _loc1_ = _loc3_;
               _loc2_ = _loc3_;
         }
         _label.enableAutoSize(_loc1_,_loc2_);
         switch(_widgetMaker.getProperty("valuePosition"))
         {
            case "left":
               _label.x = _bounds.x;
               break;
            case "right":
               _label.x = _bounds.x + _bounds.width - _label.width;
               break;
            default:
               _label.x = _bounds.x + (_bounds.width - _label.width) * 0.5;
         }
         _label.y = _bounds.y + (_bounds.height - _label.height) * 0.5;
      }
   }
}
