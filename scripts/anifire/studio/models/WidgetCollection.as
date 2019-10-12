package anifire.studio.models
{
   import anifire.component.widgets.WidgetConstants;
   import anifire.studio.core.WidgetThumb;
   
   public class WidgetCollection extends ProductCollection
   {
       
      
      protected var _targetCategory:String;
      
      public function WidgetCollection(param1:String, param2:Array = null)
      {
         super(param1,param2);
      }
      
      override public function sortProducts() : void
      {
      }
      
      public function get targetCategory() : String
      {
         return this._targetCategory;
      }
      
      protected function compatibleWithType(param1:String) : Boolean
      {
         var _loc2_:* = false;
         switch(param1)
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
               _loc2_ = this._targetCategory == "chart";
               break;
            case WidgetConstants.CHART_TYPE_PLAIN_COUNTER:
            case WidgetConstants.CHART_TYPE_BAR_COUNTER:
            case WidgetConstants.CHART_TYPE_HORI_BAR_COUNTER:
            case WidgetConstants.CHART_TYPE_PIE_COUNTER:
            case WidgetConstants.CHART_TYPE_RING_COUNTER:
            case WidgetConstants.CHART_TYPE_FILL_ICON:
            case WidgetConstants.CHART_TYPE_REPEAT_ICON:
               _loc2_ = this._targetCategory == "counter";
               break;
            case WidgetConstants.CHART_TYPE_MONTH_CALENDAR:
            case WidgetConstants.CHART_TYPE_DATE_CALENDAR:
               _loc2_ = this._targetCategory == "calendar";
         }
         return _loc2_;
      }
      
      public function includeCategory(param1:String) : void
      {
         this._targetCategory = param1;
         filterFunction = this.includeFilterFunction;
         refresh();
      }
      
      public function excludeCategory(param1:String) : void
      {
         this._targetCategory = param1;
         filterFunction = this.excludeFilterFunction;
         refresh();
      }
      
      protected function includeFilterFunction(param1:Object) : Boolean
      {
         var _loc3_:WidgetThumb = null;
         var _loc2_:ThumbModel = param1 as ThumbModel;
         if(_loc2_)
         {
            _loc3_ = _loc2_.thumb as WidgetThumb;
            if(_loc3_)
            {
               return this.compatibleWithType(_loc3_.chartType);
            }
         }
         return false;
      }
      
      protected function excludeFilterFunction(param1:Object) : Boolean
      {
         var _loc3_:WidgetThumb = null;
         var _loc2_:ThumbModel = param1 as ThumbModel;
         if(_loc2_)
         {
            _loc3_ = _loc2_.thumb as WidgetThumb;
            if(_loc3_)
            {
               return !this.compatibleWithType(_loc3_.chartType);
            }
         }
         return false;
      }
   }
}
