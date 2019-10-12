package Singularity.Events
{
   import flash.events.Event;
   
   public class SingularityEvent extends Event
   {
      
      public static const ERROR:String = "E";
      
      public static const WARNING:String = "W";
      
      public static const INIT:String = "I";
      
      public static const COMPLETE:String = "C";
      
      public static const ROLL_OVER:String = "OVR";
      
      public static const ROLL_OUT:String = "OUT";
      
      public static const SELECTED:String = "S";
      
      public static const ID:String = "ID";
       
      
      private var __type:String;
      
      private var __message:String;
      
      private var __class:String;
      
      private var __method:String;
      
      public function SingularityEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
         this.__type = param1;
         this.__message = "";
         this.__class = "";
         this.__method = "";
      }
      
      public function get classname() : String
      {
         return this.__class;
      }
      
      public function get methodname() : String
      {
         return this.__method;
      }
      
      public function get errType() : String
      {
         return this.__type;
      }
      
      public function set classname(param1:String) : void
      {
         if(param1 != "")
         {
            this.__class = param1;
         }
      }
      
      public function set methodname(param1:String) : void
      {
         if(param1 != "")
         {
            this.__method = param1;
         }
      }
      
      public function set message(param1:String) : void
      {
         if(param1 != "")
         {
            this.__message = param1;
         }
      }
      
      override public function clone() : Event
      {
         return new SingularityEvent(this.__type);
      }
      
      override public function toString() : String
      {
         return "From: " + this.__class + "::" + this.__method + " , message: " + this.__message;
      }
   }
}
