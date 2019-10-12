package anifire.component.widgets
{
   public class HBarCounterPart extends HBarChartPart
   {
       
      
      public function HBarCounterPart()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         _label.rotation = 0;
      }
      
      override protected function updateLabelLayout() : void
      {
         if(!_loading && (_widgetMaker.displayValueLabel || _widgetMaker.displayPercentageLabel))
         {
            _label.visible = true;
            switch(_widgetMaker.getProperty("valuePosition"))
            {
               case "left":
               default:
                  _label.disableAutoSize();
                  _label.x = _bounds.x - _label.width - 5;
                  _label.y = _bounds.y + (_bounds.height - _label.height) * 0.5;
                  break;
               case "inside":
                  _label.enableAutoSize(_bounds.width,_bounds.height - 6);
                  _label.x = _bounds.x + 4;
                  _label.y = _bounds.y + (_bounds.height - _label.height) * 0.5;
            }
         }
         else
         {
            _label.visible = false;
         }
      }
   }
}
