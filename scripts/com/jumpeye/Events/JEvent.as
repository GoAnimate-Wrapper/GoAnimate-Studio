package com.jumpeye.Events
{
   import flash.events.Event;
   
   public dynamic class JEvent extends Event
   {
       
      
      public function JEvent(param1:String)
      {
         super(param1);
      }
      
      override public function clone() : Event
      {
         return new JEvent(type);
      }
   }
}
