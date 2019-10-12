package anifire.component.widgets
{
   public class FillIconWidget extends IconWidget
   {
      
      public static const ICON_DIRECTION_BOTTOM_TOP:String = "bottomTop";
      
      public static const ICON_DIRECTION_TOP_BOTTOM:String = "topBottom";
      
      public static const ICON_DIRECTION_LEFT_RIGHT:String = "leftRight";
      
      public static const ICON_DIRECTION_RIGHT_LEFT:String = "rightLeft";
      
      public static const ICON_DIRECTION_TO_TOP_LEFT:String = "toTopLeft";
      
      public static const ICON_DIRECTION_TO_TOP_RIGHT:String = "toTopRight";
      
      public static const ICON_DIRECTION_TO_BOTTOM_LEFT:String = "toBottomLeft";
      
      public static const ICON_DIRECTION_TO_BOTTOM_RIGHT:String = "toBottomRight";
      
      public static const DEFAULT_ICON_DIRECTION:String = ICON_DIRECTION_BOTTOM_TOP;
       
      
      public function FillIconWidget()
      {
         super();
      }
      
      override protected function createCounterParts() : void
      {
         _backgroundPart = createPart(null);
         addPart(_backgroundPart);
         _foregroundPart = createPart(null);
         IconWidgetPart(_foregroundPart).fillDirection = IconWidgetPart.FILL_DIRECTION_BOTTOM_TO_TOP;
         addPart(_foregroundPart);
         updateIconImage("infographics","g4b_003.swf");
      }
      
      override protected function updateCounterValue() : void
      {
         var _loc1_:Number = getAnimationValue() / _counterMaxValue;
         (_foregroundPart as IconWidgetPart).applyMask(_loc1_);
         updateCounterText();
      }
      
      override protected function updateLayout() : void
      {
         var _loc2_:IconWidgetPart = null;
         var _loc1_:int = 0;
         while(_loc1_ < _dataPartCount)
         {
            _loc2_ = _dataParts[_loc1_] as IconWidgetPart;
            _loc2_.bounds = _basePart.contentBounds;
            _loc2_.gridWidth = _basePart.contentBounds.width;
            _loc2_.gridHeight = _basePart.contentBounds.height;
            _loc1_++;
         }
      }
      
      override protected function updateStyle() : void
      {
         if(_basePart)
         {
            _basePart.updateStyle();
         }
         if(_backgroundPart)
         {
            IconWidgetPart(_backgroundPart).applyColorTransform(_styleModel.getColorByIndex(0));
         }
         if(_foregroundPart)
         {
            IconWidgetPart(_foregroundPart).iconColor = _styleModel.getColorByIndex(1);
         }
      }
      
      override public function validate() : void
      {
         if(_layoutInvalidateFlag)
         {
            updateBasePartLayout();
            this.updateLayout();
            this.updateCounterValue();
            _layoutInvalidateFlag = false;
         }
         if(_basePart)
         {
            _basePart.validate();
         }
         validateDataParts();
      }
      
      override public function set iconDirection(param1:String) : void
      {
         var _loc2_:int = 0;
         super.iconDirection = param1;
         switch(_iconDirection)
         {
            case ICON_DIRECTION_BOTTOM_TOP:
            default:
               _loc2_ = IconWidgetPart.FILL_DIRECTION_BOTTOM_TO_TOP;
               break;
            case ICON_DIRECTION_TOP_BOTTOM:
               _loc2_ = IconWidgetPart.FILL_DIRECTION_TOP_TO_BOTTOM;
               break;
            case ICON_DIRECTION_LEFT_RIGHT:
               _loc2_ = IconWidgetPart.FILL_DIRECTION_LEFT_TO_RIGHT;
               break;
            case ICON_DIRECTION_RIGHT_LEFT:
               _loc2_ = IconWidgetPart.FILL_DIRECTION_RIGHT_TO_LEFT;
               break;
            case ICON_DIRECTION_TO_TOP_LEFT:
               _loc2_ = IconWidgetPart.FILL_DIRECTION_TO_TOP_LEFT;
               break;
            case ICON_DIRECTION_TO_TOP_RIGHT:
               _loc2_ = IconWidgetPart.FILL_DIRECTION_TO_TOP_RIGHT;
               break;
            case ICON_DIRECTION_TO_BOTTOM_LEFT:
               _loc2_ = IconWidgetPart.FILL_DIRECTION_TO_BOTTOM_LEFT;
               break;
            case ICON_DIRECTION_TO_BOTTOM_RIGHT:
               _loc2_ = IconWidgetPart.FILL_DIRECTION_TO_BOTTOM_RIGHT;
         }
         var _loc3_:IconWidgetPart = _foregroundPart as IconWidgetPart;
         _loc3_.fillDirection = _loc2_;
      }
   }
}
