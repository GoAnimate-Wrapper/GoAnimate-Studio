package anifire.component.widgets
{
   public class CounterBasePart extends WidgetBasePart
   {
       
      
      public function CounterBasePart()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
      }
      
      override protected function updateLabelLayout() : void
      {
         switch(_style.titlePosition)
         {
            case "middle":
               _label.x = _bounds.x + (_bounds.width - _label.width) * 0.5;
               _label.y = _bounds.y + (_bounds.height - _label.height) * 0.5;
               break;
            default:
               _label.x = _bounds.x + (_bounds.width - _label.width) * 0.5;
               _label.y = _bounds.y - _label.height - 5;
         }
      }
   }
}
