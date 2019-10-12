package anifire.event
{
   import flash.events.Event;
   
   public class WidgetEvent extends Event
   {
      
      public static const WIDGET_DATA_CHANGE:String = "widgetDataChange";
      
      public static const WIDGET_OPTION_CHANGE:String = "widgetOptionChange";
      
      public static const WIDGET_STYLE_CHANGE:String = "widgetStyleChange";
      
      public static const WIDGET_PROPERTY_CHANGE:String = "widgetPropertyChange";
      
      public static const WIDGET_RESIZED:String = "widgetResized";
      
      public static const WIDGET_ICON_LOAD_COMPLETE:String = "widgetIconLoadComplete";
      
      public static const WIDGET_SWAP_START:String = "widgetSwapStart";
      
      public static const WIDGET_SWAP_COMPLETE:String = "widgetSwapComplete";
      
      public static const WIDGET_AXIS_SWAP:String = "widgetAxisSwap";
       
      
      public function WidgetEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}
