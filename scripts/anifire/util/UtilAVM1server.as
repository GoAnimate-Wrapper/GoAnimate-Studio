package anifire.util
{
   import anifire.constant.AnimeConstants;
   import anifire.event.AVM1ServerEvent;
   import flash.display.AVM1Movie;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class UtilAVM1server implements IEventDispatcher
   {
      
      private static var INTERFACE_COMMAND_FROM_AVM1:String = "x";
      
      private static var INTERFACE_COMMAND_FROM_AVM2:String = "y";
      
      private static var INTERFACE_PARAM_FROM_AVM1:String = "scaleX";
      
      private static var INTERFACE_PARAM_FROM_AVM2:String = "scaleY";
      
      private static var COMMAND_NULL:Number = 0;
      
      private static var PARAM_NULL:Number = 0;
       
      
      private var _avm1movie:AVM1Movie;
      
      private var _eventDispatcher:Timer;
      
      private var _commandPool:Array;
      
      public function UtilAVM1server()
      {
         this._commandPool = new Array();
         super();
         this._eventDispatcher = new Timer(1 / AnimeConstants.FRAME_PER_SEC * 1000 * 1);
      }
      
      public function openConnection(param1:AVM1Movie) : void
      {
         this._avm1movie = param1;
         this._avm1movie[INTERFACE_COMMAND_FROM_AVM2] = COMMAND_NULL;
         this._avm1movie[INTERFACE_COMMAND_FROM_AVM1] = COMMAND_NULL;
         this._eventDispatcher.addEventListener(TimerEvent.TIMER,this.pollCommand);
         this._eventDispatcher.start();
      }
      
      public function closeConnection() : void
      {
         this._eventDispatcher.removeEventListener(TimerEvent.TIMER,this.pollCommand);
         this._eventDispatcher.stop();
         this._eventDispatcher = null;
         this._avm1movie = null;
      }
      
      private function pollCommand(param1:Event) : void
      {
         var _loc2_:AVM1ServerEvent = null;
         var _loc3_:CommandEntry = null;
         if(this._avm1movie[INTERFACE_COMMAND_FROM_AVM1] != COMMAND_NULL)
         {
            _loc2_ = new AVM1ServerEvent(AVM1ServerEvent.EVENT_COMMAND_RECEIVED,this);
            _loc2_.command = this._avm1movie[INTERFACE_COMMAND_FROM_AVM1];
            _loc2_.param = this._avm1movie[INTERFACE_PARAM_FROM_AVM1];
            this._eventDispatcher.dispatchEvent(_loc2_);
         }
         if(this._avm1movie != null)
         {
            this._avm1movie[INTERFACE_COMMAND_FROM_AVM1] = COMMAND_NULL;
            this._avm1movie[INTERFACE_PARAM_FROM_AVM1] = PARAM_NULL;
         }
         if(this._commandPool.length > 0 && this._avm1movie[INTERFACE_COMMAND_FROM_AVM2] == COMMAND_NULL)
         {
            _loc3_ = this._commandPool.shift() as CommandEntry;
            this._avm1movie[INTERFACE_COMMAND_FROM_AVM2] = _loc3_.command;
            this._avm1movie[INTERFACE_PARAM_FROM_AVM2] = _loc3_.param;
         }
      }
      
      public function sendCommand(param1:int, param2:Number) : void
      {
         if(param1 == COMMAND_NULL)
         {
            throw new Error("The command should not be a null command");
         }
         var _loc3_:CommandEntry = new CommandEntry(param1,param2);
         this._commandPool.push(_loc3_);
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         this._eventDispatcher.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return this._eventDispatcher.dispatchEvent(param1);
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return this._eventDispatcher.hasEventListener(param1);
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         return this._eventDispatcher.removeEventListener(param1,param2,param3);
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return this._eventDispatcher.willTrigger(param1);
      }
   }
}

class CommandEntry
{
    
   
   private var _command:int;
   
   private var _param:Number;
   
   function CommandEntry(param1:int, param2:Number)
   {
      super();
      this._command = param1;
      this._param = param2;
   }
   
   public function get command() : int
   {
      return this._command;
   }
   
   public function get param() : Number
   {
      return this._param;
   }
}
