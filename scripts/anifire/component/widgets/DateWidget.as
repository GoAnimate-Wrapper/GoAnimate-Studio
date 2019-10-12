package anifire.component.widgets
{
   import anifire.interfaces.IDateWidget;
   import anifire.models.widget.WidgetPartModel;
   import flash.geom.Rectangle;
   import flash.globalization.DateTimeFormatter;
   
   public class DateWidget extends WidgetMaker implements IDateWidget
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
      
      public function DateWidget()
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
         _bounds = new Rectangle(-60,-70,120,140);
         _contentPaddingTop = 30;
         _contentPaddingBottom = 0;
         _contentPaddingLeft = 0;
         _contentPaddingRight = 0;
         _minWidth = 80;
         this._currentDate = new Date();
         this._formatter = new DateTimeFormatter("en-US");
         this._formatter.setDateTimePattern("MMMM ");
         this._autoTitleDate = new Date();
         _layoutInvalidateFlag = true;
      }
      
      override protected function resetProperties() : void
      {
         super.resetProperties();
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
         _loc2_.bounds = _basePart.contentBounds;
         _loc2_.text = param1.labelText;
         _loc2_.value = param1.value;
         _loc2_.extraData = param1.extraData;
         return _loc2_;
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
         this.updateDate();
      }
      
      protected function updateDate() : void
      {
         var _loc1_:Date = this._currentDate;
         var _loc2_:Date = new Date(_loc1_.getFullYear(),_loc1_.month,1);
         this._startDay = _loc2_.getDay();
         var _loc3_:Date = new Date(_loc1_.getFullYear(),_loc1_.month + 1,0);
         this._totalDays = _loc3_.getDate();
         this._selectedDate = Math.max(Math.min(this._selectedDate,this._totalDays),1);
         var _loc4_:Vector.<WidgetPartModel> = new Vector.<WidgetPartModel>();
         var _loc5_:WidgetPartModel = new WidgetPartModel();
         _loc5_.labelText = String(this._selectedDate);
         _loc4_.push(_loc5_);
         super.updateModel(_loc4_);
      }
      
      override protected function updateBasePartLayout() : void
      {
         var _loc1_:CalendarBasePart = CalendarBasePart(_basePart);
         _loc1_.bounds = _bounds;
         _loc1_.updateDrawStyle(this._drawStyle);
      }
      
      override protected function updateAnimation() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:int = 0;
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
            _dataParts[_loc3_].alpha = _loc2_;
            _loc3_++;
         }
      }
      
      override public function setProperty(param1:String, param2:*) : void
      {
         super.setProperty(param1,param2);
         switch(param1)
         {
            case "drawStyle":
               this._drawStyle = param2;
               _layoutInvalidateFlag = true;
               invalidateDataParts();
               break;
            case "lineWeight":
            case "corner":
               _layoutInvalidateFlag = true;
               invalidateDataParts();
         }
      }
   }
}
