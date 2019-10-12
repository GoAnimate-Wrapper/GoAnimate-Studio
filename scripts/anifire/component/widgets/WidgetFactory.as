package anifire.component.widgets
{
   public class WidgetFactory
   {
       
      
      public function WidgetFactory()
      {
         super();
      }
      
      public static function createWidgetMaker(param1:String) : WidgetMaker
      {
         var _loc2_:WidgetMaker = null;
         switch(param1)
         {
            case WidgetConstants.CHART_TYPE_BAR_CHART:
            default:
               _loc2_ = new BarChartWidget();
               break;
            case WidgetConstants.CHART_TYPE_HORI_BAR_CHART:
               _loc2_ = new HBarChartWidget();
               break;
            case WidgetConstants.CHART_TYPE_GROUPED_BAR_CHART:
               _loc2_ = new GroupBarChartWidget();
               break;
            case WidgetConstants.CHART_TYPE_HORI_GROUPED_BAR_CHART:
               _loc2_ = new GroupHBarChartWidget();
               break;
            case WidgetConstants.CHART_TYPE_CINEMATIC_BAR_CHART:
               _loc2_ = new CinematicBarChartWidget();
               break;
            case WidgetConstants.CHART_TYPE_CINEMATIC_HORI_BAR_CHART:
               _loc2_ = new CinematicHBarChartWidget();
               break;
            case WidgetConstants.CHART_TYPE_PIE_CHART:
            case WidgetConstants.CHART_TYPE_RING_CHART:
               _loc2_ = new PieChartWidget();
               break;
            case WidgetConstants.CHART_TYPE_LINE_CHART:
               _loc2_ = new LineChartWidget();
               break;
            case WidgetConstants.CHART_TYPE_CINEMATIC_LINE_CHART:
               _loc2_ = new CinematicLineChartWidget();
               break;
            case WidgetConstants.CHART_TYPE_AREA_CHART:
               _loc2_ = new AreaChartWidget();
               break;
            case WidgetConstants.CHART_TYPE_CINEMATIC_AREA_CHART:
               _loc2_ = new CinematicAreaChartWidget();
               break;
            case WidgetConstants.CHART_TYPE_PLAIN_COUNTER:
               _loc2_ = new PlainCounterWidget();
               break;
            case WidgetConstants.CHART_TYPE_BAR_COUNTER:
               _loc2_ = new BarCounterWidget();
               break;
            case WidgetConstants.CHART_TYPE_HORI_BAR_COUNTER:
               _loc2_ = new HBarCounterWidget();
               break;
            case WidgetConstants.CHART_TYPE_PIE_COUNTER:
            case WidgetConstants.CHART_TYPE_RING_COUNTER:
               _loc2_ = new PieCounterWidget();
               break;
            case WidgetConstants.CHART_TYPE_REPEAT_ICON:
               _loc2_ = new RepeatIconWidget();
               break;
            case WidgetConstants.CHART_TYPE_FILL_ICON:
               _loc2_ = new FillIconWidget();
               break;
            case WidgetConstants.CHART_TYPE_DATE_CALENDAR:
               _loc2_ = new DateWidget();
               break;
            case WidgetConstants.CHART_TYPE_MONTH_CALENDAR:
               _loc2_ = new CalendarWidget();
         }
         return _loc2_;
      }
   }
}
