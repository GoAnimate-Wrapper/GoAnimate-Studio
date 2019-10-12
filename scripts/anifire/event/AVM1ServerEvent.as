package anifire.event
{
   public class AVM1ServerEvent extends ExtraDataEvent
   {
      
      public static const EVENT_COMMAND_RECEIVED:String = "event_command_received";
       
      
      private var _command:int;
      
      private var _param:Number;
      
      public function AVM1ServerEvent(param1:String, param2:Object, param3:Object = null, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param2,param3,param4,param5);
      }
      
      public function get command() : int
      {
         return this._command;
      }
      
      public function set command(param1:int) : void
      {
         this._command = param1;
      }
      
      public function get param() : Number
      {
         return this._param;
      }
      
      public function set param(param1:Number) : void
      {
         this._param = param1;
      }
   }
}
