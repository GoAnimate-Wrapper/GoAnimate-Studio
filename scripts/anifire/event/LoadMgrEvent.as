package anifire.event
{
   import flash.events.Event;
   
   public class LoadMgrEvent extends Event
   {
      
      public static const ALL_COMPLETE:String = "all_complete";
       
      
      public function LoadMgrEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      override public function clone() : Event
      {
         var _loc1_:LoadMgrEvent = new LoadMgrEvent(this.type,this.bubbles,this.cancelable);
         return _loc1_;
      }
   }
}
