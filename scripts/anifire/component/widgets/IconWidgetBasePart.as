package anifire.component.widgets
{
   public class IconWidgetBasePart extends WidgetBasePart
   {
       
      
      public function IconWidgetBasePart()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
      }
      
      override protected function updateLabelFormat() : void
      {
         super.updateLabelFormat();
         _label.color = _style.dataColor;
      }
      
      override protected function updateLabelLayout() : void
      {
         _label.enableAutoSize(_bounds.width,30);
         switch(_style.titlePosition)
         {
            case "top":
               _label.x = _contentBounds.x + (_contentBounds.width - _label.width) * 0.5;
               _label.y = (_bounds.y + _contentBounds.y - _label.height) * 0.5;
               break;
            case "bottom":
            default:
               _label.x = _bounds.x + (_bounds.width - _label.width) * 0.5;
               _label.y = (_bounds.y + _bounds.height + _contentBounds.y + _contentBounds.height - _label.height) * 0.5;
         }
      }
   }
}
