package anifire.studio.commands
{
   public interface ICommand
   {
       
      
      function execute() : void;
      
      function undo() : void;
      
      function redo() : void;
      
      function toString() : String;
   }
}
