package anifire.event
{
   import flash.events.Event;
   
   public class ByteLoaderEvent extends Event
   {
      
      public static const LOAD_BYTES_COMPLETE:String = "load_bytes_complete";
       
      
      public function ByteLoaderEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      override public function clone() : Event
      {
         return new ByteLoaderEvent(this.type,this.bubbles,this.cancelable);
      }
   }
}
