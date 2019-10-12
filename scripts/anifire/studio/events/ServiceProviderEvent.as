package anifire.studio.events
{
   import flash.events.Event;
   
   public class ServiceProviderEvent extends Event
   {
      
      public static const SERVICE_COMPLETE:String = "SERVICE_COMPLETE";
       
      
      public function ServiceProviderEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}
