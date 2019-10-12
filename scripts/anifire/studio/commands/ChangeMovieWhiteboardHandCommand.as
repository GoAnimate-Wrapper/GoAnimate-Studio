package anifire.studio.commands
{
   import anifire.studio.assets.commands.ChangeWhiteboardHandCommand;
   import anifire.studio.assets.models.AssetTransition;
   import anifire.studio.core.Console;
   
   public class ChangeMovieWhiteboardHandCommand implements ICommand
   {
       
      
      private var _type:String = "ChangeMovieHandStyleCommand";
      
      private var _changeHandCommands:Array;
      
      private var _handStyle:int;
      
      public function ChangeMovieWhiteboardHandCommand(param1:Array, param2:int)
      {
         var _loc4_:AssetTransition = null;
         super();
         this._changeHandCommands = [];
         this._handStyle = param2;
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc4_ = param1[_loc3_];
            this._changeHandCommands.push(new ChangeWhiteboardHandCommand(_loc4_,param2,false));
            _loc3_++;
         }
      }
      
      public function execute() : void
      {
         var _loc2_:ChangeWhiteboardHandCommand = null;
         CommandStack.getInstance().putCommand(this);
         var _loc1_:int = 0;
         while(_loc1_ < this._changeHandCommands.length)
         {
            _loc2_ = this._changeHandCommands[_loc1_];
            _loc2_.execute();
            _loc1_++;
         }
         Console.getConsole().defaultHandStyle = this._handStyle;
      }
      
      public function undo() : void
      {
         var _loc2_:ChangeWhiteboardHandCommand = null;
         var _loc1_:int = 0;
         while(_loc1_ < this._changeHandCommands.length)
         {
            _loc2_ = this._changeHandCommands[_loc1_];
            _loc2_.undo();
            _loc1_++;
         }
      }
      
      public function redo() : void
      {
         var _loc2_:ChangeWhiteboardHandCommand = null;
         var _loc1_:int = 0;
         while(_loc1_ < this._changeHandCommands.length)
         {
            _loc2_ = this._changeHandCommands[_loc1_];
            _loc2_.redo();
            _loc1_++;
         }
      }
      
      public function toString() : String
      {
         return this._type;
      }
   }
}
