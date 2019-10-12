package anifire.studio.commands
{
   import anifire.util.UtilErrorLogger;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   
   public class CommandStack extends EventDispatcher
   {
      
      public static const MAX_STACK_SIZE:Number = 20;
      
      private static var __instance:CommandStack;
       
      
      private var _commands:Array;
      
      private var _index:int;
      
      public function CommandStack()
      {
         super();
         this.reset();
      }
      
      public static function getInstance() : CommandStack
      {
         if(!__instance)
         {
            __instance = new CommandStack();
         }
         return __instance;
      }
      
      public function putCommand(param1:ICommand) : void
      {
         UtilErrorLogger.getInstance().info("[COMMAND] " + param1.toString());
         var _loc2_:* = this._index++;
         this._commands[_loc2_] = param1;
         this._commands.splice(this._index);
         if(this._commands.length > MAX_STACK_SIZE)
         {
            this._commands.splice(0,1);
            this._index--;
         }
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function undo(param1:Boolean = true) : Boolean
      {
         var command:ICommand = null;
         var redoable:Boolean = param1;
         try
         {
            if(this._index > 0)
            {
               command = this._commands[--this._index];
               UtilErrorLogger.getInstance().info("[UNDO] " + command.toString());
               command.undo();
               if(!redoable)
               {
                  this._commands.splice(this._index);
               }
               dispatchEvent(new Event(Event.CHANGE));
               return true;
            }
         }
         catch(e:Error)
         {
            UtilErrorLogger.getInstance().appendCustomError("CommandStack:undo",e);
            this.reset();
         }
         return false;
      }
      
      public function redo() : Boolean
      {
         var command:ICommand = null;
         try
         {
            if(this._index < this._commands.length)
            {
               command = this._commands[this._index++];
               UtilErrorLogger.getInstance().info("[REDO] " + command.toString());
               command.redo();
               dispatchEvent(new Event(Event.CHANGE));
               return true;
            }
         }
         catch(e:Error)
         {
            UtilErrorLogger.getInstance().appendCustomError("CommandStack:redo",e);
            this.reset();
         }
         return false;
      }
      
      public function reset() : void
      {
         this._commands = new Array();
         this._index = 0;
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function get stack() : Array
      {
         return this._commands.concat();
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      public function get size() : int
      {
         return this._commands.length;
      }
   }
}
