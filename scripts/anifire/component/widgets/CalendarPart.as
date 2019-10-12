package anifire.component.widgets
{
   public class CalendarPart extends WidgetPart
   {
      
      public static const ANIMATION_PHASE_1:Number = 0.4;
      
      public static const ANIMATION_PHASE_2:Number = 0.8;
       
      
      public function CalendarPart()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         _label = new WidgetLabel();
         _label.autoSize = true;
         addChild(_label);
      }
      
      override public function draw() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         graphics.clear();
         if(extraData == 1 && _animationFactor > 0)
         {
            if(_animationFactor < ANIMATION_PHASE_1)
            {
               _loc1_ = _animationFactor / ANIMATION_PHASE_1;
               _loc3_ = _loc1_;
               _loc2_ = _loc1_ * 1.2;
            }
            else if(_animationFactor < ANIMATION_PHASE_2)
            {
               _loc1_ = (_animationFactor - ANIMATION_PHASE_1) / (ANIMATION_PHASE_2 - ANIMATION_PHASE_1);
               _loc3_ = 1;
               _loc2_ = 1.2 - _loc1_ * 0.2;
            }
            else
            {
               _loc3_ = 1;
               _loc2_ = 1;
            }
            graphics.beginFill(_style.getColorByIndex(0),_loc3_);
            _loc4_ = Math.min(_bounds.width,_bounds.height) * 0.5;
            graphics.drawCircle(_bounds.x + _bounds.width * 0.5,_bounds.y + _bounds.height * 0.5,_loc4_ * _loc2_);
         }
         this.updateLabelColor();
      }
      
      override protected function updateLabelLayout() : void
      {
         _label.enableAutoSize(_bounds.width,_bounds.height);
         _label.x = _bounds.x + (_bounds.width - _label.width) * 0.5;
         _label.y = _bounds.y + (_bounds.height - _label.height) * 0.5;
      }
      
      override protected function updateLabelFormat() : void
      {
         super.updateLabelFormat();
         this.updateLabelColor();
      }
      
      protected function updateLabelColor() : void
      {
         if(value % 7 == 0)
         {
            _label.color = _style.dataColor;
            _label.alpha = 0.5;
         }
         else
         {
            _label.alpha = 1;
            if(extraData == 1)
            {
               _label.color = _style.titleColor;
            }
            else
            {
               _label.color = _style.dataColor;
            }
         }
      }
   }
}
