package anifire.studio.events
{
   import anifire.event.ExtraDataEvent;
   import flash.events.Event;
   
   public class LoadCcCharCountEvent extends ExtraDataEvent
   {
      
      public static const CC_CHAR_COUNT_GOT:String = "cc_char_count_got";
       
      
      public var ccCharCount:int;
      
      public function LoadCcCharCountEvent(param1:String, param2:Object, param3:Object = null, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param2,param3,param4,param5);
      }
      
      override public function clone() : Event
      {
         var _loc1_:LoadCcCharCountEvent = new LoadCcCharCountEvent(this.type,this.getEventCreater(),this.getData(),this.bubbles,this.cancelable);
         _loc1_.ccCharCount = this.ccCharCount;
         return _loc1_;
      }
   }
}
