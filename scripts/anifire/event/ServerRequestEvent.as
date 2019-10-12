package anifire.event
{
   import flash.events.Event;
   
   public class ServerRequestEvent extends Event
   {
      
      public static const COMPLETE:String = "complete";
      
      public static const FAIL:String = "fail";
       
      
      public var data:Object;
      
      public var message:String;
      
      public function ServerRequestEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}
