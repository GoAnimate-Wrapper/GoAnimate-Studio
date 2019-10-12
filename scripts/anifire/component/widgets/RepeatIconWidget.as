package anifire.component.widgets
{
   import flash.utils.ByteArray;
   
   public class RepeatIconWidget extends IconWidget
   {
      
      public static const ICON_DIRECTION_TOP_LEFT_RIGHT:String = "topLeftRight";
      
      public static const ICON_DIRECTION_TOP_LEFT_DOWN:String = "topLeftDown";
      
      public static const ICON_DIRECTION_TOP_RIGHT_LEFT:String = "topRightLeft";
      
      public static const ICON_DIRECTION_TOP_RIGHT_DOWN:String = "topRightDown";
      
      public static const ICON_DIRECTION_BOTTOM_LEFT_UP:String = "bottomLeftUp";
      
      public static const ICON_DIRECTION_BOTTOM_LEFT_RIGHT:String = "bottomLeftRight";
      
      public static const ICON_DIRECTION_BOTTOM_RIGHT_UP:String = "bottomRightUp";
      
      public static const ICON_DIRECTION_BOTTOM_RIGHT_LEFT:String = "bottomRightLeft";
      
      public static const DEFAULT_ICON_DIRECTION:String = ICON_DIRECTION_TOP_LEFT_RIGHT;
       
      
      protected var _rows:int;
      
      protected var _columns:int;
      
      protected var _autoGrid:Boolean;
      
      protected var _iconInvalidateFlag:Boolean;
      
      protected var _iconCount:int;
      
      protected var _highlightCount:int;
      
      protected var _highlightArray:Array;
      
      protected var _remainderRatio:Number;
      
      protected var _remainderPart:IconWidgetPart;
      
      public function RepeatIconWidget()
      {
         super();
         updateIconImage("infographics","g4b_246.swf");
      }
      
      public function get rows() : int
      {
         return this._rows;
      }
      
      public function set rows(param1:int) : void
      {
         if(this._rows != param1)
         {
            this._rows = param1;
            this._iconInvalidateFlag = true;
            _layoutInvalidateFlag = true;
         }
      }
      
      public function get columns() : int
      {
         return this._columns;
      }
      
      public function set columns(param1:int) : void
      {
         if(this._columns != param1)
         {
            this._columns = param1;
            this._iconInvalidateFlag = true;
            _layoutInvalidateFlag = true;
         }
      }
      
      public function get autoGrid() : Boolean
      {
         return this._autoGrid;
      }
      
      public function set autoGrid(param1:Boolean) : void
      {
         if(this._autoGrid != param1)
         {
            this._autoGrid = param1;
            if(this._autoGrid)
            {
               this.updateAutoGrid();
            }
         }
      }
      
      protected function updateAutoGrid() : void
      {
         var _loc1_:int = 10;
         var _loc2_:int = 10;
         if(_counterMaxValue <= 40)
         {
            _loc1_ = Math.ceil(_counterMaxValue / 5);
            _loc2_ = 5;
         }
         else if(_counterMaxValue < 100)
         {
            _loc1_ = Math.ceil(_counterMaxValue / 10);
         }
         this.rows = _loc1_;
         this.columns = _loc2_;
      }
      
      override protected function init() : void
      {
         super.init();
         this._rows = 2;
         this._columns = 5;
         _gridGap = 4;
         this._iconInvalidateFlag = true;
      }
      
      override protected function createCounterParts() : void
      {
         this._remainderPart = createPart(null) as IconWidgetPart;
         addChild(this._remainderPart);
      }
      
      override protected function setIconSource(param1:ByteArray) : void
      {
         super.setIconSource(param1);
         this._remainderPart.loadIcon(_iconSource);
      }
      
      protected function createIconParts() : void
      {
         var _loc1_:int = 0;
         var _loc2_:IconWidgetPart = null;
         this._iconCount = this._rows * this._columns;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < this._iconCount)
         {
            if(_loc1_ < _dataParts.length)
            {
               _loc2_ = _dataParts[_loc1_] as IconWidgetPart;
            }
            else
            {
               _loc2_ = createPart(null) as IconWidgetPart;
               _loc2_.loadIcon(_iconSource);
               addPart(_loc2_);
            }
            _loc2_.gridWidth = _gridWidth;
            _loc2_.gridHeight = _gridHeight;
            _loc2_.row = _loc3_;
            _loc2_.column = _loc4_;
            _loc2_.iconColor = _styleModel.getColorByIndex(0);
            _loc4_++;
            if(_loc4_ >= this._columns)
            {
               _loc3_++;
               _loc4_ = 0;
            }
            _loc1_++;
         }
         _loc1_ = _dataParts.length - 1;
         while(_loc1_ >= this._iconCount)
         {
            removePartByIndex(_loc1_);
            _loc1_--;
         }
         setChildIndex(this._remainderPart,this._iconCount + 1);
      }
      
      protected function updateIconParts() : void
      {
         var _loc3_:IconWidgetPart = null;
         var _loc1_:int = this.updateHighlightArray();
         var _loc2_:int = 0;
         while(_loc2_ < this._iconCount)
         {
            _loc3_ = _dataParts[_loc2_] as IconWidgetPart;
            if(this._highlightArray[_loc2_] != true)
            {
               _loc3_.applyColorTransform(_styleModel.getColorByIndex(0));
            }
            else
            {
               _loc3_.removeColorTransform();
            }
            _loc3_.iconColor = _styleModel.getColorByIndex(1);
            _loc2_++;
         }
         if(this._remainderPart)
         {
            this._remainderPart.iconColor = _styleModel.getColorByIndex(1);
            this._remainderPart.row = _loc1_ / this._columns;
            this._remainderPart.column = _loc1_ % this._columns;
            this._remainderPart.applyMask(this._remainderRatio);
         }
      }
      
      override protected function updateCounterValue() : void
      {
         if(this._autoGrid)
         {
            this.updateAutoGrid();
         }
         var _loc1_:Number = getAnimationValue();
         var _loc2_:Number = _loc1_ / _counterMaxValue * this._iconCount;
         this._highlightCount = int(_loc2_);
         this._remainderRatio = _loc2_ - this._highlightCount;
         this.updateIconParts();
         updateCounterText();
      }
      
      protected function updateHighlightArray() : int
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc10_:int = 0;
         this._highlightArray = new Array(this._iconCount);
         switch(_iconDirection)
         {
            case ICON_DIRECTION_TOP_LEFT_RIGHT:
            case ICON_DIRECTION_TOP_LEFT_DOWN:
            default:
               _loc1_ = 0;
               _loc5_ = 1;
               _loc3_ = 0;
               _loc6_ = 1;
               break;
            case ICON_DIRECTION_BOTTOM_LEFT_RIGHT:
            case ICON_DIRECTION_BOTTOM_LEFT_UP:
               _loc1_ = this._rows - 1;
               _loc5_ = -1;
               _loc3_ = 0;
               _loc6_ = 1;
               break;
            case ICON_DIRECTION_TOP_RIGHT_DOWN:
            case ICON_DIRECTION_TOP_RIGHT_LEFT:
               _loc1_ = 0;
               _loc5_ = 1;
               _loc3_ = this._columns - 1;
               _loc6_ = -1;
               break;
            case ICON_DIRECTION_BOTTOM_RIGHT_LEFT:
            case ICON_DIRECTION_BOTTOM_RIGHT_UP:
               _loc1_ = this._rows - 1;
               _loc5_ = -1;
               _loc3_ = this._columns - 1;
               _loc6_ = -1;
         }
         var _loc9_:int = this._highlightCount;
         switch(_iconDirection)
         {
            case ICON_DIRECTION_TOP_LEFT_RIGHT:
            case ICON_DIRECTION_TOP_RIGHT_LEFT:
            case ICON_DIRECTION_BOTTOM_RIGHT_LEFT:
            case ICON_DIRECTION_BOTTOM_LEFT_RIGHT:
            default:
               _loc7_ = _loc1_;
               while(_loc7_ >= 0 && _loc7_ < this._rows)
               {
                  _loc8_ = _loc3_;
                  while(_loc8_ >= 0 && _loc8_ < this._columns)
                  {
                     _loc10_ = _loc7_ * this._columns + _loc8_;
                     _loc9_--;
                     if(_loc9_ == -1)
                     {
                        return _loc10_;
                     }
                     this._highlightArray[_loc10_] = true;
                     _loc8_ = _loc8_ + _loc6_;
                  }
                  _loc7_ = _loc7_ + _loc5_;
               }
               break;
            case ICON_DIRECTION_TOP_LEFT_DOWN:
            case ICON_DIRECTION_TOP_RIGHT_DOWN:
            case ICON_DIRECTION_BOTTOM_LEFT_UP:
            case ICON_DIRECTION_BOTTOM_RIGHT_UP:
               _loc8_ = _loc3_;
               while(_loc8_ >= 0 && _loc8_ < this._columns)
               {
                  _loc7_ = _loc1_;
                  while(_loc7_ >= 0 && _loc7_ < this._rows)
                  {
                     _loc10_ = _loc7_ * this._columns + _loc8_;
                     _loc9_--;
                     if(_loc9_ == -1)
                     {
                        return _loc10_;
                     }
                     this._highlightArray[_loc10_] = true;
                     _loc7_ = _loc7_ + _loc5_;
                  }
                  _loc8_ = _loc8_ + _loc6_;
               }
         }
         return 0;
      }
      
      override protected function updateLayout() : void
      {
         var _loc1_:Number = _basePart.contentBounds.width - (this._columns - 1) * _gridGap;
         _gridWidth = _loc1_ / this._columns;
         var _loc2_:Number = _basePart.contentBounds.height - (this._rows - 1) * _gridGap;
         _gridHeight = _loc2_ / this._rows;
         super.updateLayout();
         this._remainderPart.bounds = _basePart.contentBounds;
         this._remainderPart.gridWidth = _gridWidth;
         this._remainderPart.gridHeight = _gridHeight;
      }
      
      override protected function updateStyle() : void
      {
         if(_basePart)
         {
            _basePart.updateStyle();
         }
         this.updateIconParts();
      }
      
      override public function validate() : void
      {
         if(_layoutInvalidateFlag)
         {
            updateBasePartLayout();
            this.updateLayout();
            this.createIconParts();
            this.updateCounterValue();
            _layoutInvalidateFlag = false;
         }
         if(_basePart)
         {
            _basePart.validate();
         }
         this.validateDataParts();
      }
      
      override protected function validateDataParts() : void
      {
         this._remainderPart.validate();
         super.validateDataParts();
      }
      
      override public function set iconDirection(param1:String) : void
      {
         var _loc2_:int = 0;
         super.iconDirection = param1;
         switch(_iconDirection)
         {
            case ICON_DIRECTION_TOP_LEFT_RIGHT:
            case ICON_DIRECTION_BOTTOM_LEFT_RIGHT:
            default:
               _loc2_ = IconWidgetPart.FILL_DIRECTION_LEFT_TO_RIGHT;
               break;
            case ICON_DIRECTION_TOP_LEFT_DOWN:
            case ICON_DIRECTION_TOP_RIGHT_DOWN:
               _loc2_ = IconWidgetPart.FILL_DIRECTION_TOP_TO_BOTTOM;
               break;
            case ICON_DIRECTION_TOP_RIGHT_LEFT:
            case ICON_DIRECTION_BOTTOM_RIGHT_LEFT:
               _loc2_ = IconWidgetPart.FILL_DIRECTION_RIGHT_TO_LEFT;
               break;
            case ICON_DIRECTION_BOTTOM_LEFT_UP:
            case ICON_DIRECTION_BOTTOM_RIGHT_UP:
               _loc2_ = IconWidgetPart.FILL_DIRECTION_BOTTOM_TO_TOP;
         }
         this._remainderPart.fillDirection = _loc2_;
         this.updateIconParts();
      }
   }
}
