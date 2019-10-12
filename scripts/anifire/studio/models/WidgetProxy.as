package anifire.studio.models
{
   import anifire.component.widgets.WidgetConstants;
   import anifire.models.widget.WidgetPartModel;
   import anifire.models.widget.WidgetStyleModel;
   import anifire.studio.core.Widget;
   
   public class WidgetProxy
   {
       
      
      public var title:String;
      
      public var dataRanges:Vector.<String>;
      
      public var dataRows:Vector.<WidgetPartModel>;
      
      public var dataType:String;
      
      public var colorType:String;
      
      public var fontFamily:String;
      
      public var displayInPercentage:Boolean;
      
      public var displayDataLabel:Boolean;
      
      public var displayValueLabel:Boolean;
      
      public var displayAxis:Boolean;
      
      public var displayLegend:Boolean;
      
      public var swapAxis:Boolean;
      
      public var iconDirection:String;
      
      public var numberFormatType:int;
      
      public var propId:String;
      
      public var gridRows:int;
      
      public var gridColumns:int;
      
      public var autoGrid:Boolean;
      
      public var fontColor:uint;
      
      public var colorSchemeName:String;
      
      public var colorSet:Array;
      
      public var styleVariant:String;
      
      public function WidgetProxy()
      {
         super();
         this.init();
      }
      
      protected function init() : void
      {
         this.dataRanges = new Vector.<String>();
         this.dataRows = new Vector.<WidgetPartModel>();
         this.autoGrid = true;
      }
      
      public function storeWidgetSetting(param1:Widget) : void
      {
         var _loc2_:WidgetStyleModel = param1.styleModel;
         this.fontFamily = _loc2_.font;
         this.fontColor = _loc2_.color;
         this.colorSet = _loc2_.colorSet.concat();
         this.title = param1.title;
         this.displayInPercentage = param1.displayInPercentage;
         this.displayDataLabel = param1.displayDataLabel;
         this.displayValueLabel = param1.displayValueLabel;
         this.displayAxis = param1.displayAxis;
         this.displayLegend = param1.displayLegend;
         this.swapAxis = param1.swapAxis;
         this.iconDirection = param1.iconDirection;
         this.propId = param1.propId;
         this.gridRows = param1.gridRows;
         this.gridColumns = param1.gridColumns;
         this.autoGrid = param1.autoGrid;
         this.numberFormatType = param1.numberFormatType;
         this.styleVariant = param1.layoutStyleName;
         switch(param1.chartType)
         {
            case WidgetConstants.CHART_TYPE_BAR_CHART:
            case WidgetConstants.CHART_TYPE_LINE_CHART:
            case WidgetConstants.CHART_TYPE_AREA_CHART:
            case WidgetConstants.CHART_TYPE_BAR_CHART:
            case WidgetConstants.CHART_TYPE_HORI_BAR_CHART:
            case WidgetConstants.CHART_TYPE_GROUPED_BAR_CHART:
            case WidgetConstants.CHART_TYPE_HORI_GROUPED_BAR_CHART:
            case WidgetConstants.CHART_TYPE_CINEMATIC_BAR_CHART:
            case WidgetConstants.CHART_TYPE_CINEMATIC_HORI_BAR_CHART:
            case WidgetConstants.CHART_TYPE_CINEMATIC_LINE_CHART:
            case WidgetConstants.CHART_TYPE_CINEMATIC_AREA_CHART:
            case WidgetConstants.CHART_TYPE_PIE_CHART:
            case WidgetConstants.CHART_TYPE_RING_CHART:
               this.dataType = "chart";
               this.colorType = "full";
               break;
            case WidgetConstants.CHART_TYPE_PLAIN_COUNTER:
            case WidgetConstants.CHART_TYPE_BAR_COUNTER:
            case WidgetConstants.CHART_TYPE_HORI_BAR_COUNTER:
            case WidgetConstants.CHART_TYPE_PIE_COUNTER:
            case WidgetConstants.CHART_TYPE_RING_COUNTER:
            case WidgetConstants.CHART_TYPE_FILL_ICON:
            case WidgetConstants.CHART_TYPE_REPEAT_ICON:
               this.dataType = "counter";
               this.colorType = "two";
               break;
            case WidgetConstants.CHART_TYPE_MONTH_CALENDAR:
            case WidgetConstants.CHART_TYPE_DATE_CALENDAR:
               this.dataType = "calendar";
               this.colorType = "calendar";
         }
         this.storeDataRows(param1);
      }
      
      protected function storeDataRows(param1:Widget) : void
      {
         var _loc2_:Vector.<WidgetPartModel> = param1.dataRows;
         var _loc3_:int = _loc2_.length;
         this.dataRows.length = _loc3_;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            this.dataRows[_loc4_] = _loc2_[_loc4_].clone();
            _loc4_++;
         }
         if(param1.dataRanges)
         {
            this.dataRanges = param1.dataRanges.concat();
         }
         else
         {
            this.dataRanges = null;
         }
      }
      
      public function restoreDataRows(param1:Widget) : Boolean
      {
         var _loc2_:* = false;
         var _loc3_:int = 0;
         var _loc4_:Vector.<WidgetPartModel> = null;
         var _loc5_:int = 0;
         switch(param1.chartType)
         {
            case WidgetConstants.CHART_TYPE_BAR_CHART:
            case WidgetConstants.CHART_TYPE_LINE_CHART:
            case WidgetConstants.CHART_TYPE_AREA_CHART:
            case WidgetConstants.CHART_TYPE_BAR_CHART:
            case WidgetConstants.CHART_TYPE_HORI_BAR_CHART:
            case WidgetConstants.CHART_TYPE_GROUPED_BAR_CHART:
            case WidgetConstants.CHART_TYPE_HORI_GROUPED_BAR_CHART:
            case WidgetConstants.CHART_TYPE_CINEMATIC_BAR_CHART:
            case WidgetConstants.CHART_TYPE_CINEMATIC_HORI_BAR_CHART:
            case WidgetConstants.CHART_TYPE_CINEMATIC_LINE_CHART:
            case WidgetConstants.CHART_TYPE_CINEMATIC_AREA_CHART:
            case WidgetConstants.CHART_TYPE_PIE_CHART:
            case WidgetConstants.CHART_TYPE_RING_CHART:
               _loc2_ = this.dataType == "chart";
               break;
            case WidgetConstants.CHART_TYPE_PLAIN_COUNTER:
            case WidgetConstants.CHART_TYPE_BAR_COUNTER:
            case WidgetConstants.CHART_TYPE_HORI_BAR_COUNTER:
            case WidgetConstants.CHART_TYPE_PIE_COUNTER:
            case WidgetConstants.CHART_TYPE_RING_COUNTER:
            case WidgetConstants.CHART_TYPE_FILL_ICON:
            case WidgetConstants.CHART_TYPE_REPEAT_ICON:
               _loc2_ = this.dataType == "counter";
               break;
            case WidgetConstants.CHART_TYPE_MONTH_CALENDAR:
            case WidgetConstants.CHART_TYPE_DATE_CALENDAR:
               _loc2_ = this.dataType == "calendar";
         }
         if(_loc2_)
         {
            if(this.dataRanges)
            {
               param1.dataRanges = this.dataRanges.concat();
            }
            _loc4_ = param1.dataRows;
            _loc5_ = this.dataRows.length;
            _loc4_.length = _loc5_;
            _loc3_ = 0;
            while(_loc3_ < _loc5_)
            {
               _loc4_[_loc3_] = this.dataRows[_loc3_].clone();
               _loc3_++;
            }
            if(!param1.supportMultipleRanges)
            {
               _loc3_ = this.dataRanges.length - 1;
               while(_loc3_ > 0)
               {
                  param1.removeRangeAt(_loc3_);
                  _loc3_--;
               }
            }
         }
         return _loc2_;
      }
      
      public function restoreColor(param1:Widget) : void
      {
         var _loc2_:* = false;
         switch(param1.chartType)
         {
            case WidgetConstants.CHART_TYPE_BAR_CHART:
            case WidgetConstants.CHART_TYPE_LINE_CHART:
            case WidgetConstants.CHART_TYPE_AREA_CHART:
            case WidgetConstants.CHART_TYPE_BAR_CHART:
            case WidgetConstants.CHART_TYPE_HORI_BAR_CHART:
            case WidgetConstants.CHART_TYPE_GROUPED_BAR_CHART:
            case WidgetConstants.CHART_TYPE_HORI_GROUPED_BAR_CHART:
            case WidgetConstants.CHART_TYPE_PIE_CHART:
            case WidgetConstants.CHART_TYPE_RING_CHART:
               _loc2_ = this.colorType == "full";
               break;
            case WidgetConstants.CHART_TYPE_PLAIN_COUNTER:
            case WidgetConstants.CHART_TYPE_BAR_COUNTER:
            case WidgetConstants.CHART_TYPE_HORI_BAR_COUNTER:
            case WidgetConstants.CHART_TYPE_PIE_COUNTER:
            case WidgetConstants.CHART_TYPE_RING_COUNTER:
            case WidgetConstants.CHART_TYPE_FILL_ICON:
            case WidgetConstants.CHART_TYPE_REPEAT_ICON:
               _loc2_ = this.colorType == "two";
               break;
            case WidgetConstants.CHART_TYPE_MONTH_CALENDAR:
            case WidgetConstants.CHART_TYPE_DATE_CALENDAR:
               _loc2_ = this.colorType == "calendar";
         }
         if(_loc2_)
         {
            param1.styleModel.colorSet = this.colorSet;
         }
         param1.styleModel.color = this.fontColor;
      }
   }
}
