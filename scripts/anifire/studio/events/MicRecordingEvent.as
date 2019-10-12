package anifire.studio.events
{
   import flash.events.Event;
   
   public class MicRecordingEvent extends Event
   {
      
      public static const START:String = "micRecordingStart";
      
      public static const STOP:String = "micRecordingStop";
      
      public static const DENIED:String = "micRecordingDenied";
      
      public static const APPROVED:String = "micRecordingApproved";
      
      public static const ACTIVITY:String = "micRecordingActivity";
      
      public static const OUT_OF_DATA:String = "micRecordingOutOfData";
       
      
      public var data:Object;
      
      public function MicRecordingEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}
