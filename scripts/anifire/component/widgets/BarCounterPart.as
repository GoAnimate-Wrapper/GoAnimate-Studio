package anifire.component.widgets
{
   public class BarCounterPart extends BarChartPart
   {
       
      
      public function BarCounterPart()
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
               case "vertical":
                  _label.rotation = 90;
                  _label.enableAutoSize(_bounds.height - 8,_bounds.width - 4);
                  _label.x = _bounds.x + (_bounds.width + _label.height) * 0.5;
                  _label.y = _bounds.y + _bounds.height - _label.width - 5;
                  break;
               case "bottom":
               default:
                  _label.rotation = 0;
                  _label.disableAutoSize();
                  _label.x = _bounds.x + (_bounds.width - _label.width) * 0.5;
                  _label.y = _bounds.y + _bounds.height + 5;
            }
         }
         else
         {
            _label.visible = false;
         }
      }
   }
}
