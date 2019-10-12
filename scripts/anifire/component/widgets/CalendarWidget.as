package anifire.component.widgets
{
   import anifire.interfaces.IDateRangeWidget;
   import anifire.models.widget.WidgetPartModel;
   import flash.geom.Rectangle;
   import flash.globalization.DateTimeFormatter;
   
   public class CalendarWidget extends WidgetMaker implements IDateRangeWidget
   {
      
      public static const ANIMATION_PHASE_1:Number = 0.2;
      
      public static const ANIMATION_PHASE_2:Number = 0.4;
       
      
      protected var _startDay:int;
      
      protected var _totalDays:int;
      
      protected var _formatter:DateTimeFormatter;
      
      protected var _autoTitleDate:Date;
      
      protected var _drawStyle:String;
      
      private var _monthArray:Array;
      
      protected var _currentDate:Date;
      
      protected var _selectedDate:int;
      
      protected var _selectedDateEnd:int;
      
      protected var _gridWidth:Number;
      
      protected var _gridHeight:Number;
      
      public function CalendarWidget()
      {
         this._monthArray = new Array("January","February","March","April","May","June","July","August","September","October","November","December");
         super();
      }
      
      public function get currentDate() : Date
      {
         return this._currentDate;
      }
      
      public function set currentDate(param1:Date) : void
      {
         if(param1 != this._currentDate)
         {
            this._currentDate = param1;
            this.updateBasePartText();
            this.updateDate();
         }
      }
      
      public function get selectedDate() : int
      {
         return this._selectedDate;
      }
      
      public function set selectedDate(param1:int) : void
      {
         if(this._selectedDate != param1)
         {
            this._selectedDate = param1;
            this.updateDate();
         }
      }
      
      public function get selectedDateEnd() : int
      {
         return this._selectedDateEnd;
      }
      
      public function set selectedDateEnd(param1:int) : void
      {
         if(this._selectedDateEnd != param1)
         {
            this._selectedDateEnd = param1;
            this.updateDate();
         }
      }
      
      public function get gridWidth() : Number
      {
         return this._gridWidth;
      }
      
      public function set gridWidth(param1:Number) : void
      {
         this._gridWidth = param1;
         _layoutInvalidateFlag = true;
      }
      
      public function get gridHeight() : Number
      {
         return this._gridHeight;
      }
      
      public function set gridHeight(param1:Number) : void
      {
         this._gridHeight = param1;
         _layoutInvalidateFlag = true;
      }
      
      override public function set title(param1:String) : void
      {
         _title = param1;
         this.updateBasePartText();
      }
      
      protected function updateBasePartText() : void
      {
         if(_title)
         {
            _basePart.text = _title;
         }
         else
         {
            _basePart.text = this.getAutoTitle();
         }
      }
      
      public function getAutoTitle() : String
      {
         this._autoTitleDate.month = this._currentDate.month;
         return this._monthArray[this._autoTitleDate.month] + " " + this._currentDate.fullYear;
      }
      
      override protected function init() : void
      {
         super.init();
         _bounds = new Rectangle(0,0,160,140);
         _contentPaddingTop = 40;
         _contentPaddingBottom = 0;
         _contentPaddingLeft = 0;
         _contentPaddingRight = 0;
         this._gridWidth = 30;
         this._gridHeight = 30;
         _minWidth = 100;
         _minHeight = 80;
         this._currentDate = new Date();
         this._selectedDate = 0;
         this._selectedDateEnd = 0;
         this._formatter = new DateTimeFormatter("en-US");
         this._formatter.setDateTimePattern("MMMM ");
         this._autoTitleDate = new Date();
         _layoutInvalidateFlag = true;
      }
      
      override protected function resetProperties() : void
      {
         super.resetProperties();
         _properties["overlapRatio"] = 0;
         _properties["corner"] = 0;
         _properties["marker"] = "circle";
         this._drawStyle = "normal";
      }
      
      override protected function initBasePart() : void
      {
         super.initBasePart();
      }
      
      override protected function createBasePart() : WidgetBasePart
      {
         return new CalendarBasePart();
      }
      
      override protected function createPart(param1:WidgetPartModel) : WidgetPart
      {
         var _loc2_:WidgetPart = new CalendarPart();
         _loc2_.text = param1.labelText;
         _loc2_.value = param1.value;
         _loc2_.extraData = param1.extraData;
         return _loc2_;
      }
      
      override public function addPart(param1:WidgetPart) : void
      {
         super.addPart(param1);
         _layoutInvalidateFlag = true;
      }
      
      override public function removePartByIndex(param1:int) : void
      {
         super.removePartByIndex(param1);
         _layoutInvalidateFlag = true;
      }
      
      override protected function updateBasePartLayout() : void
      {
         var _loc1_:CalendarBasePart = CalendarBasePart(_basePart);
         _loc1_.bounds = _bounds;
         _loc1_.updateDrawStyle(this._drawStyle);
      }
      
      override protected function updateLayout() : void
      {
         var _loc15_:Number = NaN;
         if(!_basePart)
         {
            return;
         }
         var _loc1_:Number = 5;
         var _loc2_:Number = _basePart.contentBounds.width - _loc1_ * 2;
         var _loc3_:Number = _basePart.contentBounds.x + _loc1_;
         var _loc4_:Number = _loc2_ / 7;
         var _loc5_:Number = Math.ceil((this._startDay + this._totalDays) / 7);
         var _loc6_:Number = 5;
         var _loc7_:Number = _basePart.contentBounds.height - _loc6_ * 2;
         var _loc8_:Number = _basePart.contentBounds.y + _loc6_;
         var _loc9_:Number = _loc7_ / _loc5_;
         var _loc10_:Number = _loc3_;
         var _loc11_:Number = _loc8_;
         var _loc12_:int = this._startDay;
         var _loc13_:Number = _loc11_ + _loc9_;
         var _loc14_:int = 0;
         while(_loc14_ < _dataPartCount)
         {
            _loc10_ = _loc3_ + _loc12_ * _loc4_;
            _loc15_ = _loc10_ + _loc4_;
            _dataParts[_loc14_].updateBounds(int(_loc3_ + _loc12_ * _loc4_),int(_loc11_),int(_loc15_ - _loc10_),int(_loc13_ - _loc11_));
            _loc12_++;
            if(_loc12_ >= 7)
            {
               _loc12_ = 0;
               _loc11_ = _loc13_;
               _loc13_ = _loc13_ + _loc9_;
            }
            _loc14_++;
         }
      }
      
      override protected function updateAnimation() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:int = 0;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         _basePart.animationFactor = _animationFactor;
         if(_animationFactor < ANIMATION_PHASE_1)
         {
            _loc1_ = _animationFactor / ANIMATION_PHASE_1;
            _loc2_ = 0;
         }
         else if(_animationFactor < ANIMATION_PHASE_2)
         {
            _loc1_ = (_animationFactor - ANIMATION_PHASE_1) / (ANIMATION_PHASE_2 - ANIMATION_PHASE_1);
            _loc2_ = _loc1_;
         }
         else
         {
            _loc2_ = 1;
         }
         _loc3_ = 0;
         while(_loc3_ < _dataPartCount)
         {
            _dataParts[_loc3_].animationFactor = 0;
            _dataParts[_loc3_].alpha = _loc2_;
            _loc3_++;
         }
         var _loc4_:int = this._selectedDateEnd;
         if(_loc4_ == 0)
         {
            _loc4_ = this._selectedDate;
         }
         var _loc5_:int = _loc4_ - this._selectedDate + 1;
         if(_loc5_ > 0 && this._selectedDate != 0)
         {
            _loc6_ = getProperty("overlapRatio") * (_loc5_ - 1);
            _loc7_ = 0.4;
            _loc8_ = (0.6 + _loc6_) / _loc5_;
            _loc3_ = this._selectedDate - 1;
            while(_loc3_ < _loc4_)
            {
               if(_animationFactor < _loc7_)
               {
                  _dataParts[_loc3_].animationFactor = 0;
               }
               else if(_animationFactor >= _loc7_ + _loc8_)
               {
                  _dataParts[_loc3_].animationFactor = 1;
               }
               else
               {
                  _dataParts[_loc3_].animationFactor = easeOutQuad((_animationFactor - _loc7_) / _loc8_);
               }
               _loc7_ = _loc7_ + _loc8_;
               if(_dataPartCount > 1)
               {
                  _loc7_ = _loc7_ - _loc6_ / (_loc5_ - 1);
               }
               _loc3_++;
            }
         }
      }
      
      override public function updateModel(param1:Vector.<WidgetPartModel>) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         if(param1.length >= 2)
         {
            _loc2_ = param1[0].value;
            _loc3_ = param1[1].value - 1;
            if(_loc3_ > 11)
            {
               _loc3_ = 11;
            }
            else if(_loc3_ < 0)
            {
               _loc3_ = 0;
            }
            this.currentDate = new Date(_loc2_,_loc3_);
         }
         if(param1.length >= 3)
         {
            this._selectedDate = param1[2].value;
         }
         if(param1.length >= 4)
         {
            this._selectedDateEnd = param1[3].value;
         }
         else
         {
            this._selectedDateEnd = this._selectedDate;
         }
         this.updateDate();
      }
      
      protected function updateDate() : void
      {
         var _loc7_:WidgetPartModel = null;
         var _loc1_:Date = this._currentDate;
         var _loc2_:Date = new Date(_loc1_.getFullYear(),_loc1_.month,1);
         this._startDay = _loc2_.getDay();
         var _loc3_:Date = new Date(_loc1_.getFullYear(),_loc1_.month + 1,0);
         this._totalDays = _loc3_.getDate();
         var _loc4_:Vector.<WidgetPartModel> = new Vector.<WidgetPartModel>();
         var _loc5_:int = this._selectedDateEnd;
         if(_loc5_ == 0)
         {
            _loc5_ = this._selectedDate;
         }
         var _loc6_:int = 0;
         while(_loc6_ < this._totalDays)
         {
            _loc7_ = new WidgetPartModel();
            _loc7_.labelText = String(_loc6_ + 1);
            _loc7_.value = (this._startDay + _loc6_) % 7;
            if(_loc6_ >= this._selectedDate - 1 && _loc6_ < _loc5_)
            {
               _loc7_.extraData = 1;
            }
            _loc4_.push(_loc7_);
            _loc6_++;
         }
         super.updateModel(_loc4_);
      }
      
      override public function setProperty(param1:String, param2:*) : void
      {
         super.setProperty(param1,param2);
         switch(param1)
         {
            case "drawStyle":
               this._drawStyle = param2;
               _layoutInvalidateFlag = true;
               break;
            case "lineWeight":
            case "corner":
               _layoutInvalidateFlag = true;
               invalidateDataParts();
         }
      }
   }
}
