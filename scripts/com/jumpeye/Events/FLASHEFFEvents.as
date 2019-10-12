package com.jumpeye.Events
{
   import flash.events.Event;
   
   public dynamic class FLASHEFFEvents extends Event
   {
      
      public static const ROLL_OUT:String = "onRollOut";
      
      public static const INIT:String = "init";
      
      public static const TRANSITION_END:String = "onTransitionEnd";
      
      public static const MOUSE_UP:String = "onMouseUp";
      
      public static const ROLL_OVER:String = "onRollOver";
      
      public static const TRANSITION_START:String = "onTransitionStart";
      
      public static const COMPLETE:String = "complete";
      
      public static const DOUBLE_CLICK:String = "onDoubleClick";
      
      public static const MOUSE_DOWN:String = "onMouseDown";
       
      
      public function FLASHEFFEvents(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      override public function toString() : String
      {
         return formatToString("FLASHEFFEvents","type","bubbles","cancelable");
      }
      
      override public function clone() : Event
      {
         return new FLASHEFFEvents(type,bubbles,cancelable);
      }
   }
}
