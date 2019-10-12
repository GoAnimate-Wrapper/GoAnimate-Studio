package anifire.event
{
   import flash.events.Event;
   
   public class FlowFrameMakerEvent extends Event
   {
      
      public static const RESIZE_BY_INNER_IMAGE:String = "resizeByInnerImage";
      
      public static const INNER_IMAGE_AUTO_LAYOUT:String = "innerImageAutoLayout";
      
      public static const LOAD_IMAGE_COMPLETE:String = "loadImageComplete";
       
      
      public function FlowFrameMakerEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}
