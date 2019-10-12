package anifire.studio.commands
{
   public class CrossSceneCollectiveCommand implements ICommand
   {
       
      
      protected var _type:String;
      
      protected var _commands:Vector.<ICommand>;
      
      protected var _undoable:Boolean = true;
      
      public function CrossSceneCollectiveCommand()
      {
         this._commands = new Vector.<ICommand>();
         super();
         this._type = "CrossSceneCollectiveCommand";
      }
      
      protected function addCommand(param1:ICommand) : void
      {
         if(param1)
         {
            this._commands.push(param1);
         }
      }
      
      public function execute() : void
      {
         var _loc1_:ICommand = null;
         if(this._commands)
         {
            for each(_loc1_ in this._commands)
            {
               _loc1_.execute();
            }
         }
         if(this._undoable)
         {
            this.putCommand();
         }
      }
      
      protected function putCommand() : void
      {
         CommandStack.getInstance().putCommand(this);
      }
      
      public function undo() : void
      {
         var _loc1_:ICommand = null;
         var _loc2_:int = 0;
         if(this._commands)
         {
            _loc2_ = 0;
            while(_loc2_ < this._commands.length)
            {
               _loc1_ = this._commands[this._commands.length - _loc2_ - 1];
               if(_loc1_)
               {
                  _loc1_.undo();
               }
               _loc2_++;
            }
         }
      }
      
      public function redo() : void
      {
         var _loc1_:ICommand = null;
         if(this._commands)
         {
            for each(_loc1_ in this._commands)
            {
               _loc1_.redo();
            }
         }
      }
      
      public function toString() : String
      {
         return this._type;
      }
   }
}
