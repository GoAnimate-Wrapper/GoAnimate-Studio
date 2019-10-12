package anifire.component.widgets
{
   public class PieChartBasePart extends WidgetBasePart
   {
       
      
      public function PieChartBasePart()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
      }
      
      override public function draw() : void
      {
         _label.enableAutoSize(_bounds.width,30);
         switch(_style.titlePosition)
         {
            case "inside":
               _label.x = _contentBounds.x + (_contentBounds.width - _label.width) * 0.5;
               _label.y = _contentBounds.y + (_contentBounds.height - _label.height) * 0.5;
               break;
            case "top":
            default:
               _label.x = _bounds.x + (_bounds.width - _label.width) * 0.5;
               _label.y = _bounds.y;
         }
      }
   }
}
